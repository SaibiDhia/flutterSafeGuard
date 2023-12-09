import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:garduino_dashboard/pages/home/widgets/card_stat.dart';
import 'package:garduino_dashboard/model/ZoneDeDanger.dart';
import 'package:garduino_dashboard/services/ApiZoneDeDanger.dart';
import 'package:garduino_dashboard/services/ApiCatastrophe.dart';
import 'package:garduino_dashboard/model/Catastrophe.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<ZoneDeDanger> zoneDeDangerList = [];
  List<Catastrophe> catastropheList = [];
  MapController mapController = MapController();

  bool _buttonState = false;
  LatLng? chosenLocation;

  @override
  void initState() {
    super.initState();
    // Fetch zone de danger data when the page loads
    _fetchZoneDeDangerData();
    _fetchCatastropheData();
  }

  Future<void> _fetchCatastropheData() async {
    try {
      List<Catastrophe> ca = await ApiCatastrophe.getCatastrophe();
      setState(() {
        catastropheList = ca;
        print(catastropheList.length);
      });
    } catch (e) {
      // Handle errors (e.g., display an error message)
      print('Error fetching catastrophe data: $e');
    }
  }

  Future<void> _fetchZoneDeDangerData() async {
    // Fetch zone de danger data from API
    List<ZoneDeDanger> zones = await ApiZoneDeDanger.getZoneDeDanger();
    // Update the state with the fetched data
    setState(() {
      zoneDeDangerList = zones;
    });
  }

  // Function to toggle the boolean variable
  void _toggleButtonState() {
    setState(() {
      _buttonState = !_buttonState;
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
                mapController: mapController,
                options: MapOptions(
                  onTap: (TapPosition tapPosition, LatLng point) {
                    if (_buttonState == true) {
                      double latitude = point.latitude;
                      double longitude = point.longitude;
                      // add latitude and longitude to the zoneDeDangerList list
                      zoneDeDangerList = [
                        ...zoneDeDangerList,
                        ZoneDeDanger(
                          idUser: "655e4c47650e78450f573b6a",
                          latitudeDeZoneDanger: latitude,
                          longitudeDeZoneDanger: longitude,
                        ),
                      ];

                      chosenLocation = LatLng(latitude, longitude);
                      ApiZoneDeDanger.createZoneDeDanger(
                          "655e4c47650e78450f573b6a", latitude, longitude);

                      setState(() {
                        // Update the markers when a location is chosen
                      });
                    } else {
                      setState(() {
                        // Handle the case when the button is OFF
                        chosenLocation = null;
                      });
                    }
                  },
                  initialCenter: LatLng(51.509364, -0.128928),
                  initialZoom: 2.2,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _toggleButtonState();
                    },
                    child:
                        Text(_buttonState ? 'Button is ON' : 'Button is OFF'),
                  ),
                  MarkerLayer(
                    markers: [
                      if (chosenLocation != null)
                        Marker(
                          point: chosenLocation!,
                          width: 80,
                          height: 80,
                          // Use the `child` parameter for the widget
                          child: Icon(Icons.location_on,
                              size: 40, color: Colors.blue),
                        ),
                    ],
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
                    circles: catastropheList.map((catastrophe) {
                      double radius = catastrophe.radius * 1000;
                      LatLng center = LatLng(
                        catastrophe.latitudeDeCatastrophe,
                        catastrophe.longitudeDeCatastrophe,
                      );

                      return CircleMarker(
                        point: center,
                        color: const Color.fromARGB(255, 229, 15, 0)
                            .withOpacity(0.4),
                        useRadiusInMeter: true,
                        radius: radius,
                      );
                    }).toList(),
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
