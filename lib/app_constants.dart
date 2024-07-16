import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:latlong2/latlong.dart';

class AppConstants {
  static String mapBoxAccessToken = dotenv.env['ACCESS_TOKEN'] ?? '';
  static String urlTemplate =
      'https://api.mapbox.com/styles/v1/mapbox/outdoors-v12/tiles/{z}/{x}/{y}?access_token=$mapBoxAccessToken';

  static const String mapBoxStyleDarkId = 'mapbox/dark-v11';
  static const String mapBoxStyleOutdoorId = 'mapbox/outdoors-v12';
  static const String mapBoxStyleStreetId = 'mapbox/streets-v12';
  static const String mapBoxStyleNightId = 'mapbox/navigation-night-v1';

  static const myLocation = LatLng(51.5, -0.09);
}
