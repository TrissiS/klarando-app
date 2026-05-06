import 'dart:async';
import 'dart:convert';
import 'dart:html' as html;

import 'package:http/http.dart' as http;

import 'current_location.dart';

Future<CurrentLocationData> fetchCurrentLocation() async {
  final geolocation = html.window.navigator.geolocation;
  if (geolocation == null) {
    throw const CurrentLocationException(
      'Standortdienst im Browser nicht verfuegbar.',
    );
  }

  try {
    final position = await geolocation
        .getCurrentPosition(
          enableHighAccuracy: true,
          timeout: const Duration(seconds: 15),
          maximumAge: Duration.zero,
        )
        .timeout(
          const Duration(seconds: 18),
          onTimeout: () => throw const CurrentLocationException(
            'Standortabfrage hat zu lange gedauert.',
          ),
        );

    final coords = position.coords;
    final latitude = (coords?.latitude as num?)?.toDouble();
    final longitude = (coords?.longitude as num?)?.toDouble();

    if (latitude == null || longitude == null) {
      throw const CurrentLocationException(
        'Standortkoordinaten konnten nicht gelesen werden.',
      );
    }

    final reverse = await _reverseGeocode(latitude: latitude, longitude: longitude);

    return CurrentLocationData(
      latitude: latitude,
      longitude: longitude,
      addressLine: reverse.$1,
      postalCode: reverse.$2,
      city: reverse.$3,
    );
  } catch (error) {
    final text = error.toString().toLowerCase();
    if (text.contains('secure') || text.contains('https')) {
      throw const CurrentLocationException(
        'Standort ist nur ueber HTTPS oder localhost erlaubt.',
      );
    }
    if (text.contains('denied') || text.contains('permission')) {
      throw const CurrentLocationException(
        'Standortfreigabe wurde abgelehnt.',
      );
    }
    if (error is CurrentLocationException) {
      rethrow;
    }
    throw CurrentLocationException(
      'Standort konnte nicht ermittelt werden: $error',
    );
  }
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

String? _normalizeText(dynamic value) {
  if (value is! String) {
    return null;
  }
  final trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}
