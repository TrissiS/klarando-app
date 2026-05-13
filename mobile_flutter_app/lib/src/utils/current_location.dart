import 'current_location_stub.dart'
    if (dart.library.html) 'current_location_web.dart'
    if (dart.library.io) 'current_location_mobile.dart' as impl;

class CurrentLocationData {
  const CurrentLocationData({
    required this.latitude,
    required this.longitude,
    required this.addressLine,
    required this.postalCode,
    required this.city,
  });

  final double latitude;
  final double longitude;
  final String? addressLine;
  final String? postalCode;
  final String? city;
}

class CurrentLocationException implements Exception {
  const CurrentLocationException(this.message);

  final String message;

  @override
  String toString() => message;
}

Future<CurrentLocationData> fetchCurrentLocation() {
  return impl.fetchCurrentLocation();
}
