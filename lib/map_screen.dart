import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'app_constants.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  void launchUrl(Uri uri) {
    // Launch the URL in a web browser
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(51.509364, -0.928928),
        initialZoom: 2.2,
      ),
      children: [
        TileLayer(
          urlTemplate: AppConstants.urlTemplate,
          userAgentPackageName: 'com.example.app',
        ),
        PolylineLayer(
          polylines: [
            Polyline(
              points: [
                const LatLng(36.95, -9.5),
              ],
              color: Colors.blue,
              strokeWidth: 2,
              borderStrokeWidth: 2,
              borderColor: Colors.blue,
            ),
          ],
        ),
        CircleLayer(
          circles: [
            CircleMarker(
              point: const LatLng(52.2677, 5.1689),
              // center of 't Gooi
              radius: 5000,
              useRadiusInMeter: true,
              color: Colors.red.withOpacity(0.3),
              borderColor: Colors.red.withOpacity(0.7),
              borderStrokeWidth: 2,
            )
          ],
        ),
        const MarkerLayer(
          markers: [
            Marker(
                point: LatLng(51.509364, -0.128928),
                width: 80,
                height: 80,
                child: Icon(
                  Icons.location_on,
                  size: 80,
                  color: Colors.red,
                )),
          ],
        )
      ],
    );
  }
}
