import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'core/app_update_service.dart';
import 'core/klarando_api.dart';
import 'core/api_environment.dart';
import 'core/pairing_payload.dart';
import 'core/receipt_printing.dart';
import 'theme/klarando_theme.dart';

const _prefsCashierBaseUrl = 'klarando_cashier_base_url';
const _prefsCashierDisplayCode = 'klarando_cashier_display_code';
const _prefsCashierDeviceToken = 'klarando_cashier_device_token';
const _prefsCashierBindingId = 'klarando_cashier_binding_id';
const _prefsCashierDeviceSerial = 'klarando_cashier_device_serial';
const _prefsCashierDeviceAlias = 'klarando_cashier_device_alias';
const _prefsCashierPrinterMode = 'klarando_cashier_printer_mode';
const _prefsCashierPrinterHost = 'klarando_cashier_printer_host';
const _prefsCashierPrinterPort = 'klarando_cashier_printer_port';
const _secureCashierDeviceToken = 'klarando_cashier_secure_device_token';
const _secureCashierBindingId = 'klarando_cashier_secure_binding_id';
const _secureCashierDisplayCode = 'klarando_cashier_secure_display_code';
const _secureCashierTenantName = 'klarando_cashier_secure_tenant_name';
const _secureCashierAdmins = 'klarando_cashier_secure_admins';
const _secureCashierChainadmins = 'klarando_cashier_secure_chainadmins';
const _cashierCurrentVersionName = '1.0.0';
const _cashierCurrentVersionCode = 1;
const _klarandoImpressumUrl = 'https://www.klarando.com/impressum';
const _klarandoPrivacyUrl = 'https://www.klarando.com/datenschutz';
const _klarandoTermsUrl = 'https://www.klarando.com/agb';
const _klarandoCookiesUrl = 'https://www.klarando.com/cookies';
const _klarandoJugendschutzUrl = 'https://www.klarando.com/jugendschutz';

enum _DeskConnectionHealth { online, unstable, offline }

class _DeliveryMapPayload {
  const _DeliveryMapPayload({
    required this.destinationAddress,
    required this.destinationLabel,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.driverName,
    this.driverLatitude,
    this.driverLongitude,
  });

  final String destinationAddress;
  final String destinationLabel;
  final double? destinationLatitude;
  final double? destinationLongitude;
  final String? driverName;
  final double? driverLatitude;
  final double? driverLongitude;
}

class _GeoPoint {
  const _GeoPoint(this.latitude, this.longitude);

  final double latitude;
  final double longitude;
}

class KlarandoOrderDeskApp extends StatelessWidget {
  const KlarandoOrderDeskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klarando OrderDesk',
      debugShowCheckedModeBanner: false,
      theme: KlarandoTheme.materialTheme(),
      home: const _CashierDisplayHomePage(),
    );
  }
}

class _CashierDisplayHomePage extends StatefulWidget {
  const _CashierDisplayHomePage();

  @override
  State<_CashierDisplayHomePage> createState() =>
      _CashierDisplayHomePageState();
}

class _CashierDisplayHomePageState extends State<_CashierDisplayHomePage> {
  final _api = const KlarandoApi();
  final _appUpdateService = AppUpdateService();
  final _secureStorage = const FlutterSecureStorage();
  final _baseUrlController = TextEditingController(
    text: defaultApiBaseUrl,
  );
  final _displayCodeController = TextEditingController();
  final _pairingTokenController = TextEditingController();
  final _deviceSerialController = TextEditingController();
  final _deviceAliasController = TextEditingController();
  final _tcpHostController = TextEditingController();
  final _tcpPortController = TextEditingController(text: '9100');

  late final ReceiptPrintQueue _printQueue;

  Timer? _pollTimer;
  Timer? _uiTicker;
  bool _loading = false;
  bool _connected = false;
  bool _bindingLocked = false;
  String? _error;
  String? _info;
  String? _updateInfo;
  DateTime? _lastSuccessfulSyncAt;
  String? _connectedTenantName;
  List<OrderDeskContactUser> _connectedAdmins = const [];
  List<OrderDeskContactUser> _connectedChainadmins = const [];
  int _activeDriverDevices = 0;
  int _onlineDriverDevices = 0;
  DateTime _now = DateTime.now();
  bool _hasLoadedInitialFeed = false;
  final Map<String, String> _lastOrderStatusById = <String, String>{};
  final Set<String> _archivingOrderIds = <String>{};
  final Map<String, _GeoPoint> _destinationCoordinatesByOrderId =
      <String, _GeoPoint>{};
  final Set<String> _destinationGeocodeInFlight = <String>{};

  Future<void> _openExternalLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  EscPosPrinterMode _printerMode = EscPosPrinterMode.debugLog;
  PublicOrderDisplayFeed? _feed;
  List<ReceiptPrintQueueEntry> _queueEntries = const [];
  String? _deviceAuthToken;
  String? _bindingId;
  Timer? _heartbeatTimer;

