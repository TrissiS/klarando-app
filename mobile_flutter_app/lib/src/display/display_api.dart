import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/api_environment.dart';

class DisplayApi {
  DisplayApi({String? baseUrl}) : _baseUrl = normalizeApiBaseUrl(baseUrl ?? defaultApiBaseUrl);

  final String _baseUrl;

  Future<Map<String, dynamic>> createPairingSession() async {
    final response = await http.post(
      Uri.parse('$_baseUrl/api/display/pairing/session'),
      headers: const {'Content-Type': 'application/json', 'Accept': 'application/json'},
      body: jsonEncode({
        'deviceName': 'Klarando Display',
        'platform': 'android-tv',
        'appVersion': 'display-1',
      }),
    );
    return _decode(response);
  }

  Future<Map<String, dynamic>> getPairingStatus(String pairingToken) async {
    final response = await http.get(Uri.parse('$_baseUrl/api/display/pairing/session/$pairingToken'));
    return _decode(response);
  }

  Future<Map<String, dynamic>> getContent(String deviceToken) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/api/display/content'),
      headers: {'Authorization': 'Bearer $deviceToken'},
    );
    return _decode(response);
  }

  Future<void> heartbeat(String deviceToken) async {
    await http.post(
      Uri.parse('$_baseUrl/api/display/heartbeat'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $deviceToken',
      },
      body: jsonEncode({'screenStatus': 'ONLINE', 'appVersion': 'display-1'}),
    );
  }

  Map<String, dynamic> _decode(http.Response response) {
    final body = response.body.isNotEmpty
        ? (jsonDecode(response.body) as Map<String, dynamic>)
        : <String, dynamic>{};
    if (response.statusCode < 200 || response.statusCode >= 300) {
      final message = '${body['message'] ?? body['error'] ?? 'Display-API Fehler'}';
      throw Exception(message);
    }
    return body;
  }
}
