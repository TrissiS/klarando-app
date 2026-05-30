import 'dart:convert';

import 'api_environment.dart';

enum PairingPayloadType {
  orderDesk,
  driver,
}

class ParsedPairingPayload {
  const ParsedPairingPayload({
    required this.token,
    required this.rawPayload,
    required this.type,
    required this.apiBaseUrl,
    this.tenantId,
    this.displayCode,
    this.expiresAt,
  });

  final String token;
  final String rawPayload;
  final PairingPayloadType? type;
  final String apiBaseUrl;
  final String? tenantId;
  final String? displayCode;
  final DateTime? expiresAt;
}

String defaultPairingApiBaseUrl() {
  return normalizeApiBaseUrl('https://api.klarando.com');
}

ParsedPairingPayload? parsePairingPayload(
  String rawValue, {
  PairingPayloadType? expectedType,
}) {
  final raw = _sanitizeScannerInput(rawValue);
  if (raw.isEmpty) {
    return null;
  }

  const orderDeskEncodedPrefix = 'KLARANDO_ORDERDESK_PAIRING:';
  if (raw.startsWith(orderDeskEncodedPrefix)) {
    final encodedPayload = raw.substring(orderDeskEncodedPrefix.length);
    if (encodedPayload.isEmpty) {
      return null;
    }
    try {
      final normalizedBase64 = encodedPayload
          .replaceAll('-', '+')
          .replaceAll('_', '/');
      final padding = (4 - normalizedBase64.length % 4) % 4;
      final paddedBase64 = '$normalizedBase64${'=' * padding}';
      final decodedPayload = utf8.decode(base64Decode(paddedBase64));
      return parsePairingPayload(
        decodedPayload,
        expectedType: expectedType,
      );
    } catch (_) {
      return null;
    }
  }

  if (raw.startsWith('{')) {
    try {
      final parsed = jsonDecode(raw);
      if (parsed is! Map<String, dynamic>) {
        return null;
      }
      final normalizedType = _parseType(parsed['type']);
      if (expectedType != null && normalizedType != null && normalizedType != expectedType) {
        return null;
      }
      final token = _normalizeText(parsed['pairingToken']) ?? _normalizeText(parsed['token']);
      if (token == null) {
        return null;
      }
      final apiBaseUrl = normalizeApiBaseUrl(
        _normalizeText(parsed['apiBaseUrl']) ?? defaultPairingApiBaseUrl(),
      );
      return ParsedPairingPayload(
        token: token,
        rawPayload: raw,
        type: normalizedType,
        apiBaseUrl: apiBaseUrl,
        tenantId: _normalizeText(parsed['tenantId']),
        displayCode: _normalizeText(parsed['displayCode'])?.toUpperCase(),
        expiresAt: _parseDateTime(parsed['expiresAt']),
      );
    } catch (_) {
      return null;
    }
  }

  final legacyDriverPrefix = 'klarando-driver-pair:';
  if (raw.startsWith(legacyDriverPrefix)) {
    final parts = raw.split(':');
    if (parts.length < 3) {
      return null;
    }
    if (expectedType != null && expectedType != PairingPayloadType.driver) {
      return null;
    }
    return ParsedPairingPayload(
      token: parts.sublist(2).join(':'),
      rawPayload: raw,
      type: PairingPayloadType.driver,
      apiBaseUrl: defaultPairingApiBaseUrl(),
      displayCode: _normalizeText(parts[1])?.toUpperCase(),
    );
  }

  final legacyOrderDeskPrefix = 'klarando-orderdesk-pair:';
  if (raw.startsWith(legacyOrderDeskPrefix)) {
    final parts = raw.split(':');
    if (parts.length < 3) {
      return null;
    }
    if (expectedType != null && expectedType != PairingPayloadType.orderDesk) {
      return null;
    }
    return ParsedPairingPayload(
      token: parts.sublist(2).join(':'),
      rawPayload: raw,
      type: PairingPayloadType.orderDesk,
      apiBaseUrl: defaultPairingApiBaseUrl(),
      displayCode: _normalizeText(parts[1])?.toUpperCase(),
    );
  }

  return ParsedPairingPayload(
    token: raw,
    rawPayload: raw,
    type: null,
    apiBaseUrl: defaultPairingApiBaseUrl(),
  );
}

String _sanitizeScannerInput(String rawValue) {
  return rawValue
      .replaceAll('\r', '')
      .replaceAll('\n', '')
      .replaceAll(' ', '')
      .trim();
}

PairingPayloadType? _parseType(Object? value) {
  final raw = _normalizeText(value)?.toUpperCase();
  switch (raw) {
    case 'ORDER_DESK_PAIRING':
      return PairingPayloadType.orderDesk;
    case 'DRIVER_PAIRING':
      return PairingPayloadType.driver;
    default:
      return null;
  }
}

String? _normalizeText(Object? value) {
  if (value is! String) {
    return null;
  }
  final trimmed = value.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  return trimmed;
}

DateTime? _parseDateTime(Object? value) {
  final raw = _normalizeText(value);
  if (raw == null) {
    return null;
  }
  return DateTime.tryParse(raw)?.toLocal();
}
