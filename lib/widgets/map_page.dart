import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:garduino_dashboard/pages/home/widgets/card_stat.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width /
                  2.5, // Adjust the width as needed
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFFf2f6fe),
              child: CardStat(
                title: 'Nombre Zone de Danger',
                randomNumber: 42, // Replace with your random number logic
              ),
            ),
          ),
          Expanded(
            flex: 2, // Adjust the flex factor to make the map take more space
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(51.509364, -0.128928),
                  initialZoom: 2.2,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(30, 40),
                        width: 80,
                        height: 80,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                  CircleLayer(
                    circles: [
                      CircleMarker(
                        point: LatLng(51.50739215592943, -0.127709825533512),
                        radius: 1000000,
                        useRadiusInMeter: true,
                        color: Colors.red.withOpacity(0.5),
                      ),
                    ],
                  ),
                  RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                        onTap: () async {
                          if (await canLaunch(
                              'https://openstreetmap.org/copyright')) {
                            await launch('https://openstreetmap.org/copyright');
                          } else {
                            throw 'Could not launch';
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
