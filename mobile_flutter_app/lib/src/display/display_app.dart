import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'display_api.dart';
import 'display_content_screen.dart';
import 'display_pairing_screen.dart';

const _prefsDeviceToken = 'klarando_display_device_token';
const _prefsDisplayId = 'klarando_display_id';
const _prefsScreenId = 'klarando_display_screen_id';
const _prefsTenantId = 'klarando_display_tenant_id';

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
      ),
      home: const _DisplayRoot(),
    );
  }
}

class _DisplayRoot extends StatefulWidget {
  const _DisplayRoot();

  @override
  State<_DisplayRoot> createState() => _DisplayRootState();
}

class _DisplayRootState extends State<_DisplayRoot> {
  final _api = DisplayApi();

  Timer? _pairingPollTimer;
  Timer? _countdownTimer;
  Timer? _heartbeatTimer;
  Timer? _refreshTimer;

  String? _deviceToken;
  String? _pairingToken;
  String? _pairingSessionId;
  String _pairingCode = '------';
  DateTime? _expiresAt;
  Map<String, dynamic>? _qrPayload;
  Map<String, dynamic>? _content;
  String? _message;
  bool _pairingSessionReady = false;
  int? _lastPairingHttpStatus;
  DateTime? _lastPairingAttemptAt;
  String _lastPollStatus = '-';
  String _lastPollState = '-';
  String _lastPollError = '-';
  bool _lastPollTokenReceived = false;
  static const String _pairingEndpoint = '/api/display/pairing/session';

  @override
  void initState() {
    super.initState();
    _prepareFullscreen();
    _bootstrap();
  }

  @override
  void dispose() {
    _pairingPollTimer?.cancel();
    _countdownTimer?.cancel();
    _heartbeatTimer?.cancel();
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _prepareFullscreen() async {
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  Future<void> _bootstrap() async {
    final prefs = await SharedPreferences.getInstance();
    _deviceToken = prefs.getString(_prefsDeviceToken);

    if (_deviceToken != null && _deviceToken!.isNotEmpty) {
      final ok = await _loadContent();
      if (ok) {
        _startBackgroundJobs();
        return;
      }
      await prefs.remove(_prefsDeviceToken);
      _deviceToken = null;
    }

    await _startPairing();
  }

  Future<void> _startPairing() async {
    _pairingPollTimer?.cancel();
    _countdownTimer?.cancel();
    _heartbeatTimer?.cancel();
    _refreshTimer?.cancel();

    _lastPairingAttemptAt = DateTime.now();
    _lastPairingHttpStatus = null;
    _message = null;
    _pairingSessionReady = false;
    setState(() {});

    try {
      final ui.FlutterView view = ui.PlatformDispatcher.instance.views.first;
      final Size logicalSize = view.physicalSize / view.devicePixelRatio;
      final response = await _api.createPairingSession();
      _pairingToken = '${response['pairingToken'] ?? ''}';
      _pairingSessionId = '${response['sessionId'] ?? response['id'] ?? ''}'.trim();
      _pairingCode = '${response['pairingCode'] ?? '------'}';
      _expiresAt = DateTime.tryParse('${response['expiresAt'] ?? ''}');
      _qrPayload = response['qrPayload'] is Map<String, dynamic>
          ? response['qrPayload'] as Map<String, dynamic>
          : null;
      if (_qrPayload != null) {
        _qrPayload = {
          ..._qrPayload!,
          'deviceResolution': {
            'width': view.physicalSize.width.round(),
            'height': view.physicalSize.height.round(),
            'dpr': double.parse(view.devicePixelRatio.toStringAsFixed(2)),
            'logicalWidth': double.parse(logicalSize.width.toStringAsFixed(1)),
            'logicalHeight': double.parse(logicalSize.height.toStringAsFixed(1)),
            'orientation': view.physicalSize.width >= view.physicalSize.height ? 'LANDSCAPE' : 'PORTRAIT',
          }
        };
      }
      _pairingSessionReady = _pairingToken != null && _pairingToken!.isNotEmpty;
      setState(() {});

      _pairingPollTimer = Timer.periodic(const Duration(seconds: 2), (_) {
        unawaited(_pollPairing());
      });
      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
        final expiresAt = _expiresAt;
        if (expiresAt == null) return;
        if (DateTime.now().isAfter(expiresAt)) {
          unawaited(_startPairing());
        } else {
          setState(() {});
        }
      });
    } catch (error) {
      _pairingSessionReady = false;
      if (error is DisplayApiException) {
        _lastPairingHttpStatus = error.statusCode;
      }
      _message = _toFriendlyError(error);
      setState(() {});
    }
  }

