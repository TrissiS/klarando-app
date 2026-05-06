import 'current_location.dart';

Future<CurrentLocationData> fetchCurrentLocation() async {
  throw const CurrentLocationException(
    'Standortfreigabe ist auf diesem Geraet nicht verfuegbar.',
  );
}
