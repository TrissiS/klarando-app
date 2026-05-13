import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/klarando_api.dart';
import 'core/api_environment.dart';
import 'core/pairing_payload.dart';
import 'theme/klarando_theme.dart';

const _prefsDriverBaseUrl = 'klarando_driver_base_url';
const _prefsDriverAuthToken = 'klarando_driver_auth_token';
const _prefsDriverUserId = 'klarando_driver_user_id';
const _prefsDriverUserEmail = 'klarando_driver_user_email';
const _prefsDriverUserName = 'klarando_driver_user_name';
const _prefsDriverUserRole = 'klarando_driver_user_role';
const _prefsDriverTenantId = 'klarando_driver_user_tenant_id';
const _prefsDriverChainId = 'klarando_driver_user_chain_id';
const _prefsDriverSessionMode = 'klarando_driver_session_mode';
const _prefsDriverDisplayCode = 'klarando_driver_display_code';
const _prefsDriverDeviceLabel = 'klarando_driver_device_label';
const _driverCurrentVersionName = '1.0.0';
const _driverCurrentVersionCode = 1;

class KlarandoDeliveryApp extends StatelessWidget {
  const KlarandoDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klarando Delivery',
      debugShowCheckedModeBanner: false,
      theme: KlarandoTheme.materialTheme(),
      home: const _DriverHomePage(),
    );
  }
}

Widget _statusBadge(String status) {
  final label = _statusLabel(status);
  final color = switch (status) {
    'out_for_delivery' => const Color(0xFF0284C7),
    'done' => const Color(0xFF16A34A),
    'preparing' => const Color(0xFFF59E0B),
    'archived' => const Color(0xFF64748B),
    _ => const Color(0xFF6D28D9),
  };
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.14),
      borderRadius: BorderRadius.circular(999),
      border: Border.all(color: color.withValues(alpha: 0.35)),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    ),
  );
}

Widget _detailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: RichText(
      text: TextSpan(
        style: const TextStyle(color: Color(0xFF334155), fontSize: 13),
        children: [
          TextSpan(
            text: '$label: ',
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          TextSpan(text: value),
        ],
      ),
    ),
  );
}

String _defaultBaseUrl() => defaultApiBaseUrl;

String _normalizedBaseUrl(String value) {
  return normalizeApiBaseUrl(value);
}

String _displayOrderNumber(PublicOrderSummary order) {
  final pickupNumber = order.pickupNumber;
  if (pickupNumber != null && pickupNumber > 0) {
    return pickupNumber.toString().padLeft(3, '0');
  }
  final id = order.id;
  return (id.length >= 8 ? id.substring(0, 8) : id).toUpperCase();
}

String _serviceTypeLabel(String? serviceType) {
  final normalized = (serviceType ?? '').toUpperCase();
  if (normalized == 'DELIVERY') return 'Lieferung';
  if (normalized == 'PICKUP') return 'Abholung';
  return 'Service offen';
}

String _statusLabel(String status) {
  switch (status) {
    case 'out_for_delivery':
      return 'Fahrer unterwegs';
    case 'preparing':
      return 'In Zubereitung';
    case 'done':
      return 'Zugestellt';
    case 'archived':
      return 'Archiviert';
    default:
      return 'Offen';
  }
}

String _orderAddressLine(PublicOrderSummary order) {
  final street = (order.customerAddress ?? '').trim();
  final zip = (order.customerZipCode ?? '').trim();
  final city = (order.customerCity ?? '').trim();

  final left = [street].where((entry) => entry.isNotEmpty).join(' ');
  final right = [zip, city].where((entry) => entry.isNotEmpty).join(' ');
  final full = [left, right].where((entry) => entry.isNotEmpty).join(', ');
  return full.isEmpty ? '-' : full;
}

String? _googleMapsQueryForOrder(PublicOrderSummary order) {
  final parts = [
    (order.customerAddress ?? '').trim(),
    (order.customerZipCode ?? '').trim(),
    (order.customerCity ?? '').trim(),
  ].where((entry) => entry.isNotEmpty).toList(growable: false);
  if (parts.isEmpty) {
    return null;
  }
  return parts.join(', ');
}

String _formatDateTime(DateTime value) {
  final local = value.toLocal();
  final day = local.day.toString().padLeft(2, '0');
  final month = local.month.toString().padLeft(2, '0');
  final year = local.year.toString();
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  final second = local.second.toString().padLeft(2, '0');
  return '$day.$month.$year $hour:$minute:$second';
}

String _formatDurationSince(DateTime start, DateTime now) {
  final difference = now.difference(start);
  final safeSeconds = difference.inSeconds < 0 ? 0 : difference.inSeconds;
  final hours = safeSeconds ~/ 3600;
  final minutes = (safeSeconds % 3600) ~/ 60;
  final seconds = safeSeconds % 60;
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}

class _BrowserPosition {
  const _BrowserPosition({
    required this.latitude,
    required this.longitude,
    required this.accuracyMeters,
    required this.heading,
    required this.speedKmh,
  });

  final double latitude;
  final double longitude;
  final double? accuracyMeters;
  final double? heading;
  final double? speedKmh;
}

class _SignatureCaptureResult {
  const _SignatureCaptureResult({
    required this.signerName,
    required this.imageDataUrl,
  });

  final String signerName;
  final String imageDataUrl;
}

