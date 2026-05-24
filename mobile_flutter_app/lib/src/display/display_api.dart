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
        'deviceMeta': {
          'supportsKiosk': true,
        }
      }),
    );
    return _decode(response, endpoint);
  }

  Future<Map<String, dynamic>> getPairingStatus(String pairingToken) async {
    final endpoint = '/api/display/pairing/session/$pairingToken';
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));
    return _decode(response, endpoint);
  }

  Future<DisplayContentResponse> getManifest(
    String deviceCode, {
    String? etag,
  }) async {
    final normalizedCode = deviceCode.trim().toUpperCase();
    final endpoint = '/api/display-runtime/$normalizedCode/manifest';
    final headers = <String, String>{};
    final normalizedEtag = etag?.trim();
    if (normalizedEtag != null && normalizedEtag.isNotEmpty) {
      headers['If-None-Match'] = normalizedEtag;
    }
    final response = await http.get(
      Uri.parse('$_baseUrl$endpoint'),
      headers: headers,
    );
    if (response.statusCode == 304) {
      return DisplayContentResponse(
        endpoint: endpoint,
        statusCode: 304,
        content: null,
        etag: response.headers['etag'] ?? normalizedEtag,
      );
    }
    final decoded = _decode(response, endpoint);
    return DisplayContentResponse(
      endpoint: endpoint,
      statusCode: response.statusCode,
      content: decoded,
      etag: response.headers['etag'],
    );
  }

  Future<void> heartbeat(String deviceCode) async {
    final normalizedCode = deviceCode.trim().toUpperCase();
    final endpoint = '/api/display-runtime/$normalizedCode/heartbeat';
    await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'diagnostics': {
          'appVersion': 'display-1',
        },
      }),
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

class DisplayContentResponse {
  DisplayContentResponse({
    required this.endpoint,
    required this.statusCode,
    required this.content,
    required this.etag,
  });

  final String endpoint;
  final int statusCode;
  final Map<String, dynamic>? content;
  final String? etag;

  bool get notModified => statusCode == 304;
}
