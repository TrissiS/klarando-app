import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/api_environment.dart';

class DisplayApiException implements Exception {
  DisplayApiException({
    required this.message,
    required this.endpoint,
    required this.statusCode,
  });

  final String message;
  final String endpoint;
  final int statusCode;

  @override
  String toString() => '[$statusCode] $endpoint: $message';
}

class DisplayApi {
  DisplayApi({String? baseUrl}) : _baseUrl = normalizeApiBaseUrl(baseUrl ?? defaultApiBaseUrl);

  final String _baseUrl;
  String get baseUrl => _baseUrl;

  Future<Map<String, dynamic>> createPairingSession() async {
    final endpoint = '/api/display/pairing/session';
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: const {'Content-Type': 'application/json', 'Accept': 'application/json'},
      body: jsonEncode({
        'deviceName': 'Klarando Display',
        'platform': 'android-tv',
        'appVersion': 'display-1',
      }),
    );
    return _decode(response, endpoint);
  }

  Future<Map<String, dynamic>> getPairingStatus(String pairingToken) async {
    final endpoint = '/api/display/pairing/session/$pairingToken';
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));
    return _decode(response, endpoint);
  }

  Future<Map<String, dynamic>> getContent(String deviceToken) async {
    final endpoint = '/api/display/content';
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {'Authorization': 'Bearer $deviceToken'},
    );
    return _decode(response, endpoint);
  }

  Future<void> heartbeat(String deviceToken) async {
    final endpoint = '/api/display/heartbeat';
    await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $deviceToken',
      },
      body: jsonEncode({'screenStatus': 'ONLINE', 'appVersion': 'display-1'}),
    );
  }

  Map<String, dynamic> _decode(http.Response response, String endpoint) {
    final body = response.body.isNotEmpty
        ? (jsonDecode(response.body) as Map<String, dynamic>)
        : <String, dynamic>{};
    if (response.statusCode < 200 || response.statusCode >= 300) {
      final message = '${body['message'] ?? body['error'] ?? 'Display-API Fehler'}';
      throw DisplayApiException(
        message: message,
        endpoint: endpoint,
        statusCode: response.statusCode,
      );
    }
    return body;
  }
}