class _DriverHomePage extends StatefulWidget {
  const _DriverHomePage();

  @override
  State<_DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<_DriverHomePage> {
  final _api = const KlarandoApi();
  final _baseUrlController = TextEditingController(text: _defaultBaseUrl());
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _pairingTokenController = TextEditingController();
  final _pairingDriverNameController = TextEditingController();

  bool _initializing = true;
  bool _isBusy = false;
  bool _statusBusy = false;
  bool _sendingLocation = false;
  bool _capturingSignature = false;
  bool _rememberSession = true;

  String _message = 'Bitte als Fahrer einloggen.';
  String? _updateInfo;
  bool _checkingUpdate = false;
  String _locationInfo = 'Standortfreigabe inaktiv';
  bool _deviceSessionMode = false;
  String? _deviceDisplayCode;
  String? _deviceLabel;
  DateTime? _deviceSessionExpiresAt;

  String? _authToken;
  AccessUser? _driverUser;
  List<PublicOrderSummary> _orders = const [];
  String? _selectedOrderId;

  bool _locationSharingActive = false;
  bool _locationTrackingEnabled = true;
  bool _customerLiveTrackingEnabled = true;
  int _locationIntervalSeconds = 12;
  DateTime? _lastLocationSentAt;
  Timer? _ordersPollTimer;
  Timer? _locationTimer;

  @override
  void initState() {
    super.initState();
    unawaited(_restoreSession());
  }

  @override
  void dispose() {
    _ordersPollTimer?.cancel();
    _locationTimer?.cancel();
    _baseUrlController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _pairingTokenController.dispose();
    _pairingDriverNameController.dispose();
    super.dispose();
  }

  Future<void> _restoreSession() async {
    final prefs = await SharedPreferences.getInstance();
    final storedBaseUrl = prefs.getString(_prefsDriverBaseUrl);
    final storedToken = prefs.getString(_prefsDriverAuthToken);
    final storedRole = prefs.getString(_prefsDriverUserRole);
    final storedSessionMode = prefs.getString(_prefsDriverSessionMode) ?? 'USER';
    final storedDisplayCode = prefs.getString(_prefsDriverDisplayCode);
    final storedDeviceLabel = prefs.getString(_prefsDriverDeviceLabel);

    if (storedBaseUrl != null && storedBaseUrl.trim().isNotEmpty) {
      _baseUrlController.text = storedBaseUrl;
    }

    if (storedToken != null &&
        storedToken.trim().isNotEmpty &&
        storedRole != null &&
        storedRole.toUpperCase() == 'DRIVER') {
      _authToken = storedToken;
      _deviceSessionMode = storedSessionMode.toUpperCase() == 'DEVICE';
      _deviceDisplayCode = storedDisplayCode;
      _deviceLabel = storedDeviceLabel;
      _driverUser = AccessUser(
        id: prefs.getString(_prefsDriverUserId) ?? '',
        email: prefs.getString(_prefsDriverUserEmail) ?? '',
        name: prefs.getString(_prefsDriverUserName) ?? 'Fahrer',
        role: storedRole,
        chainId: prefs.getString(_prefsDriverChainId),
        tenantId: prefs.getString(_prefsDriverTenantId),
      );

      try {
        await _refreshOrders(forceMessage: false);
        _startOrdersPolling();
        _message = _deviceSessionMode
            ? 'Fahrergeraet-Sitzung wiederhergestellt.'
            : 'Fahrersitzung wiederhergestellt.';
      } on ApiException catch (error) {
        await _clearPersistedSession();
        _authToken = null;
        _driverUser = null;
        _deviceSessionMode = false;
        _deviceDisplayCode = null;
        _deviceLabel = null;
        _message = error.message;
      }
    }

    if (!mounted) return;
    setState(() {
      _initializing = false;
    });
  }

  Future<void> _persistSession(LoginResponse response) async {
    if (!_rememberSession) {
      await _clearPersistedSession();
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsDriverBaseUrl, _normalizedBaseUrl(_baseUrlController.text));
    await prefs.setString(_prefsDriverAuthToken, response.token);
    await prefs.setString(_prefsDriverUserId, response.user.id);
    await prefs.setString(_prefsDriverUserEmail, response.user.email);
    await prefs.setString(_prefsDriverUserName, response.user.name);
    await prefs.setString(_prefsDriverUserRole, response.user.role);
    await prefs.setString(_prefsDriverSessionMode, 'USER');
    await prefs.remove(_prefsDriverDisplayCode);
    await prefs.remove(_prefsDriverDeviceLabel);
    if (response.user.tenantId != null && response.user.tenantId!.trim().isNotEmpty) {
      await prefs.setString(_prefsDriverTenantId, response.user.tenantId!);
    } else {
      await prefs.remove(_prefsDriverTenantId);
    }
    if (response.user.chainId != null && response.user.chainId!.trim().isNotEmpty) {
      await prefs.setString(_prefsDriverChainId, response.user.chainId!);
    } else {
      await prefs.remove(_prefsDriverChainId);
    }
  }

  Future<void> _persistDeviceSession({
    required DriverDeviceLoginResponse response,
    required String userEmail,
  }) async {
    if (!_rememberSession) {
      await _clearPersistedSession();
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsDriverBaseUrl, _normalizedBaseUrl(_baseUrlController.text));
    await prefs.setString(_prefsDriverAuthToken, response.authToken);
    await prefs.setString(_prefsDriverSessionMode, 'DEVICE');
    await prefs.setString(_prefsDriverDisplayCode, response.session.displayCode);
    await prefs.setString(_prefsDriverDeviceLabel, response.session.deviceLabel);
    await prefs.setString(_prefsDriverUserId, response.driverUserId ?? response.session.sessionId);
    await prefs.setString(_prefsDriverUserEmail, userEmail);
    await prefs.setString(_prefsDriverUserName, response.driverName);
    await prefs.setString(_prefsDriverUserRole, 'DRIVER');
    await prefs.setString(_prefsDriverTenantId, response.session.tenantId);
    await prefs.remove(_prefsDriverChainId);
  }

  Future<void> _clearPersistedSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsDriverAuthToken);
    await prefs.remove(_prefsDriverUserId);
    await prefs.remove(_prefsDriverUserEmail);
    await prefs.remove(_prefsDriverUserName);
    await prefs.remove(_prefsDriverUserRole);
    await prefs.remove(_prefsDriverTenantId);
    await prefs.remove(_prefsDriverChainId);
    await prefs.remove(_prefsDriverSessionMode);
    await prefs.remove(_prefsDriverDisplayCode);
    await prefs.remove(_prefsDriverDeviceLabel);
  }

  Future<void> _saveBaseUrlPreference() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsDriverBaseUrl, _normalizedBaseUrl(_baseUrlController.text));
  }

  Future<void> _checkForAppUpdate() async {
    final baseUrl = _normalizedBaseUrl(_baseUrlController.text);
    setState(() {
      _checkingUpdate = true;
      _updateInfo = 'Pruefe Update...';
    });

    try {
      final manifest = await _api.fetchDriverUpdateManifest(baseUrl: baseUrl);
      final hasUpdate = manifest.isUpdateAvailableFor(_driverCurrentVersionCode);
      if (!hasUpdate) {
        setState(() {
          _updateInfo =
              'App ist aktuell (${_driverCurrentVersionName}+${_driverCurrentVersionCode}).';
        });
        return;
      }

      final mandatory = manifest.isMandatoryFor(_driverCurrentVersionCode);
      final mode = mandatory ? 'Pflichtupdate' : 'Optionales Update';
      final url = manifest.apkUrl.trim().isEmpty ? '-' : manifest.apkUrl.trim();
      setState(() {
        _updateInfo =
            '$mode verfuegbar: ${manifest.latestVersionName}+${manifest.latestVersionCode} | APK: $url';
      });
    } on ApiException catch (error) {
      setState(() {
        _updateInfo = 'Update-Check fehlgeschlagen: ${error.message}';
      });
    } catch (error) {
      setState(() {
        _updateInfo = 'Update-Check fehlgeschlagen: $error';
      });
    } finally {
      if (mounted) {
        setState(() {
          _checkingUpdate = false;
        });
      }
    }
  }

  Future<void> _login() async {
    final baseUrl = _normalizedBaseUrl(_baseUrlController.text);
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _message = 'E-Mail und Passwort sind erforderlich.';
      });
      return;
    }

    try {
      setState(() {
        _isBusy = true;
        _message = 'Login laeuft...';
      });
      final response = await _api.login(baseUrl: baseUrl, email: email, password: password);
      if (response.user.role.toUpperCase() != 'DRIVER') {
        setState(() {
          _isBusy = false;
          _message = 'Dieser Zugang ist kein Fahrer-Account.';
        });
        return;
      }

      await _saveBaseUrlPreference();
      await _persistSession(response);

      setState(() {
        _authToken = response.token;
        _driverUser = response.user;
        _deviceSessionMode = false;
        _deviceDisplayCode = null;
        _deviceLabel = null;
        _deviceSessionExpiresAt = null;
        _isBusy = false;
        _message = 'Eingeloggt als Fahrer.';
      });

      await _refreshOrders(forceMessage: false);
      _startOrdersPolling();
    } on ApiException catch (error) {
      setState(() {
        _isBusy = false;
        _message = error.message;
      });
    }
  }

  Future<void> _loginWithPairing() async {
    final rawPairingInput = _pairingTokenController.text.trim();
    if (rawPairingInput.isEmpty) {
      setState(() {
        _message = 'Bitte QR-Pairing-Token eingeben oder scannen.';
      });
      return;
    }
    final parsedPairing = parsePairingPayload(
      rawPairingInput,
      expectedType: PairingPayloadType.driver,
    );
    if (parsedPairing == null) {
      setState(() {
        _message = 'Dieser QR-Code ist nicht für die Fahrer-App geeignet.';
      });
      return;
    }

    final baseUrl = parsedPairing.apiBaseUrl;

    final driverEmail = _emailController.text.trim();
    final driverPassword = _passwordController.text;
    final driverName = _pairingDriverNameController.text.trim();

    try {
      setState(() {
        _isBusy = true;
        _message = 'Fahrergeraet wird verbunden...';
      });

      final response = await _api.loginDriverDevice(
        baseUrl: baseUrl,
        pairingTokenOrPayload: parsedPairing.rawPayload,
        driverEmail: driverEmail.isEmpty ? null : driverEmail,
        driverPassword: driverPassword.isEmpty ? null : driverPassword,
        driverName: driverName.isEmpty ? null : driverName,
      );

      await _saveBaseUrlPreference();
      await _persistDeviceSession(
        response: response,
        userEmail: driverEmail.isEmpty ? 'device@klarando.local' : driverEmail,
      );

      setState(() {
        _baseUrlController.text = parsedPairing.apiBaseUrl;
        _authToken = response.authToken;
        _driverUser = AccessUser(
          id: response.driverUserId ?? response.session.sessionId,
          email: driverEmail.isEmpty ? 'device@klarando.local' : driverEmail,
          name: response.driverName,
          role: 'DRIVER',
          chainId: null,
          tenantId: response.session.tenantId,
        );
        _deviceSessionMode = true;
        _deviceDisplayCode = response.session.displayCode;
        _deviceLabel = response.session.deviceLabel;
        _deviceSessionExpiresAt = response.session.expiresAt;
        _isBusy = false;
        _message = 'Fahrergeraet verbunden.';
      });

      await _refreshOrders(forceMessage: false);
      _startOrdersPolling();
    } on ApiException catch (error) {
      setState(() {
        _isBusy = false;
        _message = error.message;
      });
    }
  }

  Future<void> _scanPairingTokenWithCamera() async {
    final scanResult = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const QRScannerPage(),
      ),
    );

    if (!mounted) return;
    final token = scanResult?.trim();
    if (token == null || token.isEmpty) {
      return;
    }

    final parsedPairing = parsePairingPayload(
      token,
      expectedType: PairingPayloadType.driver,
    );
    if (parsedPairing == null) {
      setState(() {
        _message = 'Dieser QR-Code ist nicht für die Fahrer-App geeignet.';
      });
      return;
    }

    setState(() {
      _pairingTokenController.text = parsedPairing.rawPayload;
      _baseUrlController.text = parsedPairing.apiBaseUrl;
      _message = 'QR-Code erkannt. Bitte jetzt Fahrergerät verbinden.';
    });
  }

  Future<void> _logout() async {
    _ordersPollTimer?.cancel();
    _ordersPollTimer = null;
    _locationTimer?.cancel();
    _locationTimer = null;
    await _clearPersistedSession();
    if (!mounted) return;
    setState(() {
      _authToken = null;
      _driverUser = null;
      _orders = const [];
      _selectedOrderId = null;
      _locationSharingActive = false;
      _locationInfo = 'Standortfreigabe inaktiv';
      _lastLocationSentAt = null;
      _deviceSessionMode = false;
      _deviceDisplayCode = null;
      _deviceLabel = null;
      _deviceSessionExpiresAt = null;
      _pairingTokenController.clear();
      _pairingDriverNameController.clear();
      _message = 'Abgemeldet.';
    });
  }

  Future<void> _sendDeviceHeartbeatIfNeeded() async {
    final token = _authToken;
    if (!_deviceSessionMode || token == null) {
      return;
    }

    try {
      await _api.sendDriverDeviceHeartbeat(
        baseUrl: _normalizedBaseUrl(_baseUrlController.text),
        authToken: token,
      );
    } on ApiException {
      // Heartbeat-Fehler soll den Hauptworkflow nicht blockieren.
    }
  }

  void _startOrdersPolling() {
    _ordersPollTimer?.cancel();
    _ordersPollTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      unawaited(_refreshOrders(forceMessage: false));
    });
  }

  Future<void> _refreshOrders({bool forceMessage = true}) async {
    final token = _authToken;
    if (token == null) {
      return;
    }

    await _sendDeviceHeartbeatIfNeeded();

    final feed = await _api.fetchDriverAssignedFeed(
      baseUrl: _normalizedBaseUrl(_baseUrlController.text),
      authToken: token,
    );
    if (!mounted) return;

    var shouldSyncTracking = false;
    setState(() {
      _orders = feed.orders;
      _locationTrackingEnabled = feed.locationTrackingEnabled;
      _customerLiveTrackingEnabled = feed.customerLiveTrackingEnabled;
      _locationIntervalSeconds = feed.locationUpdateSeconds;
      if (_selectedOrderId == null || !_orders.any((entry) => entry.id == _selectedOrderId)) {
        _selectedOrderId = _orders.isNotEmpty ? _orders.first.id : null;
      }
      shouldSyncTracking = true;

      if (forceMessage) {
        _message = '${feed.orders.length} Fahrerauftraege geladen.';
      }
    });
    if (shouldSyncTracking) {
      await _syncLocationSharingState();
    }
  }

  PublicOrderSummary? get _selectedOrder {
    final selectedId = _selectedOrderId;
    if (selectedId == null) return null;
    for (final entry in _orders) {
      if (entry.id == selectedId) {
        return entry;
      }
    }
    return null;
  }

  PublicOrderSummary? get _firstTrackableDeliveryOrder {
    for (final entry in _orders) {
      if ((entry.serviceType ?? '').toUpperCase() == 'DELIVERY') {
        return entry;
      }
    }
    return null;
  }

  bool get _canTrackSelectedOrder {
    final order = _selectedOrder;
    if (order == null) return false;
    if (!_locationTrackingEnabled) return false;
    return (order.serviceType ?? '').toUpperCase() == 'DELIVERY';
  }

  Future<_BrowserPosition> _resolveCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const ApiException('Standortdienst ist auf diesem Gerät deaktiviert.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const ApiException('Standortfreigabe wurde nicht erteilt.');
    }

    try {
      final position = await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
              timeLimit: Duration(seconds: 12),
            ),
          )
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () => throw const ApiException(
              'Standortabfrage hat zu lange gedauert. Bitte erneut versuchen.',
            ),
          );

      final latitude = position.latitude;
      final longitude = position.longitude;
      return _BrowserPosition(
        latitude: latitude,
        longitude: longitude,
        accuracyMeters: position.accuracy,
        heading: position.heading,
        speedKmh: position.speed * 3.6,
      );
    } catch (error) {
      final message = error.toString().trim();
      if (message.isNotEmpty) {
        throw ApiException('Standortfreigabe fehlgeschlagen: $message');
      }
      throw const ApiException('Standortfreigabe wurde nicht erteilt.');
    }
  }

  Future<void> _sendLocationPing() async {
    final token = _authToken;
    final order = _selectedOrder;
    if (token == null || order == null) {
      return;
    }

    if (!_locationTrackingEnabled) {
      setState(() {
        _locationInfo = 'Standorttracking ist in den Fahrer-Einstellungen deaktiviert.';
      });
      return;
    }

    if (!_canTrackSelectedOrder) {
      setState(() {
        _locationInfo = 'Bitte eine Lieferbestellung auswaehlen, um Standortdaten zu senden.';
      });
      return;
    }

    if (_sendingLocation) {
      return;
    }

    try {
      setState(() {
        _sendingLocation = true;
      });
      await _sendDeviceHeartbeatIfNeeded();
      final position = await _resolveCurrentPosition();
      await _api.sendDriverLocation(
        baseUrl: _normalizedBaseUrl(_baseUrlController.text),
        authToken: token,
        orderId: order.id,
        latitude: position.latitude,
        longitude: position.longitude,
        accuracyMeters: position.accuracyMeters,
        heading: position.heading,
        speedKmh: position.speedKmh,
      );
      if (!mounted) return;

      setState(() {
        _lastLocationSentAt = DateTime.now();
        _locationInfo =
            'Standort gesendet: ${position.latitude.toStringAsFixed(5)}, ${position.longitude.toStringAsFixed(5)}';
      });
      await _refreshOrders(forceMessage: false);
    } on ApiException catch (error) {
      if (!mounted) return;
      setState(() {
        _locationInfo = error.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _sendingLocation = false;
        });
      }
    }
  }

  void _stopLocationSharing({bool emitState = true}) {
    _locationTimer?.cancel();
    _locationTimer = null;
    if (!emitState || !mounted) return;
    setState(() {
      _locationSharingActive = false;
      _locationInfo = 'Standortfreigabe gestoppt';
    });
  }

  Future<void> _startLocationSharing() async {
    if (_locationSharingActive || !_canTrackSelectedOrder) {
      return;
    }
    if (!mounted) return;
    setState(() {
      _locationSharingActive = true;
      _locationInfo = 'Auto-Tracking aktiv';
    });
    _locationTimer?.cancel();
    _locationTimer = Timer.periodic(Duration(seconds: _locationIntervalSeconds), (_) {
      unawaited(_sendLocationPing());
    });
    await _sendLocationPing();
  }

  Future<void> _syncLocationSharingState() async {
    if (!_locationTrackingEnabled) {
      _stopLocationSharing(emitState: false);
      if (!mounted) return;
      setState(() {
        _locationSharingActive = false;
        _locationInfo = 'Tracking ist zentral deaktiviert.';
      });
      return;
    }
    if (!_canTrackSelectedOrder) {
      final fallbackOrder = _firstTrackableDeliveryOrder;
      if (fallbackOrder != null && fallbackOrder.id != _selectedOrderId) {
        if (!mounted) return;
        setState(() {
          _selectedOrderId = fallbackOrder.id;
        });
      }
    }
    if (!_canTrackSelectedOrder) {
      _stopLocationSharing(emitState: false);
      if (!mounted) return;
      setState(() {
        _locationSharingActive = false;
        _locationInfo = 'Bitte Lieferauftrag auswaehlen.';
      });
      return;
    }
    if (_locationSharingActive) {
      _locationTimer?.cancel();
      _locationTimer = Timer.periodic(Duration(seconds: _locationIntervalSeconds), (_) {
        unawaited(_sendLocationPing());
      });
      return;
    }
    await _startLocationSharing();
  }

  void _openGoogleMapsForOrder(PublicOrderSummary order) {
    final query = _googleMapsQueryForOrder(order);
    if (query == null || query.isEmpty) {
      return;
    }
    final encoded = Uri.encodeComponent(query);
    final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$encoded');
    unawaited(_launchMapsUrl(url));
  }

  Future<void> _launchMapsUrl(Uri url) async {
    final opened = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (opened || !mounted) {
      return;
    }
    setState(() {
      _message = 'Google Maps konnte nicht geöffnet werden.';
    });
  }

  Future<void> _setSelectedOrderStatus(String status) async {
    final token = _authToken;
    final order = _selectedOrder;
    if (token == null || order == null) {
      return;
    }

    try {
      setState(() {
        _statusBusy = true;
      });
      if (status == 'out_for_delivery') {
        await _api.startDriverRoute(
          baseUrl: _normalizedBaseUrl(_baseUrlController.text),
          authToken: token,
          orderId: order.id,
        );
      } else {
        await _api.updateOrderStatus(
          baseUrl: _normalizedBaseUrl(_baseUrlController.text),
          orderId: order.id,
          status: status,
          authToken: token,
        );
      }
      await _refreshOrders(forceMessage: false);
      if (!mounted) return;

      await _syncLocationSharingState();

      setState(() {
        _message = status == 'done'
            ? 'Bestellung als zugestellt markiert.'
            : status == 'out_for_delivery'
                ? 'Status auf "Fahrer unterwegs" gesetzt.'
                : 'Status aktualisiert.';
      });

      if (status == 'out_for_delivery') {
        await _sendLocationPing();
      }
    } on ApiException catch (error) {
      if (!mounted) return;
      setState(() {
        _message = error.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _statusBusy = false;
        });
      }
    }
  }

  Future<_SignatureCaptureResult?> _captureSignatureForOrder(
    PublicOrderSummary order,
  ) async {
    final signerController = TextEditingController(
      text: order.customerName?.trim().isNotEmpty == true
          ? order.customerName!.trim()
          : '',
    );
    final signatureController = SignatureController(
      penStrokeWidth: 2.8,
      penColor: const Color(0xFF0F172A),
      exportBackgroundColor: Colors.white,
      exportPenColor: const Color(0xFF0F172A),
    );

    String? inlineError;
    final result = await showDialog<_SignatureCaptureResult>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Kundensignatur erfassen'),
              content: SizedBox(
                width: 620,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: signerController,
                      decoration: const InputDecoration(
                        labelText: 'Name des Kunden',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Bitte Kunden auf dem Feld unterschreiben lassen.',
                      style: TextStyle(fontSize: 12, color: Color(0xFF475569)),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 190,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFCBD5E1)),
                      ),
                      child: Signature(
                        controller: signatureController,
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            signatureController.clear();
                            setDialogState(() {
                              inlineError = null;
                            });
                          },
                          icon: const Icon(Icons.clear),
                          label: const Text('Leeren'),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Unterschrift muss sichtbar sein.',
                          style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                        ),
                      ],
                    ),
                    if (inlineError != null) ...[
                      const SizedBox(height: 6),
                      Text(
                        inlineError!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFB91C1C),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: const Text('Abbrechen'),
                ),
                FilledButton(
                  onPressed: () async {
                    final signerName = signerController.text.trim();
                    if (signerName.isEmpty) {
                      setDialogState(() {
                        inlineError = 'Bitte Namen eingeben.';
                      });
                      return;
                    }
                    if (signatureController.isEmpty) {
                      setDialogState(() {
                        inlineError = 'Bitte zuerst unterschreiben.';
                      });
                      return;
                    }
                    final Uint8List? pngBytes =
                        await signatureController.toPngBytes(height: 280);
                    if (pngBytes == null || pngBytes.isEmpty) {
                      setDialogState(() {
                        inlineError = 'Unterschrift konnte nicht verarbeitet werden.';
                      });
                      return;
                    }
                    final imageDataUrl =
                        'data:image/png;base64,${base64Encode(pngBytes)}';
                    if (!dialogContext.mounted) return;
                    Navigator.of(dialogContext).pop(
                      _SignatureCaptureResult(
                        signerName: signerName,
                        imageDataUrl: imageDataUrl,
                      ),
                    );
                  },
                  child: const Text('Unterschrift übernehmen'),
                ),
              ],
            );
          },
        );
      },
    );

    signerController.dispose();
    signatureController.dispose();
    return result;
  }

  Future<void> _markSelectedOrderDelivered() async {
    final token = _authToken;
    final order = _selectedOrder;
    if (token == null || order == null) {
      return;
    }

    if ((order.serviceType ?? '').toUpperCase() == 'DELIVERY' &&
        !order.signatureCaptured) {
      setState(() {
        _capturingSignature = true;
      });
      try {
        final signature = await _captureSignatureForOrder(order);
        if (signature == null) {
          if (!mounted) return;
          setState(() {
            _message = 'Zustellung abgebrochen: Keine Unterschrift erfasst.';
          });
          return;
        }
        await _api.submitDriverSignature(
          baseUrl: _normalizedBaseUrl(_baseUrlController.text),
          authToken: token,
          orderId: order.id,
          signerName: signature.signerName,
          signatureImageDataUrl: signature.imageDataUrl,
        );
      } on ApiException catch (error) {
        if (!mounted) return;
        setState(() {
          _message = error.message;
        });
        return;
      } finally {
        if (mounted) {
          setState(() {
            _capturingSignature = false;
          });
        }
      }
      await _refreshOrders(forceMessage: false);
    }

    await _setSelectedOrderStatus('done');
  }

  @override
  Widget build(BuildContext context) {
    final token = _authToken;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            'assets/klarando_logo_wordmark.png',
            height: 30,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          if (token != null)
            IconButton(
              tooltip: 'Abmelden',
              onPressed: _logout,
              icon: const Icon(Icons.logout),
            ),
        ],
      ),
      body: SafeArea(
        child: _initializing
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16),
                child: token == null ? _buildLoginCard(context) : _buildDriverDashboard(context),
              ),
      ),
    );
  }

  Widget _buildLoginCard(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Fahrerzugang',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _baseUrlController,
                  decoration: const InputDecoration(
                    labelText: 'Backend API URL',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (_) {
                    unawaited(_saveBaseUrlPreference());
                  },
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Passwort',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                CheckboxListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  value: _rememberSession,
                  onChanged: (value) {
                    setState(() {
                      _rememberSession = value ?? true;
                    });
                  },
                  title: const Text('Sitzung auf diesem Geraet merken'),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: _isBusy ? null : _login,
                  child: Text(_isBusy ? 'Bitte warten...' : 'Als Fahrer einloggen'),
                ),
                const SizedBox(height: 16),
                const Divider(height: 1),
                const SizedBox(height: 12),
                const Text(
                  'Oder per QR mit Klarando OrderDesk verbinden',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _pairingTokenController,
                  minLines: 1,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'QR-Pairing-Token / QR-Inhalt',
                    hintText: 'klarando-driver-pair:DISPLAY:TOKEN',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _isBusy ? null : _scanPairingTokenWithCamera,
                  icon: const Icon(Icons.qr_code_scanner),
                  label: const Text('QR mit Kamera scannen'),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _pairingDriverNameController,
                  decoration: const InputDecoration(
                    labelText: 'Fahrername (optional bei Geraetemodus)',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton.tonal(
                  onPressed: _isBusy ? null : _loginWithPairing,
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(44),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(_isBusy ? 'Bitte warten...' : 'Fahrergeraet per QR verbinden'),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: (_isBusy || _checkingUpdate) ? null : _checkForAppUpdate,
                  icon: const Icon(Icons.system_update),
                  label: Text(_checkingUpdate ? 'Bitte warten...' : 'Update pruefen'),
                ),
                const SizedBox(height: 8),
                Text(
                  _message,
                  style: const TextStyle(fontSize: 13, color: Color(0xFF475569)),
                ),
                if (_updateInfo != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    _updateInfo!,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF0E7490)),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDriverDashboard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Angemeldet: ${_driverUser?.name ?? '-'}',
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(
          _message,
          style: const TextStyle(fontSize: 13, color: Color(0xFF475569)),
        ),
        if (_deviceSessionMode)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              'Geraetemodus${_deviceLabel != null ? ' | $_deviceLabel' : ''}${_deviceDisplayCode != null ? ' | Display $_deviceDisplayCode' : ''}${_deviceSessionExpiresAt != null ? ' | Ablauf: ${_formatDateTime(_deviceSessionExpiresAt!)}' : ''}',
              style: const TextStyle(fontSize: 12, color: Color(0xFF0F766E), fontWeight: FontWeight.w600),
            ),
          ),
        const SizedBox(height: 12),
        Row(
          children: [
            OutlinedButton.icon(
              onPressed: () {
                unawaited(_refreshOrders());
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Auftraege aktualisieren'),
            ),
            const SizedBox(width: 10),
            OutlinedButton.icon(
              onPressed: _sendLocationPing,
              icon: const Icon(Icons.my_location),
              label: const Text('Standort jetzt senden'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          _locationInfo,
          style: const TextStyle(fontSize: 13, color: Color(0xFF334155)),
        ),
        if (_lastLocationSentAt != null)
          Text(
            'Zuletzt gesendet: ${_formatDateTime(_lastLocationSentAt!)}',
            style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
          ),
        const SizedBox(height: 12),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final wide = constraints.maxWidth >= 980;
              if (!wide) {
                return Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: _buildOrdersListCard(),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 6,
                      child: _buildOrderDetailCard(),
                    ),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: _buildOrdersListCard(),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 6,
                    child: _buildOrderDetailCard(),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildOrdersListCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aktive Fahrerauftraege (${_orders.length})',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _orders.isEmpty
                  ? const Center(
                      child: Text(
                        'Keine aktiven Fahrerauftraege vorhanden.',
                        style: TextStyle(color: Color(0xFF475569)),
                      ),
                    )
                  : ListView.separated(
                      itemCount: _orders.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final order = _orders[index];
                        final selected = _selectedOrderId == order.id;
                        return InkWell(
                          borderRadius: BorderRadius.circular(14),
                          onTap: () {
                            setState(() {
                              _selectedOrderId = order.id;
                            });
                            unawaited(_syncLocationSharingState());
                          },
                          child: Ink(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: selected ? const Color(0xFFFFEDD5) : Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: selected
                                    ? const Color(0xFFF97316)
                                    : const Color(0xFFE2E8F0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${order.tenantName ?? 'Filiale'} | #${_displayOrderNumber(order)}',
                                  style: const TextStyle(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${order.customerName ?? 'Kunde'} | ${_orderAddressLine(order)}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF334155),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 6,
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    _statusBadge(order.status),
                                    Text(
                                      '${order.total.toStringAsFixed(2)} EUR',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF475569),
                                      ),
                                    ),
                                    Text(
                                      _serviceTypeLabel(order.serviceType),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF64748B),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetailCard() {
    final order = _selectedOrder;
    if (order == null) {
      return const Card(
        child: Center(
          child: Text(
            'Bitte einen Auftrag auswaehlen.',
            style: TextStyle(color: Color(0xFF475569)),
          ),
        ),
      );
    }

    final canSetOutForDelivery =
        order.status != 'out_for_delivery' && (order.serviceType ?? '').toUpperCase() == 'DELIVERY';
    final canMarkDelivered = order.status == 'out_for_delivery';
    final departedAt = order.driverDepartedAt;
    final driverRuntime = departedAt == null
        ? null
        : _formatDurationSince(departedAt.toLocal(), DateTime.now());

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Auftrag #${_displayOrderNumber(order)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            Text(
              '${order.tenantName ?? '-'} | ${_serviceTypeLabel(order.serviceType)}',
              style: const TextStyle(fontSize: 13, color: Color(0xFF475569)),
            ),
            const SizedBox(height: 10),
            _detailRow('Kunde', order.customerName ?? '-'),
            _detailRow('Telefon', order.customerPhone ?? '-'),
            _detailRow('Adresse', _orderAddressLine(order)),
            if (_googleMapsQueryForOrder(order) != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    onPressed: () => _openGoogleMapsForOrder(order),
                    icon: const Icon(Icons.map_outlined),
                    label: const Text('Adresse in Google Maps oeffnen'),
                  ),
                ),
              ),
            _detailRow('Zahlung', order.paymentMethod ?? '-'),
            _detailRow('Gesamt', '${order.total.toStringAsFixed(2)} EUR'),
            _detailRow('Status', _statusLabel(order.status)),
            if (driverRuntime != null)
              _detailRow('Seit Fahrerstart', driverRuntime),
            if (order.paymentStatus.toUpperCase() != 'PAID')
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEE2E2),
                  border: Border.all(color: const Color(0xFFDC2626)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      color: Color(0xFF991B1B),
                      size: 26,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Achtung: Zahlung noch offen',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF991B1B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (order.paymentStatus.toUpperCase() != 'PAID')
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  'Bitte beim Kunden Zahlung erfassen, bevor der Auftrag abgeschlossen wird.',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF991B1B),
                  ),
                ),
              ),
            _detailRow(
              'Signatur',
              order.signatureCaptured
                  ? 'Vorhanden${order.signatureSignerName != null ? ' (${order.signatureSignerName})' : ''}'
                  : 'Noch nicht erfasst',
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: canSetOutForDelivery && !_statusBusy
                      ? () {
                          unawaited(_setSelectedOrderStatus('out_for_delivery'));
                        }
                      : null,
                  icon: const Icon(Icons.local_shipping),
                  label: Text(_statusBusy ? 'Bitte warten...' : 'Fahrer unterwegs'),
                ),
                FilledButton.icon(
                  onPressed: canMarkDelivered && !_statusBusy && !_capturingSignature
                      ? () {
                          unawaited(_markSelectedOrderDelivered());
                        }
                      : null,
                  icon: const Icon(Icons.check_circle),
                  label: Text(
                    _capturingSignature ? 'Signatur wird erfasst...' : 'Zugestellt',
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _sendingLocation ? null : _sendLocationPing,
                  icon: const Icon(Icons.gps_fixed),
                  label: const Text('Standort senden'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Text(
                _locationTrackingEnabled
                    ? 'Auto-Tracking aktiv | Intervall zentral: $_locationIntervalSeconds Sekunden${_customerLiveTrackingEnabled ? ' | Live-Tracking fuer Kunde aktiv' : ''}'
                    : 'Auto-Tracking zentral deaktiviert',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF334155),
                ),
              ),
            ),
            if (!_canTrackSelectedOrder && _locationTrackingEnabled)
              const Padding(
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  'Bitte eine Lieferbestellung auswaehlen.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
              ),
            const Divider(height: 20),
            const Text(
              'Positionen',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: order.items.isEmpty
                  ? const Center(
                      child: Text(
                        'Keine Positionen vorhanden.',
                        style: TextStyle(color: Color(0xFF64748B)),
                      ),
                    )
                  : ListView.separated(
                      itemCount: order.items.length,
                      separatorBuilder: (_, __) => const Divider(height: 12),
                      itemBuilder: (context, index) {
                        final item = order.items[index];
                        final modifiers = item.modifierNames.join(', ');
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEDD5),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                '${item.quantity}x',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.productName,
                                    style: const TextStyle(fontWeight: FontWeight.w700),
                                  ),
                                  if (modifiers.isNotEmpty)
                                    Text(
                                      'Optionen: $modifiers',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF64748B),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${item.price.toStringAsFixed(2)} EUR',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF334155),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  late final MobileScannerController _controller;
  bool _isProcessing = false;
  bool _torchEnabled = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      formats: const [BarcodeFormat.qrCode],
      facing: CameraFacing.back,
      torchEnabled: false,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _toggleTorch() async {
    await _controller.toggleTorch();
    if (!mounted) return;
    setState(() {
      _torchEnabled = !_torchEnabled;
    });
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_isProcessing) return;
    final raw = capture.barcodes
        .map((barcode) => barcode.rawValue?.trim())
        .whereType<String>()
        .firstWhere((value) => value.isNotEmpty, orElse: () => '');
    if (raw.isEmpty) {
      return;
    }

    _isProcessing = true;
    await _controller.stop();
    if (!mounted) return;

    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('QR-Code erkannt'),
        content: SelectableText(raw),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );

    if (!mounted) return;
    Navigator.of(context).pop(raw);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR-Code scannen'),
        actions: [
          IconButton(
            onPressed: _toggleTorch,
            tooltip: _torchEnabled ? 'Licht aus' : 'Licht an',
            icon: Icon(_torchEnabled ? Icons.flash_off : Icons.flash_on),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.62),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  'QR-Code von Klarando OrderDesk in den Rahmen halten.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
