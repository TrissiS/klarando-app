import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'current_location.dart';

Future<CurrentLocationData> fetchCurrentLocation() async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw const CurrentLocationException('Standortdienst ist deaktiviert.');
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.denied) {
    throw const CurrentLocationException('Standortfreigabe wurde abgelehnt.');
  }
  if (permission == LocationPermission.deniedForever) {
    throw const CurrentLocationException(
      'Standortfreigabe wurde dauerhaft abgelehnt. Bitte in den Android-Einstellungen aktivieren.',
    );
  }

  final position = await Geolocator.getCurrentPosition(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      timeLimit: Duration(seconds: 18),
    ),
  );

  final reverse = await _reverseGeocode(
    latitude: position.latitude,
    longitude: position.longitude,
  );

  return CurrentLocationData(
    latitude: position.latitude,
    longitude: position.longitude,
    addressLine: reverse.$1,
    postalCode: reverse.$2,
    city: reverse.$3,
  );
}

Future<CurrentLocationData> geocodeAddress({
  required String street,
  required String zipCode,
  String? city,
}) async {
  final resolved = await _forwardGeocode(
    street: street,
    zipCode: zipCode,
    city: city,
  );
  if (resolved == null) {
    throw const CurrentLocationException(
      'Adresse konnte nicht genau genug gefunden werden. Bitte Straße und Hausnummer prüfen.',
    );
  }
  return resolved;
}

Future<(String?, String?, String?)> _reverseGeocode({
  required double latitude,
  required double longitude,
}) async {
  final uri = Uri.parse(
    'https://nominatim.openstreetmap.org/reverse'
    '?format=jsonv2'
    '&lat=$latitude'
    '&lon=$longitude'
    '&addressdetails=1'
    '&accept-language=de',
  );

  try {
    final response = await http.get(
      uri,
      headers: const {
        'Accept': 'application/json',
        'User-Agent': 'klarando-mobile/1.0',
      },
    ).timeout(const Duration(seconds: 8));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      return (null, null, null);
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      return (null, null, null);
    }

    final address = decoded['address'];
    final displayName = decoded['display_name'];
    if (address is! Map<String, dynamic>) {
      return (displayName is String ? displayName : null, null, null);
    }

    final postcode = _normalizeText(address['postcode']);
    final city = _normalizeText(address['city']) ??
        _normalizeText(address['town']) ??
        _normalizeText(address['village']) ??
        _normalizeText(address['municipality']);
    final road = _normalizeText(address['road']) ??
        _normalizeText(address['pedestrian']) ??
        _normalizeText(address['footway']);
    final houseNumber = _normalizeText(address['house_number']);

    final addressLine = () {
      if (road != null && houseNumber != null) {
        return '$road $houseNumber';
      }
      if (road != null) {
        return road;
      }
      if (displayName is String && displayName.trim().isNotEmpty) {
        return displayName.trim();
      }
      return null;
    }();

    return (addressLine, postcode, city);
  } catch (_) {
    return (null, null, null);
  }
}

Future<CurrentLocationData?> _forwardGeocode({
  required String street,
  required String zipCode,
  String? city,
}) async {
  final normalizedStreet = street.trim();
  final normalizedZip = zipCode.trim();
  final normalizedCity = city?.trim() ?? '';
  final query = [
    normalizedStreet,
    '$normalizedZip ${normalizedCity.trim()}'.trim(),
    'Deutschland',
  ].where((entry) => entry.isNotEmpty).join(', ');

  final uri = Uri.parse(
    'https://nominatim.openstreetmap.org/search'
    '?format=jsonv2'
    '&limit=1'
    '&addressdetails=1'
    '&countrycodes=de'
    '&accept-language=de'
    '&q=${Uri.encodeQueryComponent(query)}',
  );

  try {
    final response = await http.get(
      uri,
      headers: const {
        'Accept': 'application/json',
        'User-Agent': 'klarando-mobile/1.0',
      },
    ).timeout(const Duration(seconds: 8));

    if (response.statusCode < 200 || response.statusCode >= 300) {
      return null;
    }

    final decoded = jsonDecode(response.body);
    if (decoded is! List || decoded.isEmpty) {
      return null;
    }

    final first = decoded.first;
    if (first is! Map<String, dynamic>) {
      return null;
    }

    final latitude = double.tryParse('${first['lat'] ?? ''}');
    final longitude = double.tryParse('${first['lon'] ?? ''}');
    if (latitude == null || longitude == null) {
      return null;
    }

    final address = first['address'];
    final addressMap = address is Map<String, dynamic> ? address : const <String, dynamic>{};
    final road = _normalizeText(addressMap['road']) ??
        _normalizeText(addressMap['pedestrian']) ??
        _normalizeText(addressMap['footway']);
    final houseNumber = _normalizeText(addressMap['house_number']);
    final postcode = _normalizeText(addressMap['postcode']) ?? normalizedZip;
    final resolvedCity = _normalizeText(addressMap['city']) ??
        _normalizeText(addressMap['town']) ??
        _normalizeText(addressMap['village']) ??
        _normalizeText(addressMap['municipality']) ??
        (normalizedCity.isEmpty ? null : normalizedCity);
    final addressLine = () {
      if (road != null && houseNumber != null) {
        return '$road $houseNumber';
      }
      if (road != null) {
        return road;
      }
      return normalizedStreet;
    }();

    return CurrentLocationData(
      latitude: latitude,
      longitude: longitude,
      addressLine: addressLine,
      postalCode: postcode,
      city: resolvedCity,
    );
  } catch (_) {
    return null;
  }
}

String? _normalizeText(dynamic value) {
  if (value is! String) {
    return null;
  }
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}
