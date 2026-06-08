import 'current_location.dart';

Future<CurrentLocationData> fetchCurrentLocation() async {
  throw const CurrentLocationException(
    'Standortfreigabe ist auf diesem Geraet nicht verfuegbar.',
  );
}

Future<CurrentLocationData> geocodeAddress({
  required String street,
  required String zipCode,
  String? city,
}) async {
  throw const CurrentLocationException(
    'Adresspruefung ist auf diesem Geraet nicht verfuegbar.',
  );
}