  @override
  void initState() {
    super.initState();
    _uiTicker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || !_connected) {
        return;
      }
      setState(() {
        _now = DateTime.now();
      });
    });
    _printQueue = ReceiptPrintQueue(
      settings: _buildPrinterSettings(),
      onChanged: (entries) {
        if (!mounted) {
          return;
        }
        setState(() {
          _queueEntries = entries;
        });
      },
    );
    _loadPrefs();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_checkForAppUpdate(silentWhenCurrent: true));
    });
  }

  @override
  void dispose() {
    _pollTimer?.cancel();
    _heartbeatTimer?.cancel();
    _uiTicker?.cancel();
    _baseUrlController.dispose();
    _displayCodeController.dispose();
    _pairingTokenController.dispose();
    _deviceSerialController.dispose();
    _deviceAliasController.dispose();
    _tcpHostController.dispose();
    _tcpPortController.dispose();
    super.dispose();
  }

  EscPosPrinterSettings _buildPrinterSettings() {
    final parsedPort = int.tryParse(_tcpPortController.text.trim()) ?? 9100;
    return EscPosPrinterSettings(
      mode: _printerMode,
      tcpHost: _tcpHostController.text.trim().isEmpty
          ? null
          : _tcpHostController.text.trim(),
      tcpPort: parsedPort <= 0 ? 9100 : parsedPort,
    );
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final baseUrl = prefs.getString(_prefsCashierBaseUrl);
    final displayCode =
        await _secureRead(_secureCashierDisplayCode) ??
        prefs.getString(_prefsCashierDisplayCode);
    final deviceToken =
        await _secureRead(_secureCashierDeviceToken) ??
        prefs.getString(_prefsCashierDeviceToken);
    final bindingId =
        await _secureRead(_secureCashierBindingId) ??
        prefs.getString(_prefsCashierBindingId);
    final secureTenantName = await _secureRead(_secureCashierTenantName);
    final secureAdmins = await _secureRead(_secureCashierAdmins);
    final secureChainadmins = await _secureRead(_secureCashierChainadmins);
    final deviceSerial = prefs.getString(_prefsCashierDeviceSerial);
    final deviceAlias = prefs.getString(_prefsCashierDeviceAlias);
    final printerModeRaw = prefs.getString(_prefsCashierPrinterMode);
    final printerHost = prefs.getString(_prefsCashierPrinterHost);
    final printerPort = prefs.getString(_prefsCashierPrinterPort);

    if (baseUrl != null && baseUrl.trim().isNotEmpty) {
      _baseUrlController.text = baseUrl;
    }
    if (displayCode != null && displayCode.trim().isNotEmpty) {
      _displayCodeController.text = displayCode;
    }
    if (deviceAlias != null && deviceAlias.trim().isNotEmpty) {
      _deviceAliasController.text = deviceAlias;
    }
    if (deviceSerial != null && deviceSerial.trim().isNotEmpty) {
      _deviceSerialController.text = deviceSerial;
    } else {
      final generatedSerial = _generatePseudoSerial();
      _deviceSerialController.text = generatedSerial;
      await prefs.setString(_prefsCashierDeviceSerial, generatedSerial);
    }
    if (printerHost != null && printerHost.trim().isNotEmpty) {
      _tcpHostController.text = printerHost;
    }
    if (printerPort != null && printerPort.trim().isNotEmpty) {
      _tcpPortController.text = printerPort;
    }
    if (printerModeRaw != null) {
      _printerMode = EscPosPrinterMode.values.firstWhere(
        (entry) => entry.name == printerModeRaw,
        orElse: () => EscPosPrinterMode.debugLog,
      );
    }
    _deviceAuthToken = deviceToken;
    _bindingId = bindingId;
    _bindingLocked = (deviceToken ?? '').trim().isNotEmpty;
    _connectedTenantName = secureTenantName;
    if (secureAdmins != null) {
      final adminEmails = secureAdmins
          .split(';')
          .map((entry) => entry.trim())
          .where((entry) => entry.isNotEmpty)
          .toList(growable: false);
      _connectedAdmins = adminEmails
          .map((entry) => OrderDeskContactUser(name: entry, email: entry))
          .toList(growable: false);
    }
    if (secureChainadmins != null) {
      final chainadminEmails = secureChainadmins
          .split(';')
          .map((entry) => entry.trim())
          .where((entry) => entry.isNotEmpty)
          .toList(growable: false);
      _connectedChainadmins = chainadminEmails
          .map((entry) => OrderDeskContactUser(name: entry, email: entry))
          .toList(growable: false);
    }
    _printQueue.updateSettings(_buildPrinterSettings());
    if (mounted) {
      setState(() {});
    }
    if (_bindingLocked && _displayCodeController.text.trim().isNotEmpty) {
      unawaited(_connect());
    }
  }

  Future<void> _savePrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _prefsCashierBaseUrl,
      _normalizeBaseUrl(_baseUrlController.text),
    );
    await prefs.setString(
      _prefsCashierDisplayCode,
      _displayCodeController.text.trim(),
    );
    await _secureWrite(
      _secureCashierDisplayCode,
      _displayCodeController.text.trim(),
    );
    await prefs.setString(
      _prefsCashierDeviceSerial,
      _deviceSerialController.text.trim().toUpperCase(),
    );
    await prefs.setString(
      _prefsCashierDeviceAlias,
      _deviceAliasController.text.trim(),
    );
    await prefs.setString(_prefsCashierPrinterMode, _printerMode.name);
    await prefs.setString(
      _prefsCashierPrinterHost,
      _tcpHostController.text.trim(),
    );
    await prefs.setString(
      _prefsCashierPrinterPort,
      _tcpPortController.text.trim(),
    );
  }

  Future<void> _connect() async {
    if ((_deviceAuthToken ?? '').trim().isEmpty) {
      setState(() {
        _error = 'Bitte zuerst per QR-Code mit dem System verbinden.';
      });
      return;
    }

    final displayCode = _displayCodeController.text.trim();
    if (displayCode.isEmpty) {
      setState(() {
        _error = 'Bitte Display-Code eingeben.';
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
      _info = null;
    });
    try {
      await _savePrefs();
      _printQueue.updateSettings(_buildPrinterSettings());
      await _sendOrderDeskHeartbeatIfNeeded();
      await _pollFeed();
      _pollTimer?.cancel();
      _pollTimer = Timer.periodic(const Duration(seconds: 4), (_) {
        _pollFeed(silent: true);
      });
      _heartbeatTimer?.cancel();
      _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
        _sendOrderDeskHeartbeatIfNeeded(silent: true);
      });
      if (!mounted) {
        return;
      }
      setState(() {
        _connected = true;
        _lastSuccessfulSyncAt = DateTime.now();
        _info = 'Verbunden mit Display $displayCode';
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = error.message;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = error.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _pollFeed({bool silent = false}) async {
    await _sendOrderDeskHeartbeatIfNeeded(silent: true);
    final response = await _api.fetchPublicOrderDisplayFeed(
      baseUrl: _normalizeBaseUrl(_baseUrlController.text),
      displayCode: _displayCodeController.text.trim(),
    );
    if (!mounted) {
      return;
    }
    _handleOrderFeedSignals(response.orders);
    unawaited(_ensureDeliveryCoordinates(response.orders));
    setState(() {
      _feed = response;
      _now = DateTime.now();
      _lastSuccessfulSyncAt = DateTime.now();
      if (!silent) {
        _error = null;
      }
    });
  }

  Future<void> _secureWrite(String key, String? value) async {
    if (value == null || value.trim().isEmpty) {
      await _secureStorage.delete(key: key);
      return;
    }
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> _secureRead(String key) async {
    final value = await _secureStorage.read(key: key);
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    return value.trim();
  }

  void _handleOrderFeedSignals(List<PublicOrderSummary> orders) {
    final nextStatusByOrderId = <String, String>{
      for (final order in orders) order.id: order.status.trim().toLowerCase(),
    };

    if (!_hasLoadedInitialFeed) {
      _lastOrderStatusById
        ..clear()
        ..addAll(nextStatusByOrderId);
      _hasLoadedInitialFeed = true;
      return;
    }

    final hasNewOrder = orders.any(
      (order) => !_lastOrderStatusById.containsKey(order.id),
    );
    if (hasNewOrder) {
      unawaited(SystemSound.play(SystemSoundType.alert));
    }

    for (final order in orders) {
      final previousStatus = _lastOrderStatusById[order.id];
      final currentStatus = order.status.trim().toLowerCase();
      final becameDone = previousStatus != 'done' && currentStatus == 'done';
      if (becameDone) {
        unawaited(_archiveDeliveredOrder(order));
      }
    }

    _lastOrderStatusById
      ..clear()
      ..addAll(nextStatusByOrderId);
  }

  Future<void> _archiveDeliveredOrder(PublicOrderSummary order) async {
    if (_archivingOrderIds.contains(order.id)) {
      return;
    }
    _archivingOrderIds.add(order.id);
    try {
      await SystemSound.play(SystemSoundType.click);
      await _api.updatePublicOrderDisplayOrderStatus(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        status: 'archived',
      );
      if (!mounted) {
        return;
      }
      setState(() {
        _info = 'Lieferung erfolgreich abgeschlossen und archiviert.';
      });
    } catch (_) {
      // Silent fallback: Bestellung bleibt sichtbar, bis manueller Abschluss erfolgt.
    } finally {
      _archivingOrderIds.remove(order.id);
    }
  }

  Future<void> _ensureDeliveryCoordinates(List<PublicOrderSummary> orders) async {
    for (final order in orders) {
      if ((order.serviceType ?? '').toUpperCase() != 'DELIVERY') {
        continue;
      }
      if (_destinationCoordinatesByOrderId.containsKey(order.id) ||
          _destinationGeocodeInFlight.contains(order.id)) {
        continue;
      }
      final address =
          [order.customerAddress, order.customerZipCode, order.customerCity]
              .whereType<String>()
              .map((entry) => entry.trim())
              .where((entry) => entry.isNotEmpty)
              .join(', ');
      if (address.isEmpty) {
        continue;
      }
      _destinationGeocodeInFlight.add(order.id);
      try {
        final resolvedPoint = await _geocodeAddress(address);
        if (resolvedPoint != null) {
          _destinationCoordinatesByOrderId[order.id] = resolvedPoint;
          if (mounted) {
            setState(() {});
          }
        }
      } finally {
        _destinationGeocodeInFlight.remove(order.id);
      }
    }
  }

  Future<_GeoPoint?> _geocodeAddress(String address) async {
    try {
      final uri = Uri.https('nominatim.openstreetmap.org', '/search', {
        'q': address,
        'format': 'jsonv2',
        'limit': '1',
      });
      final response = await http.get(
        uri,
        headers: const {
          'Accept': 'application/json',
          'User-Agent': 'KlarandoOrderDesk/0.1.22',
        },
      );
      if (response.statusCode < 200 || response.statusCode >= 300) {
        return null;
      }
      final payload = jsonDecode(response.body);
      if (payload is! List || payload.isEmpty || payload.first is! Map) {
        return null;
      }
      final entry = payload.first as Map;
      final lat = double.tryParse('${entry['lat'] ?? ''}');
      final lon = double.tryParse('${entry['lon'] ?? ''}');
      if (lat == null || lon == null) {
        return null;
      }
      return _GeoPoint(lat, lon);
    } catch (_) {
      return null;
    }
  }

  Future<void> _acceptOrder(PublicOrderSummary order) async {
    final eta = await _askEtaMinutes(initial: order.estimatedMinutes ?? 20);
    if (eta == null) {
      return;
    }
    await _runOrderMutation(() async {
      await _api.acceptPublicOrderDisplayOrder(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        estimatedMinutes: eta,
      );
      await _pollFeed();
      _info = 'Bestellung angenommen (${eta} Min).';
    });
  }

  Future<void> _markPaid(PublicOrderSummary order) async {
    await _runOrderMutation(() async {
      await _api.updatePublicOrderDisplayPaymentStatus(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        paid: true,
      );
      await _api.updatePublicOrderDisplayOrderStatus(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        status: 'done',
      );
      await _pollFeed();
      final isPickup = (order.serviceType ?? '').toUpperCase() == 'PICKUP';
      _info = isPickup
          ? 'Bestellung als abgeholt markiert.'
          : 'Lieferung als abgeschlossen markiert.';
    });
  }

  Future<void> _rejectOrder(PublicOrderSummary order) async {
    await _runOrderMutation(() async {
      await _api.updatePublicOrderDisplayOrderStatus(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        status: 'rejected',
      );
      await _pollFeed();
      _info = 'Bestellung wurde abgelehnt.';
    });
  }

  Future<void> _setOrderStatus(
    PublicOrderSummary order,
    String status,
    String successMessage,
  ) async {
    await _runOrderMutation(() async {
      await _api.updatePublicOrderDisplayOrderStatus(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        status: status,
      );
      await _pollFeed();
      _info = successMessage;
    });
  }

  Future<void> _dispatchOrder(PublicOrderSummary order) async {
    final dispatchTarget = await _askDispatchTarget();
    if (dispatchTarget == null) {
      return;
    }
    await _runOrderMutation(() async {
      await _api.dispatchPublicOrderDisplayOrder(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        driverUserId: dispatchTarget.driverUserId,
        driverName: dispatchTarget.driverName,
        estimatedMinutes: order.estimatedMinutes ?? 30,
      );
      await _pollFeed();
      _info = 'Fahrer ${dispatchTarget.label} zugewiesen.';
    });
  }

  Future<void> _printOrder(
    PublicOrderSummary order, {
    String kind = 'both',
  }) async {
    await _runOrderMutation(() async {
      final jobsResponse = await _api.fetchPublicOrderDisplayReceiptJobs(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        displayCode: _displayCodeController.text.trim(),
        orderId: order.id,
        kind: kind,
      );
      if (jobsResponse.jobs.isEmpty) {
        throw const ApiException(
          'Keine Druckjobs für diese Bestellung erhalten.',
        );
      }
      for (final job in jobsResponse.jobs) {
        _printQueue.enqueue(orderId: order.id, job: job);
      }
      await _printQueue.process();
      if (_printerMode == EscPosPrinterMode.disabled) {
        _info = 'Druckjob erstellt (Drucker deaktiviert).';
      } else if (_printerMode == EscPosPrinterMode.debugLog) {
        final logPath = DebugLogEscPosPrinterTransport.lastLogFilePath;
        _info = logPath == null
            ? 'Debug-Druckjob protokolliert.'
            : 'Debug-Druckjob protokolliert: $logPath';
      } else {
        _info = 'Druckjob gesendet.';
      }
    });
  }

  Future<void> _runOrderMutation(Future<void> Function() action) async {
    if (_loading) {
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
      _info = null;
    });
    try {
      await action();
      if (mounted) {
        setState(() {});
      }
    } on ApiException catch (error) {
      if (mounted) {
        setState(() {
          _error = error.message;
        });
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _error = error.toString();
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _sendOrderDeskHeartbeatIfNeeded({bool silent = false}) async {
    final token = _deviceAuthToken;
    if (token == null || token.trim().isEmpty) {
      return;
    }

    try {
      final heartbeat = await _api.sendOrderDeskHeartbeat(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        authToken: token,
      );
      await _secureWrite(_secureCashierTenantName, heartbeat.tenantName);
      await _secureWrite(
        _secureCashierAdmins,
        heartbeat.admins.map((entry) => entry.email).join(';'),
      );
      await _secureWrite(
        _secureCashierChainadmins,
        heartbeat.chainadmins.map((entry) => entry.email).join(';'),
      );
      if (!mounted) {
        return;
      }
      setState(() {
        if (!silent) {
          _error = null;
        }
        _lastSuccessfulSyncAt = DateTime.now();
        _connectedTenantName = heartbeat.tenantName;
        _connectedAdmins = heartbeat.admins;
        _connectedChainadmins = heartbeat.chainadmins;
        _activeDriverDevices = heartbeat.activeDriverDevices;
        _onlineDriverDevices = heartbeat.onlineDriverDevices;
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      if (!silent) {
        setState(() {
          _error = error.message;
        });
      }
      if (error.statusCode == 403 || error.statusCode == 401) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove(_prefsCashierDeviceToken);
        await prefs.remove(_prefsCashierBindingId);
        await _secureStorage.delete(key: _secureCashierDeviceToken);
        await _secureStorage.delete(key: _secureCashierBindingId);
        await _secureStorage.delete(key: _secureCashierDisplayCode);
        await _secureStorage.delete(key: _secureCashierTenantName);
        await _secureStorage.delete(key: _secureCashierAdmins);
        await _secureStorage.delete(key: _secureCashierChainadmins);
        if (!mounted) {
          return;
        }
        setState(() {
          _deviceAuthToken = null;
          _bindingId = null;
          _bindingLocked = false;
          _connected = false;
          _connectedTenantName = null;
          _connectedAdmins = const [];
          _connectedChainadmins = const [];
          _activeDriverDevices = 0;
          _onlineDriverDevices = 0;
          _pollTimer?.cancel();
          _heartbeatTimer?.cancel();
          _info =
              'OrderDesk-Bindung ist nicht mehr aktiv. Bitte neuen QR-Code vom Admin anfordern.';
          _error = error.message;
        });
      }
    }
  }

  Future<void> _checkForAppUpdate({bool silentWhenCurrent = false}) async {
    await _runOrderMutation(() async {
      final result = await _appUpdateService.checkForUpdate(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        expectedFlavor: MobileAppFlavor.orderdesk,
      );
      if (!result.updateAvailable) {
        if (!silentWhenCurrent) {
          _updateInfo =
              'App ist aktuell (${result.currentVersion}+${result.currentBuildNumber}).';
        }
        return;
      }

      _updateInfo =
          'Update verfügbar: ${result.manifest.latestVersion}+${result.manifest.buildNumber}';

      if (!mounted) {
        return;
      }
      await _showUpdateDialog(result);
    });
  }

  Future<void> _showUpdateDialog(UpdateCheckResult result) async {
    final manifest = result.manifest;
    final shouldInstall = await showDialog<bool>(
      context: context,
      barrierDismissible: !result.forceUpdate,
      builder: (context) => AlertDialog(
        title: Text(result.forceUpdate ? 'Pflichtupdate verfügbar' : 'Update verfügbar'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Neue Version: ${manifest.latestVersion}+${manifest.buildNumber}'),
            const SizedBox(height: 8),
            Text(_appUpdateService.formatReleaseNotes(manifest.releaseNotes)),
          ],
        ),
        actions: [
          if (!result.forceUpdate)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Später'),
            ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Jetzt aktualisieren'),
          ),
        ],
      ),
    );

    if (shouldInstall != true) {
      return;
    }
    final apkUri = Uri.tryParse(manifest.apkUrl);
    if (apkUri == null) {
      setState(() {
        _error = 'Update-Link ist ungültig.';
      });
      return;
    }

    try {
      final apkFile = await _appUpdateService.downloadAndVerifyApk(
        apkUri: apkUri,
        sha256Hex: manifest.sha256,
      );
      await _appUpdateService.startApkInstallation(apkFile);
      if (!mounted) {
        return;
      }
      setState(() {
        _info = 'Installationsdialog wurde geöffnet.';
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = error.message;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = 'Update konnte nicht installiert werden: $error';
      });
    }
  }

  Future<void> _bindWithPairingToken([String? scannedPairingPayload]) async {
    final rawPairingInput =
        (scannedPairingPayload ?? _pairingTokenController.text).trim();
    final deviceSerial = _deviceSerialController.text.trim().toUpperCase();
    if (rawPairingInput.isEmpty) {
      setState(() {
        _error = 'Bitte Pairing-Token eintragen oder QR scannen.';
      });
      return;
    }
    if (deviceSerial.isEmpty) {
      setState(() {
        _error = 'Bitte eine Geräte-Seriennummer angeben.';
      });
      return;
    }

    final parsedPairing = parsePairingPayload(
      rawPairingInput,
      expectedType: PairingPayloadType.orderDesk,
    );
    if (parsedPairing == null) {
      setState(() {
        _error = 'Dieser QR-Code ist nicht für diese App geeignet.';
      });
      return;
    }

    var bindingSuccessful = false;
    await _runOrderMutation(() async {
      final response = await _api.bindOrderDeskDevice(
        baseUrl: parsedPairing.apiBaseUrl,
        pairingTokenOrPayload: parsedPairing.rawPayload,
        deviceSerial: deviceSerial,
        deviceAlias: _deviceAliasController.text.trim(),
        deviceModel: 'unknown',
        devicePlatform: 'flutter',
        appVersion: '$_cashierCurrentVersionName+$_cashierCurrentVersionCode',
      );

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _prefsCashierBaseUrl,
        _normalizeBaseUrl(_baseUrlController.text),
      );
      await prefs.setString(_prefsCashierDisplayCode, response.displayCode);
      await prefs.setString(_prefsCashierDeviceToken, response.authToken);
      await prefs.setString(_prefsCashierBindingId, response.binding.id);
      await _secureWrite(_secureCashierDisplayCode, response.displayCode);
      await _secureWrite(_secureCashierDeviceToken, response.authToken);
      await _secureWrite(_secureCashierBindingId, response.binding.id);
      await prefs.setString(
        _prefsCashierDeviceSerial,
        response.binding.deviceSerial,
      );
      await prefs.setString(
        _prefsCashierDeviceAlias,
        response.binding.deviceAlias ?? _deviceAliasController.text.trim(),
      );

      if (!mounted) {
        return;
      }

      setState(() {
        _baseUrlController.text = parsedPairing.apiBaseUrl;
        _displayCodeController.text = response.displayCode;
        _deviceAuthToken = response.authToken;
        _bindingId = response.binding.id;
        _bindingLocked = true;
        _connected = false;
        _lastSuccessfulSyncAt = null;
        _connectedTenantName = null;
        _connectedAdmins = const [];
        _connectedChainadmins = const [];
        _activeDriverDevices = 0;
        _onlineDriverDevices = 0;
        _pairingTokenController.clear();
        _info =
            'OrderDesk wurde mit ${response.displayCode} verbunden (${response.binding.deviceSerial}).';
      });
      bindingSuccessful = true;
    });
    if (bindingSuccessful) {
      await _connect();
    }
  }

  Future<void> _scanPairingTokenWithCamera() async {
    final scanResult = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => const _CashierQrScannerPage()),
    );
    final token = scanResult?.trim();
    if (token == null || token.isEmpty || !mounted) {
      return;
    }
    final parsedPairing = parsePairingPayload(
      token,
      expectedType: PairingPayloadType.orderDesk,
    );
    if (parsedPairing == null) {
      setState(() {
        _error = 'Dieser QR-Code ist nicht für diese App geeignet.';
      });
      return;
    }

    setState(() {
      _pairingTokenController.text = parsedPairing.rawPayload;
      _baseUrlController.text = parsedPairing.apiBaseUrl;
      _info = 'QR-Code erkannt. Gerät wird verbunden...';
      _error = null;
    });
    await _bindWithPairingToken(parsedPairing.rawPayload);
  }

  Future<void> _showConnectedAdminsDialog() async {
    if (!mounted) {
      return;
    }
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Verknüpftes System'),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Filiale/System: ${_connectedTenantName ?? '-'}'),
                  Text('Display: ${_displayCodeController.text.trim()}'),
                  Text('S/N: ${_deviceSerialController.text.trim()}'),
                  const SizedBox(height: 12),
                  const Text(
                    'Admins',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  if (_connectedAdmins.isEmpty)
                    const Text('Keine aktiven Admins gefunden.')
                  else
                    ..._connectedAdmins.map(
                      (entry) => Text('• ${entry.name} (${entry.email})'),
                    ),
                  const SizedBox(height: 10),
                  const Text(
                    'Kettenadmins',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  if (_connectedChainadmins.isEmpty)
                    const Text('Keine aktiven Kettenadmins gefunden.')
                  else
                    ..._connectedChainadmins.map(
                      (entry) => Text('• ${entry.name} (${entry.email})'),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Schließen'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _runDemoPrintFlow() async {
    await _runOrderMutation(() async {
      final orderId = 'demo_${DateTime.now().microsecondsSinceEpoch}';
      final customerJob = PublicOrderDisplayReceiptJob(
        kind: 'CUSTOMER',
        templateId: 'klarando.demo.customer.80mm.v1',
        codepage: 'UTF8',
        charsPerLine: 48,
        escposBase64: base64Encode(_buildDemoEscPosBytes('DEMO KUNDENBON')),
        escposHex: '',
        bytesLength: 0,
      );
      final kitchenJob = PublicOrderDisplayReceiptJob(
        kind: 'KITCHEN',
        templateId: 'klarando.demo.kitchen.80mm.v1',
        codepage: 'UTF8',
        charsPerLine: 48,
        escposBase64: base64Encode(_buildDemoEscPosBytes('DEMO KÜCHENBON')),
        escposHex: '',
        bytesLength: 0,
      );

      _printQueue.enqueue(orderId: orderId, job: customerJob);
      _printQueue.enqueue(orderId: orderId, job: kitchenJob);
      await _printQueue.process();

      if (_printerMode == EscPosPrinterMode.debugLog) {
        final logPath = DebugLogEscPosPrinterTransport.lastLogFilePath;
        _info = logPath == null
            ? 'Demo-Druckjob protokolliert.'
            : 'Demo-Druckjob protokolliert: $logPath';
      } else {
        _info = 'Demo-Druckjob verarbeitet.';
      }
    });
  }

  List<int> _buildDemoEscPosBytes(String headline) {
    final encoder = Utf8Encoder();
    return <int>[
      0x1b,
      0x40, // init
      0x1b,
      0x61,
      0x01, // center
      ...encoder.convert(headline),
      0x0a,
      ...encoder.convert('Klarando Testmodus'),
      0x0a,
      ...encoder.convert(DateTime.now().toIso8601String()),
      0x0a,
      0x0a,
      0x1d,
      0x56,
      0x01, // cut
    ];
  }

  _DeskConnectionHealth _connectionHealth(DateTime now) {
    if (!_connected || _lastSuccessfulSyncAt == null) {
      return _DeskConnectionHealth.offline;
    }
    final ageSeconds = now.difference(_lastSuccessfulSyncAt!).inSeconds;
    if (ageSeconds < 30) {
      return _DeskConnectionHealth.online;
    }
    if (ageSeconds <= 120) {
      return _DeskConnectionHealth.unstable;
    }
    return _DeskConnectionHealth.offline;
  }

  String _connectionStatusLabel(_DeskConnectionHealth health) {
    switch (health) {
      case _DeskConnectionHealth.online:
        return 'Online';
      case _DeskConnectionHealth.unstable:
        return 'Instabil';
      case _DeskConnectionHealth.offline:
        return 'Offline';
    }
  }

  Color _connectionStatusColor(_DeskConnectionHealth health) {
    switch (health) {
      case _DeskConnectionHealth.online:
        return const Color(0xFF16A34A);
      case _DeskConnectionHealth.unstable:
        return const Color(0xFFEAB308);
      case _DeskConnectionHealth.offline:
        return const Color(0xFFDC2626);
    }
  }

  _DeliveryMapPayload? _resolveDeliveryMapPayload(PublicOrderSummary order) {
    if ((order.serviceType ?? '').toUpperCase() != 'DELIVERY') {
      return null;
    }
    final parts =
        [order.customerAddress, order.customerZipCode, order.customerCity]
            .whereType<String>()
            .map((entry) => entry.trim())
            .where((entry) => entry.isNotEmpty)
            .toList(growable: false);
    if (parts.isEmpty && order.driverLocation == null) {
      return null;
    }
    final destinationAddress = parts.join(', ');
    final destinationPoint = _destinationCoordinatesByOrderId[order.id];
    return _DeliveryMapPayload(
      destinationAddress: destinationAddress,
      destinationLabel: destinationAddress.isEmpty
          ? 'Zieladresse wird geladen…'
          : destinationAddress,
      destinationLatitude: destinationPoint?.latitude,
      destinationLongitude: destinationPoint?.longitude,
      driverName: order.assignedDriverName,
      driverLatitude: order.driverLocation?.latitude,
      driverLongitude: order.driverLocation?.longitude,
    );
  }

  Future<void> _showServiceActionsSheet() async {
    if (!mounted) {
      return;
    }
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Servicebereich',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Nur für Support/Admin: Gerät zurücksetzen entfernt die OrderDesk-Bindung auf diesem Gerät.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF52525B)),
                ),
                const SizedBox(height: 12),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _resetLocalBinding();
                  },
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Gerät trennen / zurücksetzen'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _resetLocalBinding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsCashierDisplayCode);
    await prefs.remove(_prefsCashierDeviceToken);
    await prefs.remove(_prefsCashierBindingId);
    await _secureStorage.delete(key: _secureCashierDeviceToken);
    await _secureStorage.delete(key: _secureCashierBindingId);
    await _secureStorage.delete(key: _secureCashierDisplayCode);
    await _secureStorage.delete(key: _secureCashierTenantName);
    await _secureStorage.delete(key: _secureCashierAdmins);
    await _secureStorage.delete(key: _secureCashierChainadmins);

    _pollTimer?.cancel();
    _heartbeatTimer?.cancel();
    if (!mounted) {
      return;
    }
    setState(() {
      _deviceAuthToken = null;
      _bindingId = null;
      _bindingLocked = false;
      _connected = false;
      _connectedTenantName = null;
      _connectedAdmins = const [];
      _connectedChainadmins = const [];
      _displayCodeController.clear();
      _pairingTokenController.clear();
      _info = 'Gerät wurde zurückgesetzt. Bitte erneut per QR-Code verbinden.';
      _error = null;
      _feed = null;
      _lastSuccessfulSyncAt = null;
    });
  }

  String _buildOsmMapHtml(_DeliveryMapPayload payload) {
    final destinationLat = payload.destinationLatitude;
    final destinationLng = payload.destinationLongitude;
    final driverLat = payload.driverLatitude;
    final driverLng = payload.driverLongitude;
    final hasDestination = destinationLat != null && destinationLng != null;
    final hasDriver = driverLat != null && driverLng != null;
    final centerLat = hasDestination
        ? destinationLat
        : hasDriver
        ? driverLat
        : 50.9375;
    final centerLng = hasDestination
        ? destinationLng
        : hasDriver
        ? driverLng
        : 6.9603;

    final destinationMarker = hasDestination
        ? "L.marker([$destinationLat, $destinationLng]).addTo(map).bindPopup('Kunde');"
        : '';
    final driverMarker = hasDriver
        ? "L.circleMarker([$driverLat, $driverLng], {radius: 8, color: '#2563EB', fillColor: '#2563EB', fillOpacity: 0.9}).addTo(map).bindPopup('Fahrer');"
        : '';
    final routeLine = hasDestination && hasDriver
        ? "L.polyline([[$driverLat, $driverLng], [$destinationLat, $destinationLng]], {color: '#2563EB', weight: 4, opacity: 0.75}).addTo(map);"
        : '';
    final fitBounds = hasDestination && hasDriver
        ? "map.fitBounds([[$destinationLat, $destinationLng], [$driverLat, $driverLng]], {padding:[30,30]});"
        : hasDestination
        ? "map.setView([$destinationLat, $destinationLng], 15);"
        : hasDriver
        ? "map.setView([$driverLat, $driverLng], 14);"
        : "map.setView([$centerLat, $centerLng], 12);";

    return '''
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>
  <style>html, body, #map { height: 100%; margin: 0; padding: 0; }</style>
</head>
<body>
  <div id="map"></div>
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
  <script>
    const map = L.map('map', { zoomControl: false, attributionControl: false });
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19
    }).addTo(map);
    $destinationMarker
    $driverMarker
    $routeLine
    $fitBounds
  </script>
</body>
</html>
''';
  }

  String _buildOsmSearchUrl(_DeliveryMapPayload payload) {
    final hasDestination =
        payload.destinationLatitude != null && payload.destinationLongitude != null;
    if (hasDestination) {
      return 'https://www.openstreetmap.org/?mlat=${payload.destinationLatitude!.toStringAsFixed(6)}&mlon=${payload.destinationLongitude!.toStringAsFixed(6)}#map=16/${payload.destinationLatitude!.toStringAsFixed(6)}/${payload.destinationLongitude!.toStringAsFixed(6)}';
    }
    final destination = Uri.encodeComponent(payload.destinationAddress);
    final hasDriverPosition =
        payload.driverLatitude != null && payload.driverLongitude != null;
    if (hasDriverPosition) {
      return 'https://www.openstreetmap.org/?mlat=${payload.driverLatitude!.toStringAsFixed(6)}&mlon=${payload.driverLongitude!.toStringAsFixed(6)}#map=15/${payload.driverLatitude!.toStringAsFixed(6)}/${payload.driverLongitude!.toStringAsFixed(6)}';
    }
    return 'https://www.openstreetmap.org/search?query=$destination';
  }

  String _orderStatusLabel(String value) {
    switch (value.trim().toLowerCase()) {
      case 'pending_payment':
        return 'Offen';
      case 'open':
        return 'Offen';
      case 'accepted':
        return 'Angenommen';
      case 'preparing':
        return 'In Zubereitung';
      case 'ready_for_pickup':
        return 'Bereit zur Abholung';
      case 'ready_for_delivery':
        return 'Bereit für Lieferung';
      case 'out_for_delivery':
        return 'Fahrer unterwegs';
      case 'delivered':
        return 'Geliefert';
      case 'done':
        return 'Fertig';
      case 'archived':
        return 'Archiviert';
      case 'rejected':
        return 'Abgelehnt';
      default:
        return value;
    }
  }

  String _formatTimeAgo(DateTime timestamp) {
    final diff = DateTime.now().difference(timestamp);
    if (diff.inSeconds < 60) {
      return 'gerade eben';
    }
    if (diff.inMinutes < 60) {
      return 'vor ${diff.inMinutes} min';
    }
    return 'vor ${diff.inHours} h';
  }

  String _paymentStatusLabel(String value) {
    switch (value.trim().toUpperCase()) {
      case 'PAID':
        return 'BEZAHLT';
      case 'UNPAID':
        return 'UNBEZAHLT';
      default:
        return value;
    }
  }

  String _generatePseudoSerial() {
    final random = Random();
    const alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    final buffer = StringBuffer('OD-');
    for (var i = 0; i < 12; i += 1) {
      buffer.write(alphabet[random.nextInt(alphabet.length)]);
    }
    return buffer.toString();
  }

  Future<int?> _askEtaMinutes({required int initial}) async {
    const etaOptions = <int>[15, 20, 30, 45, 60];
    var selected = etaOptions.first;
    for (final option in etaOptions) {
      if ((option - initial).abs() < (selected - initial).abs()) {
        selected = option;
      }
    }

    final result = await showDialog<int>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Wann ist die Bestellung fertig?'),
          content: StatefulBuilder(
            builder: (context, setDialogState) {
              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: etaOptions
                    .map(
                      (entry) => ChoiceChip(
                        label: Text('$entry min'),
                        selected: selected == entry,
                        onSelected: (_) {
                          setDialogState(() {
                            selected = entry;
                          });
                        },
                      ),
                    )
                    .toList(growable: false),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Abbrechen'),
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pop(selected);
              },
              child: const Text('Übernehmen'),
            ),
          ],
        );
      },
    );
    return result;
  }

  Future<_DispatchTarget?> _askDispatchTarget() async {
    final drivers = _feed?.drivers ?? const <PublicOrderDisplayDriver>[];
    final activeDriverDevices =
        (_feed?.activeDriverDevices ?? const <PublicOrderDisplayDriverDevice>[])
            .where((entry) => entry.isActive)
            .toList(growable: false);

    final options = <_DispatchTarget>[
      ...drivers.map(
        (entry) => _DispatchTarget(
          label: entry.name,
          detail: 'Fahrerkonto',
          driverUserId: entry.id,
          driverName: entry.name,
        ),
      ),
      ...activeDriverDevices
          .where((entry) => (entry.driverName ?? '').trim().isNotEmpty)
          .map(
            (entry) => _DispatchTarget(
              label: entry.driverName!.trim(),
              detail:
                  '${entry.isOnline ? 'Online' : 'Offline'} • Gerät: ${entry.deviceLabel}',
              driverUserId: entry.driverUserId,
              driverName: entry.driverName!.trim(),
            ),
          ),
    ];

    if (options.isEmpty) {
      setState(() {
        _error = 'Keine aktiven Fahrer oder Fahrgeräte gefunden.';
      });
      return null;
    }

    return showDialog<_DispatchTarget>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Fahrer wählen'),
          content: SizedBox(
            width: 420,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: options
                    .map(
                      (entry) => ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(entry.label),
                        subtitle: entry.detail == null
                            ? null
                            : Text(entry.detail!),
                        onTap: () => Navigator.of(context).pop(entry),
                      ),
                    )
                    .toList(growable: false),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Abbrechen'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _copyOsmLink(_DeliveryMapPayload payload) async {
    final url = _buildOsmSearchUrl(payload);
    await Clipboard.setData(ClipboardData(text: url));
    if (!mounted) {
      return;
    }
    setState(() {
      _info = 'OpenStreetMap-Link wurde kopiert.';
    });
  }

  Widget _buildOrderDeliveryMap(PublicOrderSummary order) {
    final payload = _resolveDeliveryMapPayload(order);
    if (payload == null) {
      return const SizedBox.shrink();
    }
    final hasDriverPosition =
        payload.driverLatitude != null && payload.driverLongitude != null;
    final hasDestination =
        payload.destinationLatitude != null &&
        payload.destinationLongitude != null;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFFDBA74)),
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFFFFBEB),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lieferkarte',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 160,
                width: double.infinity,
                child: _OsmMapEmbed(
                  query: payload.destinationLabel,
                  mapHtml: _buildOsmMapHtml(payload),
                ),
              ),
            ),
            const SizedBox(height: 6),
            if (!hasDestination)
              const Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'Lieferadresse vorhanden, Karte wird vorbereitet…',
                  style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                ),
              ),
            if (!hasDriverPosition)
              const Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'Fahrerposition wird geladen…',
                  style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                ),
              ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    payload.driverName == null
                        ? payload.destinationLabel
                        : '${payload.destinationLabel}\nFahrer: ${payload.driverName}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                TextButton.icon(
                  onPressed: () => _copyOsmLink(payload),
                  icon: const Icon(Icons.copy, size: 16),
                  label: const Text('OSM-Link'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutForDeliveryStrip(List<PublicOrderSummary> orders) {
    final underwayOrders = orders
        .where((entry) => entry.status.trim().toLowerCase() == 'out_for_delivery')
        .toList(growable: false);
    if (underwayOrders.isEmpty) {
      return const SizedBox.shrink();
    }
    final groupedByDriver = <String, List<PublicOrderSummary>>{};
    for (final order in underwayOrders) {
      final key = (order.assignedDriverName ?? 'Nicht zugewiesen').trim();
      groupedByDriver.putIfAbsent(key.isEmpty ? 'Nicht zugewiesen' : key, () => []);
      groupedByDriver[key.isEmpty ? 'Nicht zugewiesen' : key]!.add(order);
    }

    final palette = <Color>[
      const Color(0xFF1D4ED8),
      const Color(0xFF047857),
      const Color(0xFF7C3AED),
      const Color(0xFFBE185D),
      const Color(0xFFB45309),
    ];
    final driverNames = groupedByDriver.keys.toList(growable: false)..sort();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (var index = 0; index < driverNames.length; index += 1)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: palette[index % palette.length].withValues(alpha: 0.13),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: palette[index % palette.length].withValues(alpha: 0.35),
                  ),
                ),
                child: Text(
                  '${driverNames[index]} · ${groupedByDriver[driverNames[index]]!.length} unterwegs',
                  style: TextStyle(
                    color: palette[index % palette.length],
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final orders = _feed?.orders ?? const <PublicOrderSummary>[];
    final visibleOrders = orders
        .where((entry) => entry.status.trim().toLowerCase() != 'archived')
        .toList(growable: false);
    final deliveryOrders = orders
        .where(
          (entry) =>
              (entry.serviceType ?? '').toUpperCase() == 'DELIVERY' &&
              entry.status.trim().toLowerCase() != 'done' &&
              entry.status.trim().toLowerCase() != 'archived',
        )
        .toList(growable: false);
    final pickupOrders = orders
        .where(
          (entry) =>
              (entry.serviceType ?? '').toUpperCase() == 'PICKUP' &&
              entry.status.trim().toLowerCase() != 'done' &&
              entry.status.trim().toLowerCase() != 'archived',
        )
        .toList(growable: false);
    PublicOrderSummary? firstDeliveryOrderWithAddress;
    for (final order in deliveryOrders) {
      if (_resolveDeliveryMapPayload(order) != null) {
        firstDeliveryOrderWithAddress = order;
        break;
      }
    }
    final now = DateTime.now();
    final health = _connectionHealth(now);
    final statusText = _connectionStatusLabel(health);
    final statusColor = _connectionStatusColor(health);
    final isOperationalView = _bindingLocked && _connected;
    final showOperationalActions = isOperationalView;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color(0xFFF97316),
        foregroundColor: Colors.white,
        title: Row(
          children: [
            GestureDetector(
              onDoubleTap: _showConnectedAdminsDialog,
              child: Image.asset(
                'assets/klarando_icon.png',
                width: 26,
                height: 26,
              ),
            ),
            const SizedBox(width: 8),
            const Text('Klarando OrderDesk'),
            const SizedBox(width: 8),
            Text(
              'v0.1.22',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                children: [
                  Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: statusColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    statusText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_activeDriverDevices > 0)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.directions_car,
                      color: Color(0xFF22C55E),
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$_activeDriverDevices',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (_onlineDriverDevices > 0) ...[
                      const SizedBox(width: 4),
                      Text(
                        '(${_onlineDriverDevices} online)',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          if (showOperationalActions)
            IconButton(
              tooltip: 'Aktualisieren',
              onPressed: _loading
                  ? null
                  : () => _runOrderMutation(() => _pollFeed()),
              icon: const Icon(Icons.refresh),
            ),
          IconButton(
            tooltip: 'Servicebereich',
            onPressed: _showServiceActionsSheet,
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF97316), Color(0xFF6D28D9)],
            ),
          ),
          child: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              if (isOperationalView)
                _buildOperationalStatusCard(statusText: statusText, statusColor: statusColor)
              else
                _buildConnectionCard(),
              const SizedBox(height: 8),
              if (_error != null)
                Text(
                  _error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              if (_info != null && !isOperationalView)
                Text(_info!, style: const TextStyle(color: Colors.white)),
              if (_updateInfo != null && !isOperationalView)
                Text(
                  _updateInfo!,
                  style: const TextStyle(color: Color(0xFFFFF7ED)),
                ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text('Bestellungen: ${visibleOrders.length}')),
                  Chip(
                    label: Text('Lieferungen offen: ${deliveryOrders.length}'),
                  ),
                  Chip(label: Text('Abholungen offen: ${pickupOrders.length}')),
                ],
              ),
              const SizedBox(height: 8),
              _buildOutForDeliveryStrip(orders),
              if (deliveryOrders.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildDeliveryMapCard(
                  firstDeliveryOrderWithAddress ?? deliveryOrders.first,
                  deliveryOrders,
                ),
              ],
              const SizedBox(height: 12),
              if (!_connected)
                const Card(
                  child: Padding(
                    padding: EdgeInsets.all(14),
                    child: Text(
                      'Gerät ist nicht verbunden. Bitte QR-Code aus dem Adminbereich scannen.',
                    ),
                  ),
                )
              else ...[
                ...visibleOrders.map(_buildOrderCard),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectionCard() {
    if (_bindingLocked && !_connected) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Gerät wird verbunden',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text('Verbindung zum zugewiesenen Betrieb wird hergestellt...'),
              const SizedBox(height: 10),
              FilledButton.icon(
                onPressed: _loading ? null : _connect,
                icon: const Icon(Icons.refresh),
                label: Text(_loading ? 'Bitte warten…' : 'Erneut versuchen'),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/klarando_icon.png', width: 28, height: 28),
                const SizedBox(width: 8),
                const Text(
                  'Klarando OrderDesk',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Gerät mit Betrieb verbinden'),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _loading ? null : _scanPairingTokenWithCamera,
              icon: const Icon(Icons.qr_code_scanner),
              label: Text(_loading ? 'Bitte warten…' : 'QR-Code scannen'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Hinweis: Der QR-Code wird im Klarando Admin/Superadmin erzeugt und ist sicher zeitlich begrenzt.',
              style: TextStyle(fontSize: 12, color: Color(0xFF52525B)),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                TextButton(
                  onPressed: () => _openExternalLink(_klarandoImpressumUrl),
                  child: const Text('Impressum'),
                ),
                TextButton(
                  onPressed: () => _openExternalLink(_klarandoPrivacyUrl),
                  child: const Text('Datenschutz'),
                ),
                TextButton(
                  onPressed: () => _openExternalLink(_klarandoTermsUrl),
                  child: const Text('AGB'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationalStatusCard({
    required String statusText,
    required Color statusColor,
  }) {
    final tenantName = (_connectedTenantName ?? '').trim();
    final lastSync = _lastSuccessfulSyncAt == null
        ? 'Noch kein Sync'
        : _formatTimeAgo(_lastSuccessfulSyncAt!);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tenantName.isEmpty ? 'Filiale verbunden' : tenantName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '$statusText • Letzter Sync: $lastSync',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderCard(PublicOrderSummary order) {
    final isPaid = order.paymentStatus.toUpperCase() == 'PAID';
    final isDelivery = (order.serviceType ?? '').toUpperCase() == 'DELIVERY';
    final isPickup = (order.serviceType ?? '').toUpperCase() == 'PICKUP';
    final statusLower = order.status.trim().toLowerCase();
    final hasModifiers = order.items.any((entry) => entry.modifierNames.isNotEmpty);
    final waitMinutes = order.createdAt == null
        ? null
        : _now.difference(order.createdAt!).inMinutes;
    final progressMinutes = order.acceptedAt == null
        ? null
        : _now.difference(order.acceptedAt!).inMinutes;
    final doneMinutes = (statusLower == 'done' && order.driverDepartedAt != null)
        ? _now.difference(order.driverDepartedAt!).inMinutes
        : null;
    final timerColor = waitMinutes == null
        ? const Color(0xFF475569)
        : waitMinutes >= 20
        ? const Color(0xFFB91C1C)
        : waitMinutes >= 10
        ? const Color(0xFFDC2626)
        : waitMinutes >= 5
        ? const Color(0xFFD97706)
        : const Color(0xFF166534);
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bestellung ${order.pickupNumber?.toString() ?? order.id.substring(0, 8)}',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isDelivery
                    ? const Color(0xFFF97316)
                    : const Color(0xFF0EA5E9),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                isDelivery ? 'LIEFERUNG' : 'ABHOLUNG',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${order.customerName ?? '-'} • ${order.customerPhone ?? '-'}',
            ),
            if (order.assignedDriverName != null &&
                order.assignedDriverName!.trim().isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.local_shipping,
                      size: 16,
                      color: Color(0xFF2563EB),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Fahrer: ${order.assignedDriverName}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                  ],
                ),
              ),
            Text(
              '${isDelivery ? 'Lieferung' : 'Abholung'} • ${_orderStatusLabel(order.status)} • ${order.total.toStringAsFixed(2)} EUR',
            ),
            if (isDelivery &&
                (order.assignedDriverName == null ||
                    order.assignedDriverName!.trim().isEmpty))
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Noch kein Fahrer zugewiesen.',
                  style: TextStyle(
                    color: Color(0xFFB45309),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            const SizedBox(height: 4),
            if (statusLower == 'open' || statusLower == 'pending_payment')
              Text(
                'Wartet seit ${waitMinutes ?? 0} Min.',
                style: TextStyle(
                  color: timerColor,
                  fontWeight: FontWeight.w700,
                ),
              )
            else if (statusLower == 'preparing' || statusLower == 'out_for_delivery')
              Text(
                'In Bearbeitung seit ${progressMinutes ?? 0} Min.',
                style: const TextStyle(
                  color: Color(0xFF0F172A),
                  fontWeight: FontWeight.w600,
                ),
              )
            else if (statusLower == 'done')
              Text(
                'Fertig seit ${doneMinutes ?? 0} Min.',
                style: const TextStyle(
                  color: Color(0xFF166534),
                  fontWeight: FontWeight.w700,
                ),
              ),
            Text(
              'Zahlung: ${_paymentStatusLabel(order.paymentStatus)}${order.paymentMethod != null ? ' (${order.paymentMethod})' : ''}',
              style: TextStyle(
                color: isPaid
                    ? const Color(0xFF0F172A)
                    : const Color(0xFFDC2626),
                fontWeight: isPaid ? FontWeight.w500 : FontWeight.w800,
              ),
            ),
            if (!isPaid)
              const Text(
                'UNBEZAHLT',
                style: TextStyle(
                  color: Color(0xFFDC2626),
                  fontWeight: FontWeight.w800,
                ),
              ),
            if (order.items.isNotEmpty) ...[
              const SizedBox(height: 8),
              ...order.items.take(5).map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('- ${item.quantity}x ${item.productName}'),
                      if (item.modifierNames.isNotEmpty)
                        Wrap(
                          spacing: 6,
                          runSpacing: 4,
                          children: item.modifierNames
                              .map(
                                (modifier) => Chip(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: VisualDensity.compact,
                                  label: Text(
                                    modifier,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                  avatar: const Icon(Icons.edit_note, size: 14),
                                ),
                              )
                              .toList(growable: false),
                        ),
                    ],
                  ),
                );
              }),
              if (hasModifiers)
                const Text(
                  'Sonderwünsche vorhanden',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF92400E),
                  ),
                ),
            ],
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (statusLower == 'open' || statusLower == 'pending_payment')
                  FilledButton.icon(
                    onPressed: _loading ? null : () => _acceptOrder(order),
                    icon: const Icon(Icons.check_circle, size: 16),
                    label: const Text('Annehmen'),
                  ),
                if (statusLower == 'open' || statusLower == 'pending_payment')
                  OutlinedButton.icon(
                    onPressed: _loading ? null : () => _rejectOrder(order),
                    icon: const Icon(Icons.close, size: 16),
                    label: const Text('Ablehnen'),
                  ),
                if (statusLower != 'open' && statusLower != 'pending_payment')
                  FilledButton.tonalIcon(
                    onPressed: _loading
                        ? null
                        : () => _setOrderStatus(
                            order,
                            'preparing',
                            'Bestellung ist jetzt in Vorbereitung.',
                          ),
                    icon: const Icon(Icons.restaurant, size: 16),
                    label: const Text('In Vorbereitung'),
                  ),
                FilledButton.tonalIcon(
                  onPressed: _loading || !isDelivery
                      ? null
                      : () => _dispatchOrder(order),
                  icon: const Icon(Icons.local_shipping, size: 16),
                  label: Text(
                    order.assignedDriverName == null
                        ? 'Fahrer zuweisen'
                        : 'Fahrer wechseln',
                    ),
                ),
                if (statusLower != 'open' && statusLower != 'pending_payment')
                  FilledButton.tonalIcon(
                    onPressed: _loading ? null : () => _acceptOrder(order),
                    icon: const Icon(Icons.schedule, size: 16),
                    label: const Text('Zeit aktualisieren'),
                  ),
                if (isPickup)
                  OutlinedButton.icon(
                    onPressed: _loading
                        ? null
                        : () => _setOrderStatus(
                            order,
                            'ready_for_pickup',
                            'Bestellung ist bereit zur Abholung.',
                          ),
                    icon: const Icon(Icons.storefront, size: 16),
                    label: const Text('Bereit zur Abholung'),
                  ),
                if (isPickup)
                  OutlinedButton.icon(
                    onPressed: _loading || isPaid ? null : () => _markPaid(order),
                    icon: const Icon(Icons.check_circle_outline, size: 16),
                    label: const Text('Bestellung abgeholt'),
                  ),
                if (isDelivery)
                  OutlinedButton.icon(
                    onPressed: _loading
                        ? null
                        : () => _setOrderStatus(
                            order,
                            'ready_for_delivery',
                            'Bestellung ist bereit für die Lieferung.',
                          ),
                    icon: const Icon(Icons.delivery_dining, size: 16),
                    label: const Text('Bereit für Lieferung'),
                  ),
                if (isDelivery)
                  OutlinedButton.icon(
                    onPressed: _loading
                        ? null
                        : () => _setOrderStatus(
                            order,
                            'out_for_delivery',
                            'Fahrer ist unterwegs.',
                          ),
                    icon: const Icon(Icons.local_shipping, size: 16),
                    label: const Text('Fahrer unterwegs'),
                  ),
                if (isDelivery)
                  OutlinedButton.icon(
                    onPressed: _loading || isPaid ? null : () => _markPaid(order),
                    icon: const Icon(Icons.check_circle_outline, size: 16),
                    label: const Text('Lieferung abgeschlossen'),
                  ),
                OutlinedButton.icon(
                  onPressed: _loading
                      ? null
                      : () => _printOrder(order, kind: 'both'),
                  icon: const Icon(Icons.print, size: 16),
                  label: const Text('Drucken'),
                ),
                TextButton(
                  onPressed: _loading
                      ? null
                      : () => _printOrder(order, kind: 'kitchen'),
                  child: const Text('Küchenbon'),
                ),
                TextButton(
                  onPressed: _loading
                      ? null
                      : () => _printOrder(order, kind: 'customer'),
                  child: const Text('Kundenbon'),
                ),
              ],
            ),
            if (isDelivery) _buildOrderDeliveryMap(order),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryMapCard(
    PublicOrderSummary baseOrder,
    List<PublicOrderSummary> pendingDeliveryOrders,
  ) {
    final payloads = pendingDeliveryOrders
        .map((order) => _resolveDeliveryMapPayload(order))
        .whereType<_DeliveryMapPayload>()
        .toList(growable: false);
    if (payloads.isEmpty) {
      return const SizedBox.shrink();
    }
    final payload = _resolveDeliveryMapPayload(baseOrder) ?? payloads.first;
    final hasDriverPosition = payloads.any(
      (entry) => entry.driverLatitude != null && entry.driverLongitude != null,
    );
    final hasDestination = payloads.any(
      (entry) =>
          entry.destinationLatitude != null && entry.destinationLongitude != null,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kunden-Lieferkarte',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: _OsmMapEmbed(
                  query: payload.destinationLabel,
                  mapHtml: _buildFleetMapHtml(pendingDeliveryOrders),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Offene Lieferstopps: ${pendingDeliveryOrders.length}',
              style: const TextStyle(fontSize: 12),
            ),
            if (!hasDestination)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Lieferadresse vorhanden, Karte noch nicht verfügbar.',
                  style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                ),
              ),
            if (!hasDriverPosition)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  'Fahrerposition wird geladen…',
                  style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                ),
              ),
            const SizedBox(height: 4),
            TextButton.icon(
              onPressed: () => _copyOsmLink(payload),
              icon: const Icon(Icons.copy, size: 16),
              label: const Text('OpenStreetMap-Link kopieren'),
            ),
            const SizedBox(height: 4),
            const Text(
              'Noch anzufahrende Kunden:',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            if (pendingDeliveryOrders.isEmpty)
              const Text('Keine aktiven Lieferstopps.')
            else
              ...pendingDeliveryOrders.take(6).toList().asMap().entries.map((
                entry,
              ) {
                final number = entry.key + 1;
                final order = entry.value;
                final customer = order.customerName ?? 'Unbekannt';
                final address =
                    [
                          order.customerAddress,
                          order.customerZipCode,
                          order.customerCity,
                        ]
                        .whereType<String>()
                        .where((value) => value.trim().isNotEmpty)
                        .join(', ');
                return Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    '$number. $customer${address.isEmpty ? '' : ' – $address'}',
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  String _buildFleetMapHtml(List<PublicOrderSummary> orders) {
    final destinationMarkers = <String>[];
    final driverMarkers = <String>[];
    final routeLines = <String>[];
    final bounds = <String>[];

    for (final order in orders) {
      final payload = _resolveDeliveryMapPayload(order);
      if (payload == null) {
        continue;
      }
      final hasDestination =
          payload.destinationLatitude != null && payload.destinationLongitude != null;
      final hasDriver = payload.driverLatitude != null && payload.driverLongitude != null;
      final orderLabel = (order.pickupNumber?.toString() ?? order.id.substring(0, 8))
          .replaceAll("'", '');
      final customer = (order.customerName ?? 'Unbekannt').replaceAll("'", '');
      final status = _orderStatusLabel(order.status).replaceAll("'", '');
      if (hasDestination) {
        final lat = payload.destinationLatitude!;
        final lng = payload.destinationLongitude!;
        bounds.add('[$lat, $lng]');
        destinationMarkers.add(
          "L.marker([$lat, $lng]).addTo(map).bindPopup('Kunde $orderLabel: $customer ($status)');",
        );
      }
      if (hasDriver) {
        final lat = payload.driverLatitude!;
        final lng = payload.driverLongitude!;
        bounds.add('[$lat, $lng]');
        final driverName = (payload.driverName ?? 'Nicht zugewiesen')
            .replaceAll("'", '');
        driverMarkers.add(
          "L.circleMarker([$lat, $lng], {radius: 8, color: '#2563EB', fillColor: '#2563EB', fillOpacity: 0.9}).addTo(map).bindPopup('Fahrer: $driverName');",
        );
      }
      if (hasDestination && hasDriver) {
        routeLines.add(
          "L.polyline([[${payload.driverLatitude}, ${payload.driverLongitude}], [${payload.destinationLatitude}, ${payload.destinationLongitude}]], {color: '#2563EB', weight: 3, opacity: 0.7}).addTo(map);",
        );
      }
    }

    final fitBounds = bounds.isEmpty
        ? 'map.setView([50.9375, 6.9603], 12);'
        : 'map.fitBounds([${bounds.join(',')}], {padding:[20,20]});';

    return '''
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"/>
  <style>html, body, #map { height: 100%; margin: 0; padding: 0; }</style>
</head>
<body>
  <div id="map"></div>
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
  <script>
    const map = L.map('map', { zoomControl: false, attributionControl: false });
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', { maxZoom: 19 }).addTo(map);
    ${destinationMarkers.join('\n')}
    ${driverMarkers.join('\n')}
    ${routeLines.join('\n')}
    $fitBounds
  </script>
</body>
</html>
''';
  }
}

class _OsmMapEmbed extends StatefulWidget {
  const _OsmMapEmbed({required this.query, required this.mapHtml});

  final String query;
  final String mapHtml;

  @override
  State<_OsmMapEmbed> createState() => _OsmMapEmbedState();
}

class _OsmMapEmbedState extends State<_OsmMapEmbed> {
  late final WebViewController _controller;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (_) {
            if (!mounted) {
              return;
            }
            setState(() {
              _hasError = true;
            });
          },
          onNavigationRequest: (request) {
            if (request.url.startsWith('https://') ||
                request.url.startsWith('about:blank') ||
                request.url.startsWith('data:')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      );
    _loadMap();
  }

  @override
  void didUpdateWidget(covariant _OsmMapEmbed oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mapHtml != widget.mapHtml) {
      _hasError = false;
      _loadMap();
    }
  }

  Future<void> _loadMap() async {
    try {
      await _controller.loadHtmlString(widget.mapHtml);
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        color: const Color(0xFFFDE68A),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Text(
          'Karte konnte nicht geladen werden.\n${widget.query}',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      );
    }
    return WebViewWidget(controller: _controller);
  }
}

class _CashierQrScannerPage extends StatefulWidget {
  const _CashierQrScannerPage();

  @override
  State<_CashierQrScannerPage> createState() => _CashierQrScannerPageState();
}

class _CashierQrScannerPageState extends State<_CashierQrScannerPage> {
  late final MobileScannerController _controller;
  bool _handlingResult = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      formats: const [BarcodeFormat.qrCode],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleDetection(BarcodeCapture capture) async {
    if (_handlingResult) {
      return;
    }
    final value = capture.barcodes
        .map((entry) => entry.rawValue?.trim())
        .whereType<String>()
        .firstWhere((entry) => entry.isNotEmpty, orElse: () => '');
    if (value.isEmpty) {
      return;
    }

    _handlingResult = true;
    await _controller.stop();
    if (!mounted) {
      return;
    }
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OrderDesk QR scannen')),
      body: Stack(
        children: [
          MobileScanner(controller: _controller, onDetect: _handleDetection),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.black54,
              padding: const EdgeInsets.all(12),
              child: const Text(
                'QR-Code aus dem Adminbereich in den Rahmen halten.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DispatchTarget {
  const _DispatchTarget({
    required this.label,
    required this.driverName,
    required this.driverUserId,
    this.detail,
  });

  final String label;
  final String driverName;
  final String? driverUserId;
  final String? detail;
}

String _normalizeBaseUrl(String value) {
  return normalizeApiBaseUrl(value);
}

