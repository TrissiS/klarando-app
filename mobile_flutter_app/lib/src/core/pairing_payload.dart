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
    this.usedExpectedTypeFallback = false,
    this.hasToken = false,
    this.hasApiBaseUrl = false,
    this.usingDefaultApiBaseUrl = false,
  });

  final String normalizedInput;
  final ParsedPairingPayload? payload;
  final PairingPayloadParseFailure? failure;
  final PairingPayloadType? detectedType;
  final bool usedExpectedTypeFallback;
  final bool hasToken;
  final bool hasApiBaseUrl;
  final bool usingDefaultApiBaseUrl;

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
  const orderDeskHexPrefix = 'KOD';
  final upperRaw = raw.toUpperCase();
  if (upperRaw.startsWith(orderDeskHexPrefix)) {
    final hexPayload = upperRaw.substring(orderDeskHexPrefix.length).trim();
    if (hexPayload.isEmpty || hexPayload.length.isOdd || !RegExp(r'^[0-9A-F]+$').hasMatch(hexPayload)) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.unreadable,
      );
    }
    try {
      final bytes = <int>[];
      for (var index = 0; index < hexPayload.length; index += 2) {
        bytes.add(int.parse(hexPayload.substring(index, index + 2), radix: 16));
      }
      final decodedPayload = utf8.decode(bytes);
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

  if (_looksLikeHexPayload(upperRaw)) {
    final decoded = _decodeHexToUtf8(upperRaw);
    if (decoded != null) {
      return parsePairingPayloadDetailed(
        decoded,
        expectedType: expectedType,
      );
    }
  }

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
      final normalizedType = _parseType(parsed['type'] ?? parsed['payloadType']);
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
      final explicitApiBaseUrl = _normalizeText(
        parsed['apiBaseUrl'] ?? parsed['apiUrl'] ?? parsed['baseUrl'],
      );
      final apiBaseUrl = normalizeApiBaseUrl(
        explicitApiBaseUrl ?? defaultPairingApiBaseUrl(),
      );
      final effectiveType = normalizedType ?? expectedType;
      return PairingPayloadParseResult(
        normalizedInput: raw,
        payload: ParsedPairingPayload(
          token: token,
          rawPayload: raw,
          type: effectiveType,
          apiBaseUrl: apiBaseUrl,
          tenantId: _normalizeText(parsed['tenantId']),
          displayCode: _normalizeText(parsed['displayCode'] ?? parsed['deviceCode'])?.toUpperCase(),
          expiresAt: _parseDateTime(parsed['expiresAt']),
        ),
        detectedType: effectiveType,
        usedExpectedTypeFallback: normalizedType == null && expectedType != null,
        hasToken: true,
        hasApiBaseUrl: explicitApiBaseUrl != null,
        usingDefaultApiBaseUrl: explicitApiBaseUrl == null,
      );
    } catch (_) {
      return PairingPayloadParseResult(
        normalizedInput: raw,
        failure: PairingPayloadParseFailure.unreadable,
      );
    }
  }

  final decodedToken = _decodeJsonWrappedToken(raw);
  if (decodedToken != null) {
    final fallbackType = expectedType;
    return PairingPayloadParseResult(
      normalizedInput: raw,
      payload: ParsedPairingPayload(
        token: decodedToken,
        rawPayload: decodedToken,
        type: fallbackType,
        apiBaseUrl: defaultPairingApiBaseUrl(),
      ),
      detectedType: fallbackType,
      usedExpectedTypeFallback: fallbackType != null,
      hasToken: true,
      usingDefaultApiBaseUrl: true,
    );
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
      usingDefaultApiBaseUrl: true,
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
      usingDefaultApiBaseUrl: true,
    );
  }

  final fallbackType = expectedType;
  return PairingPayloadParseResult(
    normalizedInput: raw,
    payload: ParsedPairingPayload(
      token: raw,
      rawPayload: raw,
      type: fallbackType,
      apiBaseUrl: defaultPairingApiBaseUrl(),
    ),
    detectedType: fallbackType,
    usedExpectedTypeFallback: fallbackType != null,
    hasToken: true,
    usingDefaultApiBaseUrl: true,
  );
}

bool _looksLikeHexPayload(String value) {
  return value.length >= 32 && value.length.isEven && RegExp(r'^[0-9A-F]+$').hasMatch(value);
}

String? _decodeHexToUtf8(String value) {
  if (!_looksLikeHexPayload(value)) {
    return null;
  }
  try {
    final bytes = <int>[];
    for (var index = 0; index < value.length; index += 2) {
      bytes.add(int.parse(value.substring(index, index + 2), radix: 16));
    }
    return utf8.decode(bytes);
  } catch (_) {
    return null;
  }
}

String? _decodeJsonWrappedToken(String value) {
  if (!(value.startsWith('"') && value.endsWith('"'))) {
    return null;
  }
  try {
    final decoded = jsonDecode(value);
    if (decoded is! String) {
      return null;
    }
    return _normalizeText(decoded);
  } catch (_) {
    return null;
  }
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
