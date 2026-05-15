import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'display_api.dart';
import 'display_content_screen.dart';
import 'display_pairing_screen.dart';

const _prefsDeviceToken = 'klarando_display_device_token';

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

    try {
      final response = await _api.createPairingSession();
      _pairingToken = '${response['pairingToken'] ?? ''}';
      _pairingSessionId = '${response['sessionId'] ?? response['id'] ?? ''}'.trim();
      _pairingCode = '${response['pairingCode'] ?? '------'}';
      _expiresAt = DateTime.tryParse('${response['expiresAt'] ?? ''}');
      _qrPayload = response['qrPayload'] is Map<String, dynamic>
          ? response['qrPayload'] as Map<String, dynamic>
          : null;
      _pairingSessionReady = _pairingToken != null && _pairingToken!.isNotEmpty;
      _message = null;
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
      _message = _toFriendlyError(error);
      setState(() {});
    }
  }

  Future<void> _pollPairing() async {
    final token = _pairingToken;
    if (token == null || token.isEmpty) return;

    try {
      final response = await _api.getPairingStatus(token);
      if ('${response['status']}'.toUpperCase() != 'CLAIMED') return;

      final deviceToken = '${response['deviceToken'] ?? ''}'.trim();
      if (deviceToken.isEmpty) return;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_prefsDeviceToken, deviceToken);
      _deviceToken = deviceToken;

      final ok = await _loadContent();
      if (ok) {
        _startBackgroundJobs();
      }
    } catch (_) {
      // pending/temporary errors
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

    return DisplayPairingScreen(
      qrUrl: qrUrl,
      pairingCode: _pairingCode,
      countdown: _countdownLabel(),
      status: _message,
    );
  }
}