  Future<void> _pollPairing() async {
    final token = _pairingToken;
    if (token == null || token.isEmpty) return;

    try {
      _lastPairingAttemptAt = DateTime.now();
      final response = await _api.getPairingStatus(token);
      final rawStatus = '${response['status'] ?? ''}'.trim();
      final rawState = '${response['state'] ?? ''}'.trim();
      final statusUpper = rawStatus.toUpperCase();
      final stateUpper = rawState.toUpperCase();
      _lastPollStatus = rawStatus.isEmpty ? '-' : rawStatus;
      _lastPollState = rawState.isEmpty ? '-' : rawState;
      _lastPollError = '-';
      if (statusUpper == 'PENDING' || stateUpper == 'PENDING') {
        _lastPollTokenReceived = false;
        _message = null;
        setState(() {});
        return;
      }
      if (statusUpper == 'EXPIRED' || stateUpper == 'EXPIRED') {
        _lastPollTokenReceived = false;
        _message = 'Code abgelaufen. Neuer QR-Code wird erstellt …';
        setState(() {});
        await _startPairing();
        return;
      }
      final isConnectedLike = statusUpper == 'CONNECTED' ||
          statusUpper == 'CLAIMED' ||
          rawStatus.toLowerCase() == 'connected' ||
          rawStatus.toLowerCase() == 'claimed' ||
          stateUpper == 'CONNECTED' ||
          stateUpper == 'CLAIMED' ||
          rawState.toLowerCase() == 'connected' ||
          rawState.toLowerCase() == 'claimed';
      if (!isConnectedLike) {
        _lastPollTokenReceived = false;
        _message = 'Unbekannter Pairing-Status: ${rawStatus.isEmpty ? rawState : rawStatus}';
        setState(() {});
        return;
      }

      final deviceToken = '${response['deviceToken'] ?? response['authToken'] ?? ''}'.trim();
      _lastPollTokenReceived = deviceToken.isNotEmpty;
      if (deviceToken.isEmpty) {
        _message = 'Display verbunden, aber es fehlt ein gültiges Gerätetoken.';
        setState(() {});
        return;
      }

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsDeviceToken, deviceToken);
      final displayId = '${response['displayId'] ?? response['deviceId'] ?? ''}'.trim();
      final screenId = '${response['screenId'] ?? ''}'.trim();
      final tenantId = '${response['tenantId'] ?? ''}'.trim();
      if (displayId.isNotEmpty) {
        await prefs.setString(_prefsDisplayId, displayId);
      }
      if (screenId.isNotEmpty) {
        await prefs.setString(_prefsScreenId, screenId);
      }
      if (tenantId.isNotEmpty) {
        await prefs.setString(_prefsTenantId, tenantId);
      }
      _deviceToken = deviceToken;
      _pairingPollTimer?.cancel();
      _countdownTimer?.cancel();
      _pairingSessionReady = false;
      _message = 'Display wird verbunden …';
      setState(() {});

      final ok = await _loadContent();
      if (ok) {
        _startBackgroundJobs();
      } else {
        await _startPairing();
      }
    } catch (error) {
      _lastPollTokenReceived = false;
      if (error is DisplayApiException) {
        _lastPairingHttpStatus = error.statusCode;
        if (error.statusCode == 410) {
          _lastPollError = error.message;
          _message = 'Code abgelaufen. Neuer QR-Code wird erstellt …';
          setState(() {});
          await _startPairing();
          return;
        }
      }
      _lastPollError = error.toString();
      _message = _toFriendlyError(error);
      setState(() {});
    }
  }

  Future<bool> _loadContent() async {
    final token = _deviceToken;
    if (token == null || token.isEmpty) return false;

    try {
      final response = await _api.getContent(token);
      _content = response;
      _message = null;
      setState(() {});
      return true;
    } catch (error) {
      final message = '$error';
      if (message.contains('ungültig') || message.contains('ungultig') || message.contains('401')) {
        return false;
      }
      _message = _toFriendlyError(error);
      setState(() {});
      return true;
    }
  }

  String _toFriendlyError(Object error) {
    if (error is DisplayApiException) {
      return 'Fehler ${error.statusCode} bei ${error.endpoint}: ${error.message}';
    }
    final raw = error.toString().replaceFirst('Exception:', '').trim();
    if (raw.isEmpty) {
      return 'Verbindung konnte nicht hergestellt werden.';
    }
    return raw;
  }

  void _startBackgroundJobs() {
    _heartbeatTimer?.cancel();
    _refreshTimer?.cancel();

    _heartbeatTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      final token = _deviceToken;
      if (token == null || token.isEmpty) return;
      unawaited(_api.heartbeat(token));
    });

    _refreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      unawaited(_loadContent());
    });
  }

  String _countdownLabel() {
    final expiresAt = _expiresAt;
    if (expiresAt == null) return '--:--';
    final seconds = expiresAt.difference(DateTime.now()).inSeconds;
    if (seconds <= 0) return '00:00';
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final rest = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$rest';
  }

  @override
  Widget build(BuildContext context) {
    if (_content != null) {
      return DisplayContentScreen(content: _content!, connectionMessage: _message);
    }

    if (!_pairingSessionReady) {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  _message ?? 'Pairing-Session wird geladen …',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _startPairing,
                  child: const Text('Erneut versuchen'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final qrPayloadMap = _qrPayload ??
        <String, dynamic>{
          'type': 'DISPLAY_PAIRING',
          'pairingToken': _pairingToken,
          'pairingCode': _pairingCode,
          'apiBaseUrl': 'https://api.klarando.com',
          'expiresAt': _expiresAt?.toIso8601String(),
          if ((_pairingSessionId ?? '').isNotEmpty) 'sessionId': _pairingSessionId,
        };
    final qrPayload = jsonEncode(qrPayloadMap);
    final qrUrl = 'https://api.qrserver.com/v1/create-qr-code/?size=720x720&data=${Uri.encodeComponent(qrPayload)}';
    final debugLines = kDebugMode
        ? <String>[
            'API: ${_api.baseUrl}',
            'Endpoint: $_pairingEndpoint',
            'Letzter HTTP-Status: ${_lastPairingHttpStatus?.toString() ?? '-'}',
            'Letzter Versuch: ${_lastPairingAttemptAt?.toIso8601String() ?? '-'}',
            'Letzter Poll status: $_lastPollStatus',
            'Letzter Poll state: $_lastPollState',
            'Token erhalten: ${_lastPollTokenReceived ? 'ja' : 'nein'}',
            'Letzter Fehler: $_lastPollError',
          ]
        : const <String>[];

    return DisplayPairingScreen(
      qrUrl: qrUrl,
      pairingCode: _pairingCode,
      countdown: _countdownLabel(),
      status: _message,
      debugLines: debugLines,
      onRetry: _startPairing,
    );
  }
}
