import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
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
const _prefsCashierOrderToneRepeatSeconds =
    'klarando_cashier_order_tone_repeat_seconds';
const _secureCashierDeviceToken = 'klarando_cashier_secure_device_token';
const _secureCashierBindingId = 'klarando_cashier_secure_binding_id';
const _secureCashierDisplayCode = 'klarando_cashier_secure_display_code';
const _secureCashierTenantName = 'klarando_cashier_secure_tenant_name';
const _secureCashierAdmins = 'klarando_cashier_secure_admins';
const _secureCashierChainadmins = 'klarando_cashier_secure_chainadmins';
const _secureCashierManualTenantId = 'klarando_cashier_secure_manual_tenant_id';
const _secureCashierManualAdminCode = 'klarando_cashier_secure_manual_admin_code';
const _cashierCurrentVersionName = '0.1.22';
const _cashierCurrentVersionCode = 22;
const _cashierCommitShort = String.fromEnvironment(
  'KLARANDO_COMMIT',
  defaultValue: 'dev',
);
const _klarandoImpressumUrl = 'https://www.klarando.com/impressum';
const _klarandoPrivacyUrl = 'https://www.klarando.com/datenschutz';
const _klarandoTermsUrl = 'https://www.klarando.com/agb';
const _klarandoCookiesUrl = 'https://www.klarando.com/cookies';
const _klarandoJugendschutzUrl = 'https://www.klarando.com/jugendschutz';
const _orderDeskNewOrderAudioAsset = 'assets/audio/orderdesk_new_order.mp3';
const _orderDeskNewOrderAudioSource = 'audio/orderdesk_new_order.mp3';
const _heartbeatFailureOfflineThreshold = 3;

enum _DeskConnectionHealth { online, checking, degraded, offline }

class _OrderDeskLogEntry {
  const _OrderDeskLogEntry({
    required this.timestamp,
    required this.category,
    required this.message,
  });

