import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'core/api_environment.dart';

const _prefsDisplayApiBaseUrl = 'klarando_display_api_base_url';
const _prefsDisplayDeviceToken = 'klarando_display_device_token';
const _prefsDisplayId = 'klarando_display_id';

class KlarandoDisplayApp extends StatelessWidget {
  const KlarandoDisplayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klarando Display',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFFF97316),
        scaffoldBackgroundColor: const Color(0xFF0B1220),
      ),
      home: const _DisplayHomePage(),
    );
  }
}

class _DisplayHomePage extends StatefulWidget {
  const _DisplayHomePage();

  @override
  State<_DisplayHomePage> createState() => _DisplayHomePageState();
}

class _DisplayHomePageState extends State<_DisplayHomePage> with WidgetsBindingObserver {
  Timer? _pairingPollTimer;
  Timer? _pairingCountdownTimer;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;

  String _apiBaseUrl = normalizeApiBaseUrl(defaultApiBaseUrl);
  String? _deviceToken;
  String? _displayId;
  String? _contentUrl;

  String? _pairingToken;
  String? _pairingCode;
  DateTime? _pairingExpiresAt;

  bool _loading = true;
  bool _paired = false;
  String? _error;
  String? _statusHint;

  WebViewController? _webViewController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _enableKioskMode();
    _bootstrap();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pairingPollTimer?.cancel();
    _pairingCountdownTimer?.cancel();
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _enableKioskMode();
    }
  }

  Future<void> _enableKioskMode() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    await SystemChrome.setPreferredOrientations(const [
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Future<void> _bootstrap() async {
    final prefs = await SharedPreferences.getInstance();
    _apiBaseUrl = normalizeApiBaseUrl(
      prefs.getString(_prefsDisplayApiBaseUrl) ?? defaultApiBaseUrl,
    );
    _deviceToken = prefs.getString(_prefsDisplayDeviceToken);
    _displayId = prefs.getString(_prefsDisplayId);

    if (_deviceToken != null && _deviceToken!.isNotEmpty) {
      final ok = await _loadContentWithToken();
      if (ok) {
        return;
      }
      await _clearDeviceSession();
    }

    await _startPairingSession();
  }

  Future<void> _saveDeviceSession({
    required String apiBaseUrl,
    required String deviceToken,
    required String displayId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefsDisplayApiBaseUrl, normalizeApiBaseUrl(apiBaseUrl));
    await prefs.setString(_prefsDisplayDeviceToken, deviceToken);
    await prefs.setString(_prefsDisplayId, displayId);
  }

  Future<void> _clearDeviceSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsDisplayDeviceToken);
    await prefs.remove(_prefsDisplayId);
    _deviceToken = null;
    _displayId = null;
  }

  Future<void> _startPairingSession() async {
    _pairingPollTimer?.cancel();
    _pairingCountdownTimer?.cancel();
    _heartbeatTimer?.cancel();
    _reconnectTimer?.cancel();

    setState(() {
      _loading = true;
      _paired = false;
      _contentUrl = null;
      _error = null;
      _statusHint = null;
    });

    try {
      final response = await http
          .post(
            Uri.parse('$_apiBaseUrl/api/display/pairing/session'),
            headers: const {'Content-Type': 'application/json', 'Accept': 'application/json'},
            body: jsonEncode({
              'deviceName': 'Klarando Display',
              'appVersion': 'display-mvp',
              'platform': 'android-tv',
            }),
          )
          .timeout(const Duration(seconds: 12));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Pairing-Session konnte nicht erstellt werden.');
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final token = (json['pairingToken'] as String?)?.trim();
      final code = (json['pairingCode'] as String?)?.trim();
      final expiresAtRaw = json['expiresAt'] as String?;

      if (token == null || token.isEmpty || code == null || code.isEmpty || expiresAtRaw == null) {
        throw Exception('Ungültige Pairing-Antwort vom Server.');
      }

      setState(() {
        _pairingToken = token;
        _pairingCode = code;
        _pairingExpiresAt = DateTime.tryParse(expiresAtRaw);
        _loading = false;
      });

      _pairingPollTimer = Timer.periodic(const Duration(seconds: 3), (_) {
        unawaited(_pollPairingStatus());
      });

      _pairingCountdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (!mounted) return;
        final expiresAt = _pairingExpiresAt;
        if (expiresAt == null) return;
        if (DateTime.now().isAfter(expiresAt)) {
          unawaited(_startPairingSession());
        } else {
          setState(() {});
        }
      });

      await _pollPairingStatus();
    } on TimeoutException {
      setState(() {
        _loading = false;
        _error = 'Verbindung konnte nicht hergestellt werden.';
      });
      _schedulePairingRetry();
    } catch (_) {
      setState(() {
        _loading = false;
        _error = 'Verbindung konnte nicht hergestellt werden.';
      });
      _schedulePairingRetry();
    }
  }

  void _schedulePairingRetry() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 10), () {
      unawaited(_startPairingSession());
    });
  }

  Future<void> _pollPairingStatus() async {
    final token = _pairingToken;
    if (token == null || token.isEmpty || !mounted) {
      return;
    }

    try {
      final response = await http
          .get(
            Uri.parse('$_apiBaseUrl/api/display/pairing/session/$token'),
            headers: const {'Accept': 'application/json'},
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 410) {
        await _startPairingSession();
        return;
      }

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return;
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final status = (json['status'] as String?)?.toUpperCase();
      if (status != 'CLAIMED') {
        return;
      }

      final deviceToken = (json['deviceToken'] as String?)?.trim();
      final displayId = (json['displayId'] as String?)?.trim();
      if (deviceToken == null || deviceToken.isEmpty || displayId == null || displayId.isEmpty) {
        return;
      }

      await _saveDeviceSession(apiBaseUrl: _apiBaseUrl, deviceToken: deviceToken, displayId: displayId);
      _deviceToken = deviceToken;
      _displayId = displayId;
      await _loadContentWithToken();
    } catch (_) {
      // still pending / temporary network issues
    }
  }

  Future<bool> _loadContentWithToken() async {
    final token = _deviceToken;
    if (token == null || token.isEmpty) {
      return false;
    }

    setState(() {
      _loading = true;
      _error = null;
      _statusHint = null;
    });

    try {
      final response = await http
          .get(
            Uri.parse('$_apiBaseUrl/api/display/content'),
            headers: {
              'Accept': 'application/json',
              'Authorization': 'Bearer $token',
            },
          )
          .timeout(const Duration(seconds: 12));

      if (response.statusCode == 401) {
        return false;
      }
      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw Exception('Display-Inhalte konnten nicht geladen werden.');
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final contentUrl = (json['contentUrl'] as String?)?.trim();
      if (contentUrl == null || contentUrl.isEmpty) {
        throw Exception('Keine Display-URL erhalten.');
      }

      final resolvedUrl = contentUrl.startsWith('http') ? contentUrl : '$_apiBaseUrl$contentUrl';
      final controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(resolvedUrl));

      setState(() {
        _webViewController = controller;
        _contentUrl = resolvedUrl;
        _paired = true;
        _loading = false;
      });

      _pairingPollTimer?.cancel();
      _pairingCountdownTimer?.cancel();
      _startHeartbeat();
      return true;
    } on TimeoutException {
      setState(() {
        _loading = false;
        _error = 'Verbindung wird wiederhergestellt …';
      });
      _scheduleContentRetry();
      return true;
    } catch (_) {
      setState(() {
        _loading = false;
        _error = 'Verbindung wird wiederhergestellt …';
      });
      _scheduleContentRetry();
      return true;
    }
  }

  void _scheduleContentRetry() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 10), () {
      unawaited(_loadContentWithToken());
    });
  }

  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      unawaited(_sendHeartbeat());
    });
    unawaited(_sendHeartbeat());
  }

  Future<void> _sendHeartbeat() async {
    final token = _deviceToken;
    if (token == null || token.isEmpty) return;
    try {
      await http
          .post(
            Uri.parse('$_apiBaseUrl/api/display/heartbeat'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $token',
            },
            body: jsonEncode({
              'displayId': _displayId,
              'appVersion': 'display-mvp',
              'screenStatus': 'ACTIVE',
            }),
          )
          .timeout(const Duration(seconds: 10));
    } catch (_) {
      // keep retrying silently
    }
  }

  String _formatCountdown() {
    final expiresAt = _pairingExpiresAt;
    if (expiresAt == null) return '--:--';
    final seconds = expiresAt.difference(DateTime.now()).inSeconds;
    if (seconds <= 0) return '00:00';
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final rest = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$rest';
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_paired && _webViewController != null && _contentUrl != null) {
      return Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: WebViewWidget(controller: _webViewController!)),
            if (_error != null)
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.72),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Text(
                      _error!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    }

    final payload = {
      'type': 'DISPLAY_PAIRING',
      'pairingToken': _pairingToken,
      'pairingCode': _pairingCode,
      'apiBaseUrl': _apiBaseUrl,
      'expiresAt': _pairingExpiresAt?.toIso8601String(),
    };
    final payloadJson = jsonEncode(payload);
    final qrUrl = 'https://api.qrserver.com/v1/create-qr-code/?size=700x700&data=${Uri.encodeComponent(payloadJson)}';

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 980),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Display verbinden',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Scanne diesen QR-Code im Klarando Adminbereich.',
                    style: TextStyle(fontSize: 22, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 22),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            qrUrl,
                            fit: BoxFit.contain,
                            errorBuilder: (_, __, ___) => const Center(
                              child: Text('QR-Code konnte nicht geladen werden.'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    _pairingCode ?? '------',
                    style: const TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 8,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Der Code ist $_formatCountdown() gültig.',
                    style: const TextStyle(fontSize: 20, color: Colors.white70),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 14),
                    Text(
                      _error!,
                      style: const TextStyle(color: Colors.orangeAccent, fontSize: 16),
                    ),
                  ],
                  if (_statusHint != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _statusHint!,
                      style: const TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
