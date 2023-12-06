import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:garduino_dashboard/pages/home/widgets/card_stat.dart';
import 'package:garduino_dashboard/model/ZoneDeDanger.dart';
import 'package:garduino_dashboard/services/ApiZoneDeDanger.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<ZoneDeDanger> zoneDeDangerList = [];

  @override
  void initState() {
    super.initState();
    // Fetch zone de danger data when the page loads
    _fetchZoneDeDangerData();
  }

  Future<void> _fetchZoneDeDangerData() async {
    // Fetch zone de danger data from API
    List<ZoneDeDanger> zones = await ApiZoneDeDanger.getZoneDeDanger();

    // Update the state with the fetched data
    setState(() {
      zoneDeDangerList = zones;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Map')),
      body: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFFf2f6fe),
              child: CardStat(
                title: 'Nombre Zone de Danger',
                randomNumber: zoneDeDangerList.length,
              ),
            ),
          ),
          Expanded(
            flex: 2,
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
                    markers: zoneDeDangerList.map((zone) {
                      return Marker(
                        point: LatLng(
                          zone.latitudeDeZoneDanger,
                          zone.longitudeDeZoneDanger,
                        ),
                        width: 80,
                        height: 80,
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      );
                    }).toList(),
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