  final DateTime timestamp;
  final String category;
  final String message;
}

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
  final _manualTokenController = TextEditingController();
  final _pairingTokenFocusNode = FocusNode();
  final _deviceSerialController = TextEditingController();
  final _deviceAliasController = TextEditingController();
  final _manualTenantIdController = TextEditingController();
  final _manualAdminCodeController = TextEditingController();
  final _tcpHostController = TextEditingController();
  final _tcpPortController = TextEditingController(text: '9100');

  late final ReceiptPrintQueue _printQueue;

  Timer? _pollTimer;
  Timer? _uiTicker;
  Timer? _newOrderRepeatTimer;
  AudioPlayer? _newOrderAudioPlayer;
  bool _newOrderAudioPlaying = false;
  bool _loading = false;
  bool _connected = false;
  bool _bindingLocked = false;
  bool _showManualConnection = false;
  final Map<String, bool> _orderDetailExpandedById = <String, bool>{};
  String? _error;
  String? _info;
  String? _pairingInputDebug;
  String? _updateInfo;
  DateTime? _lastSuccessfulSyncAt;
  String? _connectedTenantName;
  List<OrderDeskContactUser> _connectedAdmins = const [];
  List<OrderDeskContactUser> _connectedChainadmins = const [];
  int _activeDriverDevices = 0;
  int _onlineDriverDevices = 0;
  DateTime _now = DateTime.now();
  bool _isReconnecting = false;
  bool _heartbeatInFlight = false;
  int _consecutiveHeartbeatFailures = 0;
  int _consecutiveApiFailures = 0;
  DateTime? _lastHeartbeatAt;
  DateTime? _lastOrdersLoadAt;
  DateTime? _lastReconnectAttemptAt;
  String? _lastHeartbeatError;
  String? _lastApiError;
  String? _lastHeartbeatEndpointUrl;
  int? _lastHeartbeatHttpStatus;
  String? _lastHeartbeatResponseBody;
  int? _lastBindHttpStatus;
  String? _lastBindResponseBody;
  String? _lastStoredTokenType;
  bool _hasLoadedInitialFeed = false;
  final List<_OrderDeskLogEntry> _localErrorLog = <_OrderDeskLogEntry>[];
  final Map<String, String> _lastOrderStatusById = <String, String>{};
  final Set<String> _pendingNewOrderIds = <String>{};
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
  int _orderToneRepeatSeconds = 60;
  DateTime? _lastOrderTonePlayedAt;
  String? _lastOrderToneError;

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
    _newOrderRepeatTimer?.cancel();
    _newOrderRepeatTimer = null;
    _uiTicker?.cancel();
    _newOrderRepeatTimer?.cancel();
    _baseUrlController.dispose();
    _displayCodeController.dispose();
    _pairingTokenController.dispose();
    _manualTokenController.dispose();
    _pairingTokenFocusNode.dispose();
    _deviceSerialController.dispose();
    _deviceAliasController.dispose();
    _manualTenantIdController.dispose();
    _manualAdminCodeController.dispose();
    _tcpHostController.dispose();
    _tcpPortController.dispose();
    unawaited(_disposeNewOrderAudioController());
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
    final manualTenantId = await _secureRead(_secureCashierManualTenantId);
    final manualAdminCode = await _secureRead(_secureCashierManualAdminCode);
    final deviceSerial = prefs.getString(_prefsCashierDeviceSerial);
    final deviceAlias = prefs.getString(_prefsCashierDeviceAlias);
    final printerModeRaw = prefs.getString(_prefsCashierPrinterMode);
    final printerHost = prefs.getString(_prefsCashierPrinterHost);
    final printerPort = prefs.getString(_prefsCashierPrinterPort);
    final orderToneRepeatRaw =
        prefs.getInt(_prefsCashierOrderToneRepeatSeconds) ?? 60;

    if (baseUrl != null && baseUrl.trim().isNotEmpty) {
      _baseUrlController.text = baseUrl;
    }
    if (displayCode != null && displayCode.trim().isNotEmpty) {
      _displayCodeController.text = displayCode;
    }
    if (deviceAlias != null && deviceAlias.trim().isNotEmpty) {
      _deviceAliasController.text = deviceAlias;
    }
    if (manualTenantId != null && manualTenantId.trim().isNotEmpty) {
      _manualTenantIdController.text = manualTenantId.trim();
    }
    if (manualAdminCode != null && manualAdminCode.trim().isNotEmpty) {
      _manualAdminCodeController.text = manualAdminCode.trim();
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
    if (orderToneRepeatRaw == 0 ||
        orderToneRepeatRaw == 30 ||
        orderToneRepeatRaw == 60 ||
        orderToneRepeatRaw == 120) {
      _orderToneRepeatSeconds = orderToneRepeatRaw;
    } else {
      _orderToneRepeatSeconds = 60;
    }
    _deviceAuthToken = deviceToken;
    _bindingId = bindingId;
    _lastStoredTokenType = _detectStoredTokenType(deviceToken);
    _bindingLocked =
        (bindingId ?? '').trim().isNotEmpty &&
        (deviceToken ?? '').trim().isNotEmpty &&
        _isSessionToken(deviceToken);
    _connectedTenantName = secureTenantName;
    if (secureAdmins != null) {
      final adminEmails = secureAdmins
          .split(';')
          .map((entry) => entry.trim())
          .where((entry) => entry.isNotEmpty)
          .toList(growable: false);
      _connectedAdmins = adminEmails
          .map<OrderDeskContactUser>(
            (entry) => OrderDeskContactUser(
              id: entry,
              name: entry,
              email: entry,
            ),
          )
          .toList(growable: false);
    }
    if (secureChainadmins != null) {
      final chainadminEmails = secureChainadmins
          .split(';')
          .map((entry) => entry.trim())
          .where((entry) => entry.isNotEmpty)
          .toList(growable: false);
      _connectedChainadmins = chainadminEmails
          .map<OrderDeskContactUser>(
            (entry) => OrderDeskContactUser(
              id: entry,
              name: entry,
              email: entry,
            ),
          )
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
    await prefs.setString(_prefsCashierDeviceToken, (_deviceAuthToken ?? '').trim());
    await prefs.setString(_prefsCashierBindingId, (_bindingId ?? '').trim());
    await _secureWrite(
      _secureCashierDisplayCode,
      _displayCodeController.text.trim(),
    );
    await _secureWrite(_secureCashierDeviceToken, _deviceAuthToken);
    await _secureWrite(_secureCashierBindingId, _bindingId);
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
    await prefs.setInt(
      _prefsCashierOrderToneRepeatSeconds,
      _orderToneRepeatSeconds,
    );
    await _secureWrite(
      _secureCashierManualTenantId,
      _manualTenantIdController.text.trim(),
    );
    await _secureWrite(
      _secureCashierManualAdminCode,
      _manualAdminCodeController.text.trim(),
    );
  }

  Future<void> _persistState() async {
    await _savePrefs();
    _printQueue.updateSettings(_buildPrinterSettings());
  }

  Future<void> _testPrinter() async {
    if (_printerMode == EscPosPrinterMode.disabled) {
      if (!mounted) return;
      setState(() {
        _info = 'Drucker ist deaktiviert. Bitte zuerst Drucker einrichten.';
      });
      return;
    }
    await _runDemoPrintFlow();
  }

  Future<void> _connect() async {
    if ((_deviceAuthToken ?? '').trim().isEmpty) {
      setState(() {
        _error = 'Bitte zuerst per QR-Code mit dem System verbinden.';
      });
      return;
    }
    if (!_isSessionToken(_deviceAuthToken)) {
      setState(() {
        _error =
            'Kein gültiger Session-Token gespeichert. Bitte Gerät im Servicebereich neu koppeln.';
      });
      return;
    }
    if ((_bindingId ?? '').trim().isEmpty) {
      setState(() {
        _error = 'Keine Binding-ID gespeichert. Bitte Gerät im Servicebereich neu koppeln.';
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
      _lastReconnectAttemptAt = DateTime.now();
    });
    _appendLocalLog('CONNECT', 'Verbindungsaufbau gestartet');
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
        _lastOrdersLoadAt = DateTime.now();
        _showManualConnection = false;
        _info = 'Verbunden mit Display $displayCode';
      });
      _appendLocalLog('CONNECT', 'Verbunden mit Display $displayCode');
      _appendStatusSnapshot();
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = error.message;
      });
      _appendLocalLog('CONNECT', 'Fehler: ${error.message}');
      _appendStatusSnapshot();
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _error = error.toString();
      });
      _appendLocalLog('CONNECT', 'Fehler: $error');
      _appendStatusSnapshot();
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Future<void> _pollFeed({bool silent = false}) async {
    try {
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
        _lastOrdersLoadAt = DateTime.now();
        _connected = true;
        _isReconnecting = false;
        _consecutiveApiFailures = 0;
        _lastApiError = null;
        if (!silent) {
          _error = null;
        }
      });
      _appendLocalLog('ORDERS', 'loaded: ${response.orders.length}');
      _appendStatusSnapshot();
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isReconnecting = true;
        _consecutiveApiFailures += 1;
        _lastApiError = error.message;
        if (!silent) {
          _error = error.message;
        }
      });
      _appendLocalLog('ORDERS', 'failed: ${error.message}');
      _appendStatusSnapshot();
      if (!silent) {
        rethrow;
      }
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isReconnecting = true;
        _consecutiveApiFailures += 1;
        _lastApiError = error.toString();
        if (!silent) {
          _error = error.toString();
        }
      });
      _appendLocalLog('ORDERS', 'failed: $error');
      _appendStatusSnapshot();
      if (!silent) {
        rethrow;
      }
    }
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

    _pendingNewOrderIds.removeWhere((orderId) {
      final status = nextStatusByOrderId[orderId];
      if (status == null) {
        return true;
      }
      return !_isUnacceptedOrderStatus(status);
    });

    final hasNewUnacceptedOrder = orders.any((order) {
      final status = order.status.trim().toLowerCase();
      final isNew = !_lastOrderStatusById.containsKey(order.id);
      if (isNew && _isUnacceptedOrderStatus(status)) {
        _pendingNewOrderIds.add(order.id);
        return true;
      }
      return false;
    });
    if (hasNewUnacceptedOrder) {
      _triggerOrderTone();
    } else {
      _ensureOrderToneRepeatState();
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

  bool _isUnacceptedOrderStatus(String statusLower) {
    return statusLower == 'open' || statusLower == 'pending_payment';
  }

  void _triggerOrderTone() {
    unawaited(_playNewOrderSound());
    _ensureOrderToneRepeatState();
  }

  void _ensureOrderToneRepeatState() {
    if (_pendingNewOrderIds.isEmpty || _orderToneRepeatSeconds <= 0) {
      _newOrderRepeatTimer?.cancel();
      _newOrderRepeatTimer = null;
      return;
    }
    if (_newOrderRepeatTimer != null) {
      return;
    }
    _newOrderRepeatTimer = Timer.periodic(
      Duration(seconds: _orderToneRepeatSeconds),
      (_) {
        if (_pendingNewOrderIds.isEmpty) {
          _newOrderRepeatTimer?.cancel();
          _newOrderRepeatTimer = null;
          return;
        }
        unawaited(_playNewOrderSound());
      },
    );
  }

  Future<void> _updateOrderToneRepeatSeconds(int seconds) async {
    if (seconds != 0 && seconds != 30 && seconds != 60 && seconds != 120) {
      return;
    }
    setState(() {
      _orderToneRepeatSeconds = seconds;
    });
    await _persistState();
    _appendLocalLog(
      'AUDIO',
      'Bestellton Intervall: ${seconds == 0 ? 'aus' : '${seconds}s'}',
    );
    _ensureOrderToneRepeatState();
  }

  Future<void> _playNewOrderSound() async {
    if (_newOrderAudioPlaying) {
      return;
    }
    _newOrderAudioPlaying = true;
    try {
      if (_newOrderAudioPlayer == null) {
        final player = AudioPlayer();
        _newOrderAudioPlayer = player;
        player.onPlayerComplete.listen((_) {
          _newOrderAudioPlaying = false;
        });
      }
      final player = _newOrderAudioPlayer;
      if (player == null) {
        _newOrderAudioPlaying = false;
        return;
      }
      await player.stop();
      await player.play(AssetSource(_orderDeskNewOrderAudioSource));
      _lastOrderTonePlayedAt = DateTime.now();
      _lastOrderToneError = null;
      _appendLocalLog('AUDIO', 'Bestellton abgespielt');
      if (mounted) {
        setState(() {});
      }
    } catch (error) {
      _lastOrderToneError = error.toString();
      _appendLocalLog('AUDIO', 'Bestellton fehlgeschlagen: $error');
      if (mounted) {
        setState(() {});
      }
      _newOrderAudioPlaying = false;
    }
  }

  Future<void> _disposeNewOrderAudioController() async {
    final player = _newOrderAudioPlayer;
    _newOrderAudioPlayer = null;
    if (player == null) {
      return;
    }
    try {
      await player.dispose();
    } catch (_) {
      // Ignore dispose errors to keep app shutdown stable.
    }
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
    if (_heartbeatInFlight) {
      return;
    }
    _lastReconnectAttemptAt = DateTime.now();
    _lastHeartbeatEndpointUrl =
        '${_normalizeBaseUrl(_baseUrlController.text)}/api/orderdesk-devices/public/heartbeat';
    _heartbeatInFlight = true;

    try {
      final heartbeat = await _api.sendOrderDeskHeartbeat(
        baseUrl: _normalizeBaseUrl(_baseUrlController.text),
        authToken: token,
      ).timeout(const Duration(seconds: 12));
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
        _lastHeartbeatAt = DateTime.now();
        _lastHeartbeatHttpStatus = 200;
        _lastHeartbeatResponseBody = null;
        _connected = true;
        _isReconnecting = false;
        _consecutiveHeartbeatFailures = 0;
        _lastHeartbeatError = null;
        _lastStoredTokenType = _detectStoredTokenType(_deviceAuthToken);
        _bindingId = heartbeat.bindingId;
        _connectedTenantName = heartbeat.tenantName;
        _connectedAdmins = heartbeat.admins;
        _connectedChainadmins = heartbeat.chainadmins;
        _activeDriverDevices = heartbeat.activeDriverDevices;
        _onlineDriverDevices = heartbeat.onlineDriverDevices;
      });
      await _secureWrite(_secureCashierBindingId, heartbeat.bindingId);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsCashierBindingId, heartbeat.bindingId);
      _appendLocalLog('HEARTBEAT', 'ok');
      _appendStatusSnapshot();
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      _consecutiveHeartbeatFailures += 1;
      if (!silent) {
        setState(() {
          _error = error.message;
        });
      }
      setState(() {
        _isReconnecting = true;
        _lastHeartbeatError = error.message;
        _lastHeartbeatHttpStatus = error.statusCode;
        _lastHeartbeatResponseBody = error.responseBody == null
            ? null
            : jsonEncode(error.responseBody);
        _connected = _lastOrdersLoadAt != null;
      });
      _appendLocalLog('HEARTBEAT', 'failed: ${error.message}');
      _appendStatusSnapshot();
      if (error.statusCode == 403 || error.statusCode == 401) {
        if (!mounted) {
          return;
        }
        setState(() {
          _info =
              'Heartbeat abgelehnt (Session ungültig/abgelaufen). Bindung bleibt gespeichert.';
          _error = error.message;
        });
      }
    } on TimeoutException {
      if (!mounted) {
        return;
      }
      _consecutiveHeartbeatFailures += 1;
      setState(() {
        _isReconnecting = true;
        _lastHeartbeatError = 'Heartbeat-Timeout';
        _lastHeartbeatHttpStatus = null;
        _lastHeartbeatResponseBody = null;
        _connected = _lastOrdersLoadAt != null;
        if (!silent) {
          _error = 'Verbindung zum Klarando-Server hat zu lange gedauert.';
        }
      });
      _appendLocalLog('HEARTBEAT', 'failed: timeout');
      _appendStatusSnapshot();
    } catch (error) {
      if (!mounted) {
        return;
      }
      _consecutiveHeartbeatFailures += 1;
      setState(() {
        _isReconnecting = true;
        _lastHeartbeatError = error.toString();
        _lastHeartbeatHttpStatus = null;
        _lastHeartbeatResponseBody = null;
        _connected = _lastOrdersLoadAt != null;
        if (!silent) {
          _error = error.toString();
        }
      });
      _appendLocalLog('HEARTBEAT', 'failed: $error');
      _appendStatusSnapshot();
    } finally {
      _heartbeatInFlight = false;
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

    final parseResult = parsePairingPayloadDetailed(
      rawPairingInput,
      expectedType: PairingPayloadType.orderDesk,
    );
    final parsedPairing = parseResult.payload;
    setState(() {
      final detectedType = switch (parseResult.detectedType) {
        PairingPayloadType.orderDesk => 'ORDER_DESK_PAIRING',
        PairingPayloadType.driver => 'DRIVER_PAIRING',
        null => 'unbekannt',
      };
      final apiStatus = parseResult.hasApiBaseUrl
          ? 'ja'
          : (parseResult.usingDefaultApiBaseUrl ? 'Standard verwendet' : 'nein');
      _pairingInputDebug =
          'Typ: $detectedType · Token: ${parseResult.hasToken ? 'ja' : 'nein'} · API-URL: $apiStatus';
    });
    if (parsedPairing == null) {
      setState(() {
        _error = _pairingParseErrorMessage(parseResult.failure);
      });
      return;
    }

    var bindingSuccessful = false;
    await _runOrderMutation(() async {
      OrderDeskBindResponse response;
      try {
        response = await _api.bindOrderDeskDevice(
          baseUrl: parsedPairing.apiBaseUrl,
          pairingTokenOrPayload: parsedPairing.rawPayload,
          deviceSerial: deviceSerial,
          deviceAlias: _deviceAliasController.text.trim(),
          deviceModel: 'unknown',
          devicePlatform: 'flutter',
          appVersion: '$_cashierCurrentVersionName+$_cashierCurrentVersionCode',
        );
      } on ApiException catch (error) {
        if (mounted) {
          setState(() {
            _lastBindHttpStatus = error.statusCode;
            _lastBindResponseBody = error.responseBody == null
                ? null
                : jsonEncode(error.responseBody);
          });
        }
        throw _mapOrderDeskBindingError(error);
      }

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
        _lastStoredTokenType = _detectStoredTokenType(response.authToken);
        _bindingLocked = true;
        _connected = false;
        _lastBindHttpStatus = 200;
        _lastBindResponseBody = null;
        _lastSuccessfulSyncAt = null;
        _connectedTenantName = null;
        _connectedAdmins = const [];
        _connectedChainadmins = const [];
        _activeDriverDevices = 0;
        _onlineDriverDevices = 0;
        _pairingTokenController.clear();
        _manualTokenController.clear();
        _showManualConnection = false;
        _info =
            'OrderDesk wurde mit ${response.displayCode} verbunden (${response.binding.deviceSerial}).';
      });
      bindingSuccessful = true;
    });
    if (bindingSuccessful) {
      await _connect();
    }
  }

  Future<void> _connectWithEnteredBindingCode({bool fromEnter = false}) async {
    if (_loading) {
      return;
    }
    final token = _pairingTokenController.text.trim();
    if (token.isEmpty) {
      setState(() {
        _error = 'Bitte einen Binding-Code scannen oder einfügen.';
      });
      return;
    }
    setState(() {
      _info = fromEnter
          ? 'Scanner-Eingabe erkannt. Gerät wird mit Klarando verbunden …'
          : 'Gerät wird mit Klarando verbunden …';
      _isReconnecting = true;
      _error = null;
    });
    await _bindWithPairingToken(token);
  }

  Future<void> _saveManualConnection() async {
    if (_loading) {
      return;
    }
    final manualToken = _manualTokenController.text.trim();
    final manualDisplayCode = _displayCodeController.text.trim();
    final manualApiBaseUrl = _normalizeBaseUrl(
      _baseUrlController.text.trim().isEmpty
          ? defaultApiBaseUrl
          : _baseUrlController.text,
    );

    if (manualDisplayCode.isEmpty) {
      setState(() {
        _error = 'Bitte DisplayCode/Gerätename eintragen.';
      });
      return;
    }
    if (manualToken.isEmpty) {
      setState(() {
        _error = 'Bitte PairingToken oder manuellen Gerätecode eintragen.';
      });
      return;
    }

    setState(() {
      _error = null;
      _info = 'Gerät wird manuell mit Klarando verbunden …';
      _baseUrlController.text = manualApiBaseUrl;
    });

    // Try full pairing/bind first. Pairing codes must be exchanged via bind to receive a SESSION auth token.
    await _bindWithPairingToken(manualToken);
    if (_bindingLocked && _connected) {
      if (mounted) {
        setState(() {
          _showManualConnection = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Einstellungen gespeichert')),
        );
      }
      return;
    }

    if (!mounted) {
      return;
    }
    setState(() {
      _error =
          'Manuelle Verbindung fehlgeschlagen. Bitte gültigen Pairing-Code aus dem Admin verwenden.';
      _info = null;
      _connected = false;
      _bindingLocked = false;
    });
  }

  String _pairingParseErrorMessage(PairingPayloadParseFailure? failure) {
    switch (failure) {
      case PairingPayloadParseFailure.empty:
      case PairingPayloadParseFailure.unreadable:
        return 'Scanner-Code konnte nicht gelesen werden. Bitte Scanner-Tastaturmodus prüfen oder neuen Code erzeugen.';
      case PairingPayloadParseFailure.wrongType:
        return 'QR-Code hat den falschen Typ. Bitte einen OrderDesk-Code verwenden.';
      case PairingPayloadParseFailure.missingToken:
        return 'Pairing-Token fehlt im QR-Code. Bitte neuen Code im Admin erzeugen.';
      case null:
        return 'QR-Code konnte nicht gelesen werden. Bitte Code neu scannen.';
    }
  }

  ApiException _mapOrderDeskBindingError(ApiException error) {
    final status = error.statusCode;
    if (status == 410) {
      return ApiException(
        'Der QR-Code ist abgelaufen. Bitte neuen Code erzeugen.',
        statusCode: 410,
        responseBody: error.responseBody,
      );
    }
    if (status == 400 || status == 422) {
      return ApiException(
        'Der QR-Code oder Pairing-Token ist ungültig. ${error.message}',
        statusCode: status,
        responseBody: error.responseBody,
      );
    }
    if (status == 401 || status == 403) {
      return ApiException(
        'Server hat den Token abgelehnt. Bitte neuen OrderDesk-Code erzeugen.',
        statusCode: status,
        responseBody: error.responseBody,
      );
    }
    if (status == null) {
      return const ApiException('Keine Verbindung zum Klarando-Server. Bitte Netzwerk prüfen.');
    }
    return error;
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
    if (!_bindingLocked) {
      return _DeskConnectionHealth.offline;
    }
    final heartbeatFailed = _consecutiveHeartbeatFailures >= _heartbeatFailureOfflineThreshold;
    final apiFailed = _consecutiveApiFailures >= _heartbeatFailureOfflineThreshold;
    final hasOrdersSignal = _lastOrdersLoadAt != null;
    final hasHeartbeatSignal = _lastHeartbeatAt != null;

    if (_heartbeatInFlight) {
      return _DeskConnectionHealth.checking;
    }

    if ((heartbeatFailed && apiFailed) && !hasOrdersSignal && !hasHeartbeatSignal) {
      return _DeskConnectionHealth.offline;
    }

    if (hasOrdersSignal && heartbeatFailed) {
      return _DeskConnectionHealth.degraded;
    }

    if (_isReconnecting && !hasOrdersSignal && !hasHeartbeatSignal) {
      return _DeskConnectionHealth.checking;
    }

    final lastSignal = [if (_lastOrdersLoadAt != null) _lastOrdersLoadAt!, if (_lastHeartbeatAt != null) _lastHeartbeatAt!]
      ..sort();
    if (lastSignal.isEmpty) {
      return _DeskConnectionHealth.checking;
    }
    final ageSeconds = now.difference(lastSignal.last).inSeconds;
    if (ageSeconds < 60) {
      return _DeskConnectionHealth.online;
    }
    if (ageSeconds <= 300) {
      return _DeskConnectionHealth.degraded;
    }
    return _DeskConnectionHealth.offline;
  }

  String _connectionStatusLabel(_DeskConnectionHealth health) {
    switch (health) {
      case _DeskConnectionHealth.online:
        return 'Online';
      case _DeskConnectionHealth.checking:
        return 'Verbindung wird geprüft…';
      case _DeskConnectionHealth.degraded:
        return 'Eingeschränkt';
      case _DeskConnectionHealth.offline:
        return 'Offline';
    }
  }

  Color _connectionStatusColor(_DeskConnectionHealth health) {
    switch (health) {
      case _DeskConnectionHealth.online:
        return const Color(0xFF16A34A);
      case _DeskConnectionHealth.checking:
        return const Color(0xFFEAB308);
      case _DeskConnectionHealth.degraded:
        return const Color(0xFFF59E0B);
      case _DeskConnectionHealth.offline:
        return const Color(0xFFDC2626);
    }
  }

  void _appendLocalLog(String category, String message) {
    final entry = _OrderDeskLogEntry(
      timestamp: DateTime.now(),
      category: category,
      message: message,
    );
    _localErrorLog.insert(0, entry);
    if (_localErrorLog.length > 30) {
      _localErrorLog.removeRange(30, _localErrorLog.length);
    }
  }

  void _appendStatusSnapshot() {
    final status = _connectionStatusLabel(_connectionHealth(DateTime.now()));
    _appendLocalLog('STATUS', status);
  }

  String _formatLogTime(DateTime value) {
    final hh = value.hour.toString().padLeft(2, '0');
    final mm = value.minute.toString().padLeft(2, '0');
    final ss = value.second.toString().padLeft(2, '0');
    return '$hh:$mm:$ss';
  }

  String _truncateMiddle(String input, {int edge = 4}) {
    final value = input.trim();
    if (value.length <= edge * 2 + 1) {
      return value;
    }
    return '${value.substring(0, edge)}…${value.substring(value.length - edge)}';
  }

  Future<void> _showConnectionSetupDialog() async {
    if (!mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      builder: (sheetContext) {
        final mediaQuery = MediaQuery.of(sheetContext);
        final keyboardInset = mediaQuery.viewInsets.bottom;
        final maxHeight = mediaQuery.size.height * 0.9;
        return AnimatedPadding(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: EdgeInsets.only(bottom: keyboardInset),
          child: SafeArea(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: maxHeight),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: EdgeInsets.fromLTRB(
                  12,
                  8,
                  12,
                  12 + mediaQuery.padding.bottom,
                ),
                child: _buildConnectionCard(),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _showErrorLogDialog() async {
    if (!mounted) return;
    final health = _connectionHealth(_now);
    final status = _connectionStatusLabel(health);
    final hasBinding =
        (_bindingId ?? '').trim().isNotEmpty && _isSessionToken(_deviceAuthToken);
    final tokenStatus = (_deviceAuthToken ?? '').trim().isEmpty
        ? 'nein'
        : _truncateMiddle(_deviceAuthToken!, edge: 5);
    final tokenType = _lastStoredTokenType ?? _detectStoredTokenType(_deviceAuthToken);
    final tenantId = _manualTenantIdController.text.trim();
    final apiBase = _normalizeBaseUrl(_baseUrlController.text);
    final displayCode = _displayCodeController.text.trim();
    final bindingId = (_bindingId ?? '').trim();

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Fehlerlog anzeigen'),
          content: SizedBox(
            width: 520,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Version: v$_cashierCurrentVersionName+$_cashierCurrentVersionCode'),
                  Text('Commit: $_cashierCommitShort'),
                  const SizedBox(height: 8),
                  Text('Gerät verbunden: ${_connected ? 'ja' : 'nein'}'),
                  Text('Binding vorhanden: ${hasBinding ? 'ja' : 'nein'}'),
                  Text('Binding-ID: ${bindingId.isEmpty ? '-' : _truncateMiddle(bindingId)}'),
                  Text('API-URL: $apiBase'),
                  Text('Heartbeat Endpoint: ${_lastHeartbeatEndpointUrl ?? '-'}'),
                  Text('Heartbeat HTTP Status: ${_lastHeartbeatHttpStatus?.toString() ?? '-'}'),
                  Text(
                    'Heartbeat Response Body: ${_lastHeartbeatResponseBody == null || _lastHeartbeatResponseBody!.trim().isEmpty ? '-' : _lastHeartbeatResponseBody!}',
                  ),
                  Text('Tenant-ID: ${tenantId.isEmpty ? '-' : _truncateMiddle(tenantId)}'),
                  Text('Device-Code: ${displayCode.isEmpty ? '-' : displayCode}'),
                  Text('Token: $tokenStatus'),
                  Text('Gespeicherter Token-Typ: $tokenType'),
                  Text('Audio-Asset: $_orderDeskNewOrderAudioAsset'),
                  Text(
                    'Bestellton zuletzt: ${_lastOrderTonePlayedAt?.toIso8601String() ?? '-'}',
                  ),
                  Text(
                    'Bestellton Intervall: ${_orderToneRepeatSeconds == 0 ? 'Aus' : '${_orderToneRepeatSeconds}s'}',
                  ),
                  Text('Bestellton Fehler: ${_lastOrderToneError ?? '-'}'),
                  Text('Letzter Bind HTTP Status: ${_lastBindHttpStatus?.toString() ?? '-'}'),
                  Text(
                    'Letzter Bind Response Body: ${_lastBindResponseBody == null || _lastBindResponseBody!.trim().isEmpty ? '-' : _lastBindResponseBody!}',
                  ),
                  const SizedBox(height: 8),
                  Text('Letzter Orders-Load: ${_lastOrdersLoadAt?.toIso8601String() ?? '-'}'),
                  Text('Letzter Heartbeat: ${_lastHeartbeatAt?.toIso8601String() ?? '-'}'),
                  Text('Letzter Heartbeat-Fehler: ${_lastHeartbeatError ?? '-'}'),
                  Text('Letzter API-Fehler: ${_lastApiError ?? '-'}'),
                  Text('Letzter Reconnect-Versuch: ${_lastReconnectAttemptAt?.toIso8601String() ?? '-'}'),
                  Text('Aktueller Status: $status'),
                  Text('Heartbeat-Fehler in Folge: $_consecutiveHeartbeatFailures'),
                  Text('API-Fehler in Folge: $_consecutiveApiFailures'),
                  const SizedBox(height: 12),
                  const Text('Interne Logliste (max. 30):', style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  if (_localErrorLog.isEmpty)
                    const Text('Keine Einträge vorhanden.')
                  else
                    ..._localErrorLog.map(
                      (entry) => Text(
                        '[${_formatLogTime(entry.timestamp)}] ${entry.category}: ${entry.message}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
          ),
          actions: [
            FilledButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('Schließen'),
            ),
          ],
        );
      },
    );
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
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        final maxHeight = MediaQuery.of(context).size.height * 0.85;
        return SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: maxHeight),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                16,
                4,
                16,
                16 + MediaQuery.of(context).padding.bottom,
              ),
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
                const Text(
                  'Bestellton wiederholen',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ChoiceChip(
                      selected: _orderToneRepeatSeconds == 0,
                      label: const Text('Aus'),
                      onSelected: (_) => _updateOrderToneRepeatSeconds(0),
                    ),
                    ChoiceChip(
                      selected: _orderToneRepeatSeconds == 30,
                      label: const Text('30 Sek.'),
                      onSelected: (_) => _updateOrderToneRepeatSeconds(30),
                    ),
                    ChoiceChip(
                      selected: _orderToneRepeatSeconds == 60,
                      label: const Text('60 Sek.'),
                      onSelected: (_) => _updateOrderToneRepeatSeconds(60),
                    ),
                    ChoiceChip(
                      selected: _orderToneRepeatSeconds == 120,
                      label: const Text('120 Sek.'),
                      onSelected: (_) => _updateOrderToneRepeatSeconds(120),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    final allowed = await _confirmConnectionEdit();
                    if (!allowed || !mounted) {
                      return;
                    }
                    await _showConnectionSetupDialog();
                  },
                  icon: const Icon(Icons.tune_rounded),
                  label: const Text('Geräteverbindung bearbeiten'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    final allowed = await _confirmConnectionEdit();
                    if (!allowed) {
                      return;
                    }
                    await _resetLocalBinding();
                  },
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Gerät trennen / zurücksetzen'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _showErrorLogDialog();
                  },
                  icon: const Icon(Icons.bug_report_rounded),
                  label: const Text('Fehlerlog anzeigen'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _showPrinterSettingsSheet();
                  },
                  icon: const Icon(Icons.print_rounded),
                  label: const Text('Drucker einrichten'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _testPrinter();
                    if (!mounted) return;
                    ScaffoldMessenger.of(this.context).showSnackBar(
                      const SnackBar(content: Text('Testdruck ausgelöst')),
                    );
                  },
                  icon: const Icon(Icons.receipt_long_rounded),
                  label: const Text('Testdruck'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    if (!mounted) return;
                    final status = _printerMode == EscPosPrinterMode.disabled
                        ? 'deaktiviert'
                        : _printerMode == EscPosPrinterMode.debugLog
                        ? 'Debug-Log'
                        : 'TCP ${_tcpHostController.text.trim().isEmpty ? '(kein Host)' : _tcpHostController.text.trim()}:${int.tryParse(_tcpPortController.text.trim()) ?? 9100}';
                    ScaffoldMessenger.of(this.context).showSnackBar(
                      SnackBar(content: Text('Druckerstatus: $status')),
                    );
                  },
                  icon: const Icon(Icons.info_outline_rounded),
                  label: const Text('Druckerstatus anzeigen'),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    final nextMode = _printerMode == EscPosPrinterMode.disabled
                        ? EscPosPrinterMode.debugLog
                        : EscPosPrinterMode.disabled;
                    setState(() {
                      _printerMode = nextMode;
                    });
                    await _persistState();
                    if (!mounted) return;
                    ScaffoldMessenger.of(this.context).showSnackBar(
                      SnackBar(
                        content: Text(
                          nextMode == EscPosPrinterMode.disabled
                              ? 'Automatischer Bondruck deaktiviert'
                              : 'Automatischer Bondruck aktiviert',
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings_suggest_rounded),
                  label: Text(
                    _printerMode == EscPosPrinterMode.disabled
                        ? 'Automatischer Bondruck an'
                        : 'Automatischer Bondruck aus',
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.tonalIcon(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _showDriverPairingInfo();
                  },
                  icon: const Icon(Icons.qr_code_rounded),
                  label: const Text('Driver-App koppeln (Info)'),
                ),
                ],
              ),
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
    await _secureStorage.delete(key: _secureCashierManualTenantId);
    await _secureStorage.delete(key: _secureCashierManualAdminCode);

    _pollTimer?.cancel();
    _heartbeatTimer?.cancel();
    if (!mounted) {
      return;
    }
    setState(() {
      _deviceAuthToken = null;
      _bindingId = null;
      _lastStoredTokenType = 'none';
      _bindingLocked = false;
      _connected = false;
      _connectedTenantName = null;
      _connectedAdmins = const [];
      _connectedChainadmins = const [];
      _displayCodeController.clear();
      _pairingTokenController.clear();
      _manualTokenController.clear();
      _manualTenantIdController.clear();
      _manualAdminCodeController.clear();
      _showManualConnection = false;
      _orderDetailExpandedById.clear();
      _pendingNewOrderIds.clear();
      _info = 'Gerät wurde zurückgesetzt. Bitte erneut per QR-Code verbinden.';
      _error = null;
      _feed = null;
      _lastSuccessfulSyncAt = null;
    });
  }

  Future<bool> _confirmConnectionEdit() async {
    if (!mounted) return false;
    final first = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Geräteverbindung bearbeiten'),
        content: const Text(
          'Achtung: Wenn Sie die Geräteverbindung ändern, kann dieses OrderDesk-Gerät keine Bestellungen mehr empfangen, bis es erneut verbunden wurde.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Weiter'),
          ),
        ],
      ),
    );
    if (first != true || !mounted) return false;

    final second = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Final bestätigen'),
        content: const Text('Ja, Verbindung ändern?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Ja, Verbindung ändern'),
          ),
        ],
      ),
    );
    return second == true;
  }

  Future<void> _showPrinterSettingsSheet() async {
    if (!mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 16,
            ),
            child: StatefulBuilder(
              builder: (innerContext, setSheetState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Drucker einrichten',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<EscPosPrinterMode>(
                      value: _printerMode,
                      decoration: const InputDecoration(
                        labelText: 'Modus',
                        border: OutlineInputBorder(),
                      ),
                      items: EscPosPrinterMode.values
                          .map(
                            (mode) => DropdownMenuItem<EscPosPrinterMode>(
                              value: mode,
                              child: Text(mode.name),
                            ),
                          )
                          .toList(growable: false),
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _printerMode = value;
                        });
                        setSheetState(() {});
                      },
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _tcpHostController,
                      decoration: const InputDecoration(
                        labelText: 'TCP Host',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _tcpPortController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'TCP Port',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    FilledButton.icon(
                      onPressed: () async {
                        await _persistState();
                        if (!mounted) return;
                        Navigator.of(innerContext).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Einstellungen gespeichert')),
                        );
                      },
                      icon: const Icon(Icons.save_rounded),
                      label: const Text('Einstellungen speichern'),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _showDriverPairingInfo() async {
    if (!mounted) return;
    final apiUrl = _baseUrlController.text.trim().isEmpty
        ? defaultApiBaseUrl
        : _baseUrlController.text.trim();
    final tenantValue = _manualTenantIdController.text.trim();
    final displayValue = _displayCodeController.text.trim();
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Driver-App koppeln'),
        content: Text(
          'Kopplungscode im Admin/Superadmin erzeugen:\n\nGeräte → Driver-App koppeln\n\nAPI-URL: $apiUrl\nTenant-ID: ${tenantValue.isEmpty ? '-' : tenantValue}\nDriver-Gerätecode: ${displayValue.isEmpty ? '-' : displayValue}\nPairingToken: wird im Kopplungsdialog angezeigt.\n\nHinweis: Driver-App kann QR oder manuellen Code verwenden.',
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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

  String _orderDisplayCode(PublicOrderSummary order) {
    final publicOrderCode = order.publicOrderCode?.trim();
    if (publicOrderCode != null && publicOrderCode.isNotEmpty) {
      return publicOrderCode.toUpperCase();
    }
    final pickup = order.pickupNumber;
    if (pickup != null) {
      return pickup.toString();
    }
    return order.id.length >= 8 ? order.id.substring(0, 8) : order.id;
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

  String _detectStoredTokenType(String? token) {
    final value = (token ?? '').trim();
    if (value.isEmpty) {
      return 'none';
    }
    if (value.startsWith('KOD') ||
        value.startsWith('KLARANDO_ORDERDESK_PAIRING:') ||
        value.startsWith('klarando-orderdesk-pair:')) {
      return 'pairing';
    }
    final dotCount = '.'.allMatches(value).length;
    if (dotCount == 2) {
      return 'session';
    }
    return 'unknown';
  }

  bool _isSessionToken(String? token) => _detectStoredTokenType(token) == 'session';

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
    final hasStoredBinding =
        (_bindingId ?? '').trim().isNotEmpty && _isSessionToken(_deviceAuthToken);
    final isOperationalView = hasStoredBinding;
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
                width: 24,
                height: 24,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Klarando OrderDesk',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'v$_cashierCurrentVersionName+$_cashierCurrentVersionCode • Commit $_cashierCommitShort',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
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
                _buildDisconnectedInfoCard(),
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
              ...visibleOrders.map(_buildOrderCard),
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
              const SizedBox(height: 8),
              const Text(
                'Geräteverbindung bearbeiten ist nur im Servicebereich verfügbar.',
                style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
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
            const Text('QR-Code mit dem seitlichen Scanner scannen'),
            const SizedBox(height: 12),
            TextField(
              controller: _pairingTokenController,
              focusNode: _pairingTokenFocusNode,
              autofocus: true,
              enabled: !_loading,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _connectWithEnteredBindingCode(fromEnter: true),
              decoration: InputDecoration(
                labelText: 'Gescannten QR-/Binding-Code einfügen',
                hintText: 'Scanner schreibt den Code automatisch hier hinein',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  tooltip: 'Feld leeren',
                  onPressed: _loading
                      ? null
                      : () {
                          _pairingTokenController.clear();
                          _pairingTokenFocusNode.requestFocus();
                        },
                  icon: const Icon(Icons.close_rounded),
                ),
              ),
              minLines: 2,
              maxLines: 4,
            ),
            if (_pairingInputDebug != null) ...[
              const SizedBox(height: 6),
              Text(
                _pairingInputDebug!,
                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
              ),
            ],
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: _loading
                  ? null
                  : () {
                      setState(() {
                        _showManualConnection = !_showManualConnection;
                        if (_showManualConnection &&
                            _manualTokenController.text.trim().isEmpty &&
                            _pairingTokenController.text.trim().isNotEmpty) {
                          _manualTokenController.text = _pairingTokenController.text.trim();
                        }
                      });
                    },
              icon: const Icon(Icons.tune_rounded),
              label: Text(_showManualConnection ? 'Manuell ausblenden' : 'Manuell verbinden'),
            ),
            if (_showManualConnection) ...[
              const SizedBox(height: 10),
              TextField(
                controller: _baseUrlController,
                enabled: !_loading,
                decoration: const InputDecoration(
                  labelText: 'API-URL',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _manualTenantIdController,
                enabled: !_loading,
                decoration: const InputDecoration(
                  labelText: 'Tenant-ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _manualAdminCodeController,
                enabled: !_loading,
                decoration: const InputDecoration(
                  labelText: 'Admin-ID / Betriebscode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _displayCodeController,
                enabled: !_loading,
                decoration: const InputDecoration(
                  labelText: 'DisplayCode / Gerätename',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _manualTokenController,
                enabled: !_loading,
                decoration: const InputDecoration(
                  labelText: 'PairingToken / manueller Gerätecode',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              FilledButton.icon(
                onPressed: _loading ? null : _saveManualConnection,
                icon: const Icon(Icons.save_rounded),
                label: Text(_loading ? 'Bitte warten…' : 'Verbindung speichern'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: _loading
                    ? null
                    : () {
                        setState(() {
                          _showManualConnection = false;
                        });
                      },
                icon: const Icon(Icons.close_rounded),
                label: const Text('Schließen'),
              ),
            ],
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: _loading ? null : _connectWithEnteredBindingCode,
              icon: const Icon(Icons.link_rounded),
              label: Text(
                _loading ? 'Bitte warten…' : 'Mit Klarando verbinden',
              ),
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

  Widget _buildDisconnectedInfoCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gerät ist noch nicht verbunden',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Text(
              'Verbindungseinstellungen sind nur im Servicebereich verfügbar.',
            ),
            const SizedBox(height: 10),
            FilledButton.icon(
              onPressed: _loading ? null : _showConnectionSetupDialog,
              icon: const Icon(Icons.link_rounded),
              label: const Text('Geräteverbindung öffnen'),
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
    final lastHeartbeatText = _lastHeartbeatAt == null
        ? 'Noch kein Heartbeat'
        : _formatTimeAgo(_lastHeartbeatAt!);
    final offlineDurationText = _lastSuccessfulSyncAt == null
        ? null
        : _formatDuration(_now.difference(_lastSuccessfulSyncAt!));
    final showReconnectHint = _isReconnecting || !_connected;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 120, maxWidth: 320),
                  child: Text(
                    tenantName.isEmpty ? 'Filiale verbunden' : tenantName,
                    softWrap: true,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
                if (showReconnectHint)
                  OutlinedButton.icon(
                    onPressed: _loading
                        ? null
                        : () => _runOrderMutation(() async {
                            await _sendOrderDeskHeartbeatIfNeeded();
                            await _pollFeed(silent: true);
                          }),
                    icon: const Icon(Icons.refresh_rounded, size: 16),
                    label: const Text('Neu verbinden'),
                  ),
              ],
            ),
            const SizedBox(height: 2),
            Text(
              '$statusText • Letzter Sync: $lastSync',
              style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
            if (_connectionHealth(_now) == _DeskConnectionHealth.offline &&
                offlineDurationText != null)
              Text(
                'Offline seit $offlineDurationText',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB45309),
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(height: 2),
            Text(
              'Letzter Heartbeat: $lastHeartbeatText',
              style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
            ),
            if ((_lastHeartbeatError ?? '').trim().isNotEmpty)
              Text(
                'Letzter Fehler: ${_lastHeartbeatError!}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 11, color: Color(0xFFDC2626)),
              ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final totalMinutes = duration.inMinutes;
    if (totalMinutes < 1) {
      return 'unter 1 Minute';
    }
    final hours = totalMinutes ~/ 60;
    final minutes = totalMinutes % 60;
    if (hours <= 0) {
      return '$minutes Min.';
    }
    return '${hours}h ${minutes}m';
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
    final detailsExpanded = _orderDetailExpandedById[order.id] ?? false;
    final addressText = [
      order.customerAddress,
      order.customerZipCode,
      order.customerCity,
    ].where((entry) => entry != null && entry.trim().isNotEmpty).join(', ');
    final orderNumber = _orderDisplayCode(order);
    final paymentLabel = _paymentStatusLabel(order.paymentStatus);
    final paymentMethod = (order.paymentMethod ?? '').trim();
    final statusLabel = _orderStatusLabel(order.status);

    String nextStepKey;
    if (statusLower == 'open' || statusLower == 'pending_payment') {
      nextStepKey = 'accept';
    } else if (statusLower == 'preparing') {
      nextStepKey = isDelivery ? 'ready_delivery' : 'ready_pickup';
    } else if (statusLower == 'ready_for_delivery') {
      nextStepKey = 'out_for_delivery';
    } else if (statusLower == 'out_for_delivery') {
      nextStepKey = 'complete_delivery';
    } else if (statusLower == 'ready_for_pickup') {
      nextStepKey = 'complete_pickup';
    } else {
      nextStepKey = 'none';
    }

    int stepIndex;
    if (statusLower == 'open' || statusLower == 'pending_payment') {
      stepIndex = 0;
    } else if (statusLower == 'preparing') {
      stepIndex = 1;
    } else if (statusLower == 'ready_for_delivery' ||
        statusLower == 'ready_for_pickup') {
      stepIndex = 2;
    } else if (statusLower == 'out_for_delivery') {
      stepIndex = 3;
    } else if (statusLower == 'done' || statusLower == 'archived') {
      stepIndex = 4;
    } else {
      stepIndex = 0;
    }

    Color statusBadgeColor;
    if (statusLower == 'done' || statusLower == 'archived') {
      statusBadgeColor = const Color(0xFF166534);
    } else if (statusLower == 'out_for_delivery') {
      statusBadgeColor = const Color(0xFF6D28D9);
    } else if (statusLower == 'ready_for_delivery' ||
        statusLower == 'ready_for_pickup') {
      statusBadgeColor = const Color(0xFF2563EB);
    } else if (statusLower == 'preparing') {
      statusBadgeColor = const Color(0xFFD97706);
    } else {
      statusBadgeColor = const Color(0xFF15803D);
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bestellung #$orderNumber',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          Text(
                            isDelivery ? 'Lieferung' : 'Abholung',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF334155),
                            ),
                          ),
                          Text(
                            'Seit: ${waitMinutes == null ? '-' : '$waitMinutes Min.'}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF334155),
                            ),
                          ),
                          Text(
                            paymentMethod.isEmpty
                                ? paymentLabel
                                : '$paymentLabel ($paymentMethod)',
                            style: TextStyle(
                              fontSize: 12,
                              color: isPaid
                                  ? const Color(0xFF334155)
                                  : const Color(0xFFB91C1C),
                              fontWeight:
                                  isPaid ? FontWeight.w500 : FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusBadgeColor,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        statusLabel.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 11,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${order.total.toStringAsFixed(2)} €',
                      style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: List<Widget>.generate(5, (index) {
                final active = index <= stepIndex;
                return Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: index < 4 ? 4 : 0),
                    height: 4,
                    decoration: BoxDecoration(
                      color:
                          active ? const Color(0xFF2563EB) : const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              }),
            ),
            const SizedBox(height: 4),
            const Text(
              'Eingegangen → In Bearbeitung → Bereit → Unterwegs → Abgeschlossen',
              style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 8),
            Text(
              order.customerName ?? '-',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            if (addressText.isNotEmpty)
              Text(
                addressText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
              ),
            if (order.customerPhone != null && order.customerPhone!.trim().isNotEmpty)
              Text(
                'Tel: ${order.customerPhone}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
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
            TextButton.icon(
              onPressed: () {
                setState(() {
                  _orderDetailExpandedById[order.id] = !detailsExpanded;
                });
              },
              icon: Icon(
                detailsExpanded
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                size: 18,
              ),
              label: Text(detailsExpanded ? 'Details ausblenden' : 'Details anzeigen'),
            ),
            if (detailsExpanded) ...[
              Text(
                'Telefon: ${order.customerPhone ?? '-'}',
                style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
              ),
              if (addressText.isNotEmpty)
                Text(
                  'Adresse: $addressText',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
                ),
              if (order.paymentMethod != null && order.paymentMethod!.trim().isNotEmpty)
                Text(
                  'Zahlungsart: ${order.paymentMethod}',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
                ),
              if (order.estimatedMinutes != null)
                Text(
                  'Geplante Zeit: ca. ${order.estimatedMinutes} Min.',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
                ),
            ],
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
              const SizedBox(height: 6),
              ...order.items.take(5).map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.quantity}x ${item.productName}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      if (item.modifierNames.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Text(
                            item.modifierNames.join(' · '),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF64748B),
                            ),
                          ),
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
            const SizedBox(height: 8),
            if (nextStepKey == 'accept')
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _loading ? null : () => _acceptOrder(order),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF15803D),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.check_circle, size: 18),
                  label: const Text('Bestellung annehmen'),
                ),
              ),
            if (nextStepKey == 'ready_delivery' || nextStepKey == 'ready_pickup')
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _loading
                      ? null
                      : () => _setOrderStatus(
                            order,
                            isDelivery ? 'ready_for_delivery' : 'ready_for_pickup',
                            isDelivery
                                ? 'Bestellung ist bereit für die Lieferung.'
                                : 'Bestellung ist bereit zur Abholung.',
                          ),
                  style: FilledButton.styleFrom(
                    backgroundColor: isDelivery
                        ? const Color(0xFF2563EB)
                        : const Color(0xFF2563EB),
                    foregroundColor: Colors.white,
                  ),
                  icon: Icon(
                    isDelivery ? Icons.delivery_dining : Icons.storefront,
                    size: 18,
                  ),
                  label: Text(
                    isDelivery ? 'Bereit für Lieferung' : 'Bereit zur Abholung',
                  ),
                ),
              ),
            if (nextStepKey == 'out_for_delivery')
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _loading
                      ? null
                      : () => _setOrderStatus(
                            order,
                            'out_for_delivery',
                            'Fahrer ist unterwegs.',
                          ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF5B21B6),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.local_shipping, size: 18),
                  label: const Text('Fahrer unterwegs'),
                ),
              ),
            if (nextStepKey == 'complete_delivery' || nextStepKey == 'complete_pickup')
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _loading || isPaid ? null : () => _markPaid(order),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF166534),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.done_all, size: 18),
                  label: Text(
                    isDelivery ? 'Lieferung abgeschlossen' : 'Bestellung abgeholt',
                  ),
                ),
              ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (statusLower == 'open' || statusLower == 'pending_payment')
                  OutlinedButton.icon(
                    onPressed: _loading ? null : () => _rejectOrder(order),
                    icon: const Icon(Icons.close, size: 16),
                    label: const Text('Ablehnen'),
                  ),
                if (statusLower != 'open' &&
                    statusLower != 'pending_payment' &&
                    statusLower != 'preparing')
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
                OutlinedButton.icon(
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
                  OutlinedButton.icon(
                    onPressed: _loading ? null : () => _acceptOrder(order),
                    icon: const Icon(Icons.schedule, size: 16),
                    label: const Text('Zeit aktualisieren'),
                  ),
                if (isPickup && nextStepKey != 'ready_pickup')
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
                if (isPickup && nextStepKey != 'complete_pickup')
                  OutlinedButton.icon(
                    onPressed: _loading || isPaid ? null : () => _markPaid(order),
                    icon: const Icon(Icons.check_circle_outline, size: 16),
                    label: const Text('Bestellung abgeholt'),
                  ),
                if (isDelivery && nextStepKey != 'ready_delivery')
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
                if (isDelivery && nextStepKey != 'out_for_delivery')
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
                if (isDelivery && nextStepKey != 'complete_delivery')
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
      final orderLabel = _orderDisplayCode(order)
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

