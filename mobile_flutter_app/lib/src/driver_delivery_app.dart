import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signature/signature.dart';
import 'package:url_launcher/url_launcher.dart';

import 'core/app_update_service.dart';
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
const _klarandoImpressumUrl = 'https://www.klarando.com/impressum';
const _klarandoPrivacyUrl = 'https://www.klarando.com/datenschutz';
const _klarandoTermsUrl = 'https://www.klarando.com/agb';
const _klarandoCookiesUrl = 'https://www.klarando.com/cookies';
const _klarandoJugendschutzUrl = 'https://www.klarando.com/jugendschutz';

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

DateTime? _resolveHandoverStart(PublicOrderSummary order) {
  return order.driverAssignedAt ?? order.acceptedAt ?? order.createdAt;
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
  final _appUpdateService = AppUpdateService();
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
  bool _showManualLoginFallback = false;
  bool _showManualPairingFallback = false;
  bool _showDriverErrorLog = false;

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
  Timer? _clockTimer;
  DateTime _now = DateTime.now();
  int? _lastBindHttpStatus;
  String? _lastBindError;
  String? _lastBindRoute;
  String? _lastApiError;
  final List<String> _driverLogEntries = <String>[];

  String _screenState = 'LOGIN';

  void _appendDriverLog(String category, String message) {
    final now = DateTime.now();
    final stamp =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
    _driverLogEntries.insert(0, '[$stamp] $category: $message');
    if (_driverLogEntries.length > 20) {
      _driverLogEntries.removeRange(20, _driverLogEntries.length);
    }
  }

  @override
  void initState() {
    super.initState();
    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _authToken == null) {
        return;
      }
      setState(() {
        _now = DateTime.now();
      });
    });
    unawaited(_restoreSession());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_checkForAppUpdate(silentWhenCurrent: true));
    });
  }

  @override
  void dispose() {
    _ordersPollTimer?.cancel();
    _locationTimer?.cancel();
    _clockTimer?.cancel();
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
      _screenState = 'RESTORING_SESSION';
      _appendDriverLog('SESSION', 'Gespeicherte Sitzung gefunden');
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
            ? 'Fahrergerät-Sitzung wiederhergestellt.'
            : 'Fahrersitzung wiederhergestellt.';
        _screenState = 'DASHBOARD';
        _appendDriverLog('SESSION', 'Sitzung wiederhergestellt');
      } on ApiException catch (error) {
        await _clearPersistedSession();
        _authToken = null;
        _driverUser = null;
        _deviceSessionMode = false;
        _deviceDisplayCode = null;
        _deviceLabel = null;
        _message = error.message;
        _lastApiError = error.message;
        _screenState = 'SESSION_INVALID';
        _appendDriverLog('SESSION', 'Wiederherstellung fehlgeschlagen: ${error.message}');
      } catch (error) {
        await _clearPersistedSession();
        _authToken = null;
        _driverUser = null;
        _deviceSessionMode = false;
        _deviceDisplayCode = null;
        _deviceLabel = null;
        _message = 'Sitzung konnte nicht geladen werden: $error';
        _lastApiError = error.toString();
        _screenState = 'SESSION_INVALID';
        _appendDriverLog('SESSION', 'Unerwarteter Fehler: $error');
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

  Future<void> _checkForAppUpdate({bool silentWhenCurrent = false}) async {
    final baseUrl = _normalizedBaseUrl(_baseUrlController.text);
    setState(() {
      _checkingUpdate = true;
      if (!silentWhenCurrent) {
        _updateInfo = 'Prüfe Update...';
      }
    });

    try {
      final result = await _appUpdateService.checkForUpdate(
        baseUrl: baseUrl,
        expectedFlavor: MobileAppFlavor.driver,
      );
      if (!result.updateAvailable) {
        setState(() {
          if (!silentWhenCurrent) {
            _updateInfo =
                'App ist aktuell (${result.currentVersion}+${result.currentBuildNumber}).';
          }
        });
        return;
      }

      final mode = result.forceUpdate ? 'Pflichtupdate' : 'Optionales Update';
      setState(() {
        _updateInfo =
            '$mode verfügbar: ${result.manifest.latestVersion}+${result.manifest.buildNumber}';
      });
      if (mounted) {
        await _showUpdateDialog(result);
      }
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

  Future<void> _showUpdateDialog(UpdateCheckResult result) async {
    final manifest = result.manifest;
    final installNow = await showDialog<bool>(
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

    if (installNow != true) {
      return;
    }

    final apkUri = Uri.tryParse(manifest.apkUrl);
    if (apkUri == null) {
      setState(() {
        _updateInfo = 'Update-Link ist ungültig.';
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
        _updateInfo = 'Installationsdialog wurde geöffnet.';
      });
    } on ApiException catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _updateInfo = 'Installation fehlgeschlagen: ${error.message}';
      });
    } catch (error) {
      if (!mounted) {
        return;
      }
      setState(() {
        _updateInfo = 'Installation fehlgeschlagen: $error';
      });
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
        _message = 'Login läuft...';
        _screenState = 'USER_LOGIN_IN_PROGRESS';
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
        _screenState = 'DASHBOARD';
      });
      _appendDriverLog('LOGIN', 'Manueller Fahrer-Login erfolgreich');

      await _refreshOrders(forceMessage: false);
      _startOrdersPolling();
    } on ApiException catch (error) {
      setState(() {
        _isBusy = false;
        _message = error.message;
        _lastApiError = error.message;
        _screenState = 'USER_LOGIN_FAILED';
      });
      _appendDriverLog('LOGIN', 'Fehlgeschlagen: ${error.message}');
    }
  }

  Future<void> _loginWithPairing() async {
    final rawPairingInput = _pairingTokenController.text.trim();
    if (rawPairingInput.isEmpty) {
      setState(() {
        _message = 'Bitte zuerst den QR-Code scannen.';
        _screenState = 'PAIRING_INPUT_MISSING';
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
        _screenState = 'PAIRING_PARSE_FAILED';
      });
      _appendDriverLog('PAIRING', 'QR-Payload ungültig');
      return;
    }

    final baseUrl = parsedPairing.apiBaseUrl;

    final driverEmail = _emailController.text.trim();
    final driverPassword = _passwordController.text;
    final driverName = _pairingDriverNameController.text.trim();

    try {
      setState(() {
        _isBusy = true;
        _message = 'Gerät wird verbunden …';
        _screenState = 'BINDING_IN_PROGRESS';
      });
      _lastBindRoute = '/api/orders/driver/device-login';
      _appendDriverLog('BIND', 'Bind-Request gestartet');

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
        _message = 'Verbindung erfolgreich.';
        _lastBindHttpStatus = 200;
        _lastBindError = null;
        _screenState = 'BINDING_SUCCESS';
      });
      _appendDriverLog(
        'BIND',
        'Bind erfolgreich (tenant=${response.session.tenantId}, code=${response.session.displayCode})',
      );

      await _refreshOrders(forceMessage: false);
      _startOrdersPolling();
      if (mounted) {
        setState(() {
          _screenState = 'DASHBOARD';
        });
      }
    } on ApiException catch (error) {
      setState(() {
        _isBusy = false;
        _message = _mapPairingErrorMessage(error.message);
        _screenState = 'BINDING_FAILED';
        _lastBindHttpStatus = error.statusCode;
        _lastBindError = error.message;
        _lastApiError = error.message;
      });
      _appendDriverLog(
        'BIND',
        'Bind fehlgeschlagen (status=${error.statusCode ?? '-'}): ${error.message}',
      );
    } catch (error) {
      setState(() {
        _isBusy = false;
        _message = 'Verbindung fehlgeschlagen: $error';
        _screenState = 'BINDING_FAILED';
        _lastBindError = error.toString();
      });
      _appendDriverLog('BIND', 'Unerwarteter Bind-Fehler: $error');
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
        _screenState = 'PAIRING_PARSE_FAILED';
      });
      _appendDriverLog('PAIRING', 'Scan lieferte ungültigen QR-Code');
      return;
    }

    setState(() {
      _pairingTokenController.text = parsedPairing.rawPayload;
      _baseUrlController.text = parsedPairing.apiBaseUrl;
      _message = 'QR-Code erkannt. Verbindung wird gestartet ...';
      _screenState = 'PAIRING_DETECTED';
    });
    await _loginWithPairing();
  }

  String _mapPairingErrorMessage(String message) {
    final normalized = message.toLowerCase();
    if (normalized.contains('expired') || normalized.contains('abgelaufen')) {
      return 'QR-Code abgelaufen. Bitte neuen Code im Adminbereich erzeugen.';
    }
    if (normalized.contains('timeout') || normalized.contains('network') || normalized.contains('verbindung')) {
      return 'Verbindung konnte nicht hergestellt werden.';
    }
    return message;
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
      _screenState = 'LOGIN';
    });
    _appendDriverLog('SESSION', 'Verbindung zurückgesetzt');
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
    } on ApiException catch (error) {
      _lastApiError = error.message;
      _appendDriverLog('HEARTBEAT', 'Fehler: ${error.message}');
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

    try {
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
        _screenState = 'DASHBOARD';

        if (forceMessage) {
          _message = '${feed.orders.length} Fahreraufträge geladen.';
        }
      });
      _appendDriverLog('API', 'Orders geladen: ${feed.orders.length}');
      if (shouldSyncTracking) {
        await _syncLocationSharingState();
      }
    } on ApiException catch (error) {
      if (!mounted) return;
      setState(() {
        _lastApiError = error.message;
        _message = error.message;
        _screenState = 'API_ERROR';
      });
      _appendDriverLog('API', 'Fehler: ${error.message}');
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _lastApiError = error.toString();
        _message = 'Fehler beim Laden der Fahreraufträge: $error';
        _screenState = 'API_ERROR';
      });
      _appendDriverLog('API', 'Unerwarteter Fehler: $error');
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
        _locationInfo = 'Bitte eine Lieferbestellung auswählen, um Standortdaten zu senden.';
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
        _locationInfo = 'Bitte Lieferauftrag auswählen.';
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

  Future<void> _openExternalLink(String url) async {
    final uri = Uri.tryParse(url);
    if (uri == null) return;
    await launchUrl(uri, mode: LaunchMode.externalApplication);
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
            ? 'Bestellung als geliefert markiert.'
            : status == 'out_for_delivery'
                ? 'Status auf "Fahrer unterwegs" gesetzt.'
                : status == 'preparing'
                    ? 'Status auf "Abholen" gesetzt.'
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

    final paymentMethod = (order.paymentMethod ?? '').trim().toUpperCase();
    final paymentStatus = order.paymentStatus.trim().toUpperCase();
    if (paymentMethod == 'CASH' && paymentStatus != 'PAID') {
      if (!mounted) return;
      setState(() {
        _message = 'Bitte zuerst Betrag erhalten bestätigen.';
      });
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

  Future<void> _confirmCashPaymentReceived(PublicOrderSummary order) async {
    final token = _authToken;
    if (token == null) {
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Barzahlung bestätigen'),
        content: const Text('Betrag wirklich erhalten?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Abbrechen'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Bestätigen'),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      return;
    }

    try {
      if (mounted) {
        setState(() {
          _statusBusy = true;
        });
      }
      await _api.markDriverOrderPaid(
        baseUrl: _normalizedBaseUrl(_baseUrlController.text),
        authToken: token,
        orderId: order.id,
      );
      await _refreshOrders(forceMessage: false);
      if (!mounted) return;
      setState(() {
        _message = 'Barzahlung als erhalten bestätigt.';
      });
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
          IconButton(
            tooltip: 'Fehlerlog anzeigen',
            onPressed: () {
              setState(() {
                _showDriverErrorLog = !_showDriverErrorLog;
              });
            },
            icon: const Icon(Icons.bug_report_outlined),
          ),
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
            child: SingleChildScrollView(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildDriverStateCard(),
                if (_showDriverErrorLog) ...[
                  const SizedBox(height: 8),
                  _buildDriverErrorLogCard(),
                ],
                const SizedBox(height: 8),
                const Text(
                  'Fahrerzugang',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Gerät verbinden',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 4),
                const Text(
                  'QR-Code scannen zum Verbinden.',
                  style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                ),
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: _isBusy ? null : _scanPairingTokenWithCamera,
                  icon: const Icon(Icons.qr_code_scanner),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(42),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  label: const Text('QR-Code scannen zum Verbinden'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _isBusy
                      ? null
                      : () {
                          setState(() {
                            _showManualLoginFallback = !_showManualLoginFallback;
                          });
                        },
                  child: Text(
                    _showManualLoginFallback
                        ? 'Manuellen Login ausblenden'
                        : 'Manuellen Login anzeigen',
                  ),
                ),
                if (_showManualLoginFallback) ...[
                  const SizedBox(height: 8),
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
                    title: const Text('Sitzung auf diesem Gerät merken'),
                  ),
                  const SizedBox(height: 8),
                  FilledButton(
                    onPressed: _isBusy ? null : _login,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(42),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: Text(_isBusy ? 'Bitte warten...' : 'Als Fahrer einloggen'),
                  ),
                ],
                TextButton(
                  onPressed: _isBusy
                      ? null
                      : () {
                          setState(() {
                            _showManualPairingFallback = !_showManualPairingFallback;
                          });
                        },
                  child: Text(
                    _showManualPairingFallback
                        ? 'Manuelle Eingabe ausblenden'
                        : 'Manuelle Eingabe (Fallback) anzeigen',
                  ),
                ),
                if (_showManualPairingFallback) ...[
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
                  TextField(
                    controller: _pairingDriverNameController,
                    decoration: const InputDecoration(
                      labelText: 'Fahrername (optional bei Gerätemodus)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FilledButton.tonal(
                    onPressed: _isBusy ? null : _loginWithPairing,
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(42),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    child: Text(_isBusy ? 'Bitte warten...' : 'Mit manuellem Token verbinden'),
                  ),
                ],
                const SizedBox(height: 8),
                OutlinedButton.icon(
                  onPressed: (_isBusy || _checkingUpdate) ? null : _checkForAppUpdate,
                  icon: const Icon(Icons.system_update),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  label: Text(_checkingUpdate ? 'Bitte warten...' : 'Update prüfen'),
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
                    TextButton(
                      onPressed: () => _openExternalLink(_klarandoCookiesUrl),
                      child: const Text('Cookies'),
                    ),
                    TextButton(
                      onPressed: () => _openExternalLink(_klarandoJugendschutzUrl),
                      child: const Text('Jugendschutz'),
                    ),
                  ],
                ),
                const Text(
                  'Standortdaten werden nur für aktive Lieferungen genutzt.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDriverDashboard(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth >= 980;
        final boardHeight = wide ? 560.0 : 920.0;
        return SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDriverStateCard(),
              if (_showDriverErrorLog) ...[
                const SizedBox(height: 8),
                _buildDriverErrorLogCard(),
              ],
              const SizedBox(height: 8),
              Text(
                'Angemeldet: ${_driverUser?.name ?? '-'}',
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              Text(
                _message,
                style: const TextStyle(fontSize: 13, color: Color(0xFF475569)),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      unawaited(_refreshOrders());
                    },
                    icon: const Icon(Icons.refresh),
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(0, 40),
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    ),
                    label: const Text('Aufträge aktualisieren'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                _locationSharingActive ? 'Standort aktiv' : 'Standort nicht verfügbar',
                style: TextStyle(
                  fontSize: 13,
                  color: _locationSharingActive ? const Color(0xFF166534) : const Color(0xFFB91C1C),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                _locationInfo,
                style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
              ),
              if (_lastLocationSentAt != null)
                Text(
                  'Zuletzt gesendet: ${_formatDateTime(_lastLocationSentAt!)}',
                  style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
              const SizedBox(height: 12),
              SizedBox(
                height: boardHeight,
                child: wide
                    ? Row(
                        children: [
                          Expanded(flex: 5, child: _buildOrdersListCard()),
                          const SizedBox(width: 10),
                          Expanded(flex: 6, child: _buildOrderDetailCard()),
                        ],
                      )
                    : Column(
                        children: [
                          Expanded(flex: 5, child: _buildOrdersListCard()),
                          const SizedBox(height: 10),
                          Expanded(flex: 6, child: _buildOrderDetailCard()),
                        ],
                      ),
              ),
            ],
          ),
        );
      },
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
              'Aktive Fahreraufträge (${_orders.length})',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _orders.isEmpty
                  ? const Center(
                      child: Text(
                        'Aktuell keine zugewiesenen Lieferungen.',
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

  Widget _buildDriverStateCard() {
    final hasToken = _authToken != null && _authToken!.trim().isNotEmpty;
    return Card(
      color: const Color(0xFFF8FAFC),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _isBusy ? 'Gerät wird verbunden …' : 'Status: $_screenState',
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text(
              _message,
              style: const TextStyle(fontSize: 13, color: Color(0xFF334155)),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OutlinedButton.icon(
                  onPressed: _isBusy ? null : _loginWithPairing,
                  icon: const Icon(Icons.refresh, size: 16),
                  label: const Text('Erneut versuchen'),
                ),
                OutlinedButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () {
                          unawaited(_logout());
                        },
                  icon: const Icon(Icons.link_off, size: 16),
                  label: const Text('Verbindung zurücksetzen'),
                ),
                Chip(label: Text('Token vorhanden: ${hasToken ? 'ja' : 'nein'}')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDriverErrorLogCard() {
    final token = _authToken;
    final tenantId = _driverUser?.tenantId ?? '-';
    final apiBase = _normalizedBaseUrl(_baseUrlController.text);
    final deviceCode = _deviceDisplayCode ?? '-';
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fehlerlog anzeigen',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 6),
            Text('API-URL: $apiBase'),
            Text('Tenant-ID: $tenantId'),
            Text('Driver-Code: $deviceCode'),
            Text('Token vorhanden: ${token == null || token.trim().isEmpty ? 'nein' : 'ja'}'),
            Text('Letzter Bind-Status: ${_lastBindHttpStatus?.toString() ?? '-'}'),
            Text('Letzter Bind-Fehler: ${_lastBindError ?? '-'}'),
            Text('Letzter API-Fehler: ${_lastApiError ?? '-'}'),
            Text('Aktueller Screen-State: $_screenState'),
            Text('Bind-Route: ${_lastBindRoute ?? '-'}'),
            const SizedBox(height: 8),
            const Text(
              'Letzte 20 Logeinträge',
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            if (_driverLogEntries.isEmpty)
              const Text('-', style: TextStyle(color: Color(0xFF64748B)))
            else
              ..._driverLogEntries.map(
                (entry) => Text(
                  entry,
                  style: const TextStyle(fontSize: 12, color: Color(0xFF334155)),
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
            'Bitte einen Auftrag auswählen.',
            style: TextStyle(color: Color(0xFF475569)),
          ),
        ),
      );
    }

    final canSetOutForDelivery =
        order.status != 'out_for_delivery' && (order.serviceType ?? '').toUpperCase() == 'DELIVERY';
    final canSetPickup = order.status == 'open' || order.status == 'preparing';
    final isCashPayment = (order.paymentMethod ?? '').trim().toUpperCase() == 'CASH';
    final isPaid = order.paymentStatus.trim().toUpperCase() == 'PAID';
    final canMarkDelivered = order.status == 'out_for_delivery' && (!isCashPayment || isPaid);
    final departedAt = order.driverDepartedAt;
    final driverRuntime = departedAt == null
        ? null
        : _formatDurationSince(departedAt.toLocal(), _now);
    final handoverStart = _resolveHandoverStart(order);
    final handoverMinutes = handoverStart == null ? 0 : _now.difference(handoverStart.toLocal()).inMinutes;
    final handoverCritical = handoverMinutes >= 10;
    final showBlink = handoverCritical && _now.second.isEven;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom + 8,
          ),
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
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: handoverCritical
                    ? (showBlink ? const Color(0xFFEF4444) : const Color(0xFFFCA5A5))
                    : const Color(0xFFDBEAFE),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                handoverStart == null
                    ? 'Übergabezeit wird vorbereitet.'
                    : handoverCritical
                    ? 'Übergabe überfällig seit ${_formatDurationSince(handoverStart.toLocal(), _now)}'
                    : 'Übergabe seit ${_formatDurationSince(handoverStart.toLocal(), _now)}',
                style: TextStyle(
                  color: handoverCritical ? Colors.white : const Color(0xFF1E3A8A),
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _detailRow('Kunde', order.customerName ?? '-'),
            _detailRow('Telefon', order.customerPhone ?? '-'),
            _detailRow('Adresse', _orderAddressLine(order)),
            _detailRow('Lieferhinweis', order.latestComplaintMessage ?? '-'),
            if (_googleMapsQueryForOrder(order) != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: OutlinedButton.icon(
                    onPressed: () => _openGoogleMapsForOrder(order),
                    icon: const Icon(Icons.map_outlined),
                    label: const Text('Navigation öffnen'),
                  ),
                ),
              ),
            _detailRow('Zahlung', order.paymentMethod ?? '-'),
            _detailRow('Zahlungsstatus', order.paymentStatus.toUpperCase()),
            _detailRow('Gesamt', '${order.total.toStringAsFixed(2)} EUR'),
            _detailRow('Status', _statusLabel(order.status)),
            if (driverRuntime != null)
              _detailRow('Seit Fahrerstart', driverRuntime),
            if (!isPaid)
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEE2E2),
                    border: Border.all(color: const Color(0xFFDC2626)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Color(0xFF991B1B),
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Achtung: Zahlung noch offen',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF991B1B),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            if (!isPaid)
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
            if (isCashPayment && !isPaid)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FilledButton.icon(
                  onPressed: _statusBusy ? null : () => _confirmCashPaymentReceived(order),
                  icon: const Icon(Icons.payments_outlined),
                  label: const Text('Betrag erhalten'),
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
                  onPressed: canSetPickup && !_statusBusy
                      ? () {
                          unawaited(_setSelectedOrderStatus('preparing'));
                        }
                      : null,
                  icon: const Icon(Icons.inventory_2_outlined),
                  label: const Text('Abholen'),
                ),
                FilledButton.icon(
                  onPressed: canSetOutForDelivery && !_statusBusy
                      ? () {
                          unawaited(_setSelectedOrderStatus('out_for_delivery'));
                        }
                      : null,
                  icon: const Icon(Icons.local_shipping),
                  label: Text(_statusBusy ? 'Bitte warten...' : 'Unterwegs'),
                ),
                FilledButton.icon(
                  onPressed: canMarkDelivered && !_statusBusy && !_capturingSignature
                      ? () {
                          unawaited(_markSelectedOrderDelivered());
                        }
                      : null,
                  icon: const Icon(Icons.check_circle),
                  label: Text(
                    _capturingSignature ? 'Signatur wird erfasst...' : 'Geliefert',
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () => _openGoogleMapsForOrder(order),
                  icon: const Icon(Icons.navigation_outlined),
                  label: const Text('Navigation öffnen'),
                ),
              ],
            ),
            if (isCashPayment && !isPaid)
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  'Bitte zuerst Betrag erhalten bestätigen.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFB91C1C),
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                    ? 'Auto-Tracking aktiv | Intervall zentral: $_locationIntervalSeconds Sekunden${_customerLiveTrackingEnabled ? ' | Live-Tracking für Kunde aktiv' : ''}'
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
                  'Bitte eine Lieferbestellung auswählen.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                ),
              ),
            const Divider(height: 20),
            const Text(
              'Bestellte Positionen',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            if (order.items.isEmpty)
              const Text(
                'Keine Positionen vorhanden.',
                style: TextStyle(color: Color(0xFF64748B)),
              )
            else ...[
              for (var index = 0; index < order.items.length; index++) ...[
                if (index > 0) const Divider(height: 12),
                Builder(
                  builder: (context) {
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
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFEF3C7),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Sonderwunsch: $modifiers',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF92400E),
                                      fontWeight: FontWeight.w700,
                                    ),
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
              ],
            ],
            ],
          ),
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
                  'QR-Code für die Fahrer-App in den Rahmen halten.',
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
