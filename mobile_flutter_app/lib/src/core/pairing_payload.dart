import 'dart:convert';

import 'api_environment.dart';

enum PairingPayloadType {
  orderDesk,
  driver,
}

enum PairingPayloadParseFailure {
  empty,
  unreadable,
  wrongType,
  missingToken,
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

class PairingPayloadParseResult {
  const PairingPayloadParseResult({
    required this.normalizedInput,
    this.payload,
    this.failure,
    this.detectedType,
    this.hasToken = false,
    this.hasApiBaseUrl = false,
  });

  final String normalizedInput;
  final ParsedPairingPayload? payload;
  final PairingPayloadParseFailure? failure;
  final PairingPayloadType? detectedType;
  final bool hasToken;
  final bool hasApiBaseUrl;

  bool get isSuccess => payload != null;
}

String defaultPairingApiBaseUrl() {
  return normalizeApiBaseUrl('https://api.klarando.com');
}

ParsedPairingPayload? parsePairingPayload(
  String rawValue, {
  PairingPayloadType? expectedType,
}) {
  return parsePairingPayloadDetailed(
    rawValue,
    expectedType: expectedType,
  ).payload;
}

PairingPayloadParseResult parsePairingPayloadDetailed(
  String rawValue, {
  PairingPayloadType? expectedType,
}) {
  final raw = _sanitizeScannerInput(rawValue);
  if (raw.isEmpty) {
    return PairingPayloadParseResult(
      normalizedInput: raw,
      failure: PairingPayloadParseFailure.empty,
    );
  }

  const orderDeskEncodedPrefix = 'KLARANDO_ORDERDESK_PAIRING:';
  if (raw.startsWith(orderDeskEncodedPrefix)) {
    final encodedPayload = raw.substring(orderDeskEncodedPrefix.length);
    if (encodedPayload.isEmpty) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.unreadable,
      );
    }
    try {
      final normalizedBase64 = encodedPayload
          .replaceAll('-', '+')
          .replaceAll('_', '/');
      final padding = (4 - normalizedBase64.length % 4) % 4;
      final paddedBase64 = '$normalizedBase64${'=' * padding}';
      final decodedPayload = utf8.decode(base64Decode(paddedBase64));
      return parsePairingPayloadDetailed(
        decodedPayload,
        expectedType: expectedType,
      );
    } catch (_) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.unreadable,
      );
    }
  }

  if (raw.startsWith('{')) {
    try {
      final parsed = jsonDecode(raw);
      if (parsed is! Map<String, dynamic>) {
        return PairingPayloadParseResult(
          normalizedInput: raw,
          failure: PairingPayloadParseFailure.unreadable,
        );
      }
      final normalizedType = _parseType(parsed['type']);
      if (expectedType != null && normalizedType != null && normalizedType != expectedType) {
        return PairingPayloadParseResult(
          normalizedInput: raw,
          failure: PairingPayloadParseFailure.wrongType,
          detectedType: normalizedType,
        );
      }
      final token = _normalizeText(parsed['pairingToken']) ?? _normalizeText(parsed['token']);
      if (token == null) {
        return PairingPayloadParseResult(
          normalizedInput: raw,
          failure: PairingPayloadParseFailure.missingToken,
          detectedType: normalizedType,
          hasApiBaseUrl: _normalizeText(parsed['apiBaseUrl']) != null,
        );
      }
      final apiBaseUrl = normalizeApiBaseUrl(
        _normalizeText(parsed['apiBaseUrl']) ?? defaultPairingApiBaseUrl(),
      );
      return PairingPayloadParseResult(
        normalizedInput: raw,
        payload: ParsedPairingPayload(
          token: token,
          rawPayload: raw,
          type: normalizedType,
          apiBaseUrl: apiBaseUrl,
          tenantId: _normalizeText(parsed['tenantId']),
          displayCode: _normalizeText(parsed['displayCode'])?.toUpperCase(),
          expiresAt: _parseDateTime(parsed['expiresAt']),
        ),
        detectedType: normalizedType,
        hasToken: true,
        hasApiBaseUrl: _normalizeText(parsed['apiBaseUrl']) != null,
      );
    } catch (_) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.unreadable,
      );
    }
  }

  final legacyDriverPrefix = 'klarando-driver-pair:';
  if (raw.startsWith(legacyDriverPrefix)) {
    final parts = raw.split(':');
    if (parts.length < 3) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.missingToken,
        detectedType: PairingPayloadType.driver,
      );
    }
    if (expectedType != null && expectedType != PairingPayloadType.driver) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.wrongType,
        detectedType: PairingPayloadType.driver,
      );
    }
    return PairingPayloadParseResult(
      normalizedInput: raw,
      payload: ParsedPairingPayload(
        token: parts.sublist(2).join(':'),
        rawPayload: raw,
        type: PairingPayloadType.driver,
        apiBaseUrl: defaultPairingApiBaseUrl(),
        displayCode: _normalizeText(parts[1])?.toUpperCase(),
      ),
      detectedType: PairingPayloadType.driver,
      hasToken: true,
    );
  }

  final legacyOrderDeskPrefix = 'klarando-orderdesk-pair:';
  if (raw.startsWith(legacyOrderDeskPrefix)) {
    final parts = raw.split(':');
    if (parts.length < 3) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.missingToken,
        detectedType: PairingPayloadType.orderDesk,
      );
    }
    if (expectedType != null && expectedType != PairingPayloadType.orderDesk) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.wrongType,
        detectedType: PairingPayloadType.orderDesk,
      );
    }
    return PairingPayloadParseResult(
      normalizedInput: raw,
      payload: ParsedPairingPayload(
        token: parts.sublist(2).join(':'),
        rawPayload: raw,
        type: PairingPayloadType.orderDesk,
        apiBaseUrl: defaultPairingApiBaseUrl(),
        displayCode: _normalizeText(parts[1])?.toUpperCase(),
      ),
      detectedType: PairingPayloadType.orderDesk,
      hasToken: true,
    );
  }

  return PairingPayloadParseResult(
    normalizedInput: raw,
    payload: ParsedPairingPayload(
      token: raw,
      rawPayload: raw,
      type: null,
      apiBaseUrl: defaultPairingApiBaseUrl(),
    ),
    hasToken: true,
  );
}

String _sanitizeScannerInput(String rawValue) {
  final withoutControlChars = rawValue.replaceAll(RegExp(r'[\u0000-\u001F\u007F]'), '');
  final normalizedWhitespace = withoutControlChars
      .replaceAll('\u00A0', ' ')
      .replaceAll(RegExp(r'\s+'), '');
  return normalizedWhitespace.trim();
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
