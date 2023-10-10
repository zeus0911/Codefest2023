import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/MAP/distancecalc.dart';
import 'package:flutter_application_1/services/provider/Markerprovider.dart';
import 'package:flutter_application_1/utils/routes/routes.dart';
import 'package:flutter_application_1/resources/components/businfotile.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ViewBusView extends StatefulWidget {
  const ViewBusView({super.key});

  @override
  State<ViewBusView> createState() => _ViewBusViewState();
}

class _ViewBusViewState extends State<ViewBusView> {
  MAPDISTANCE mapdistance = MAPDISTANCE();
  List<LatLng> aroutess = [];
  List<LatLng> broutess = [];
  List<LatLng> croutess = [];
  List<LatLng> droutess = [];
  List<LatLng> eroutess = [];

  late Timer aTimer;
  late Timer bTimer;
  late Timer cTimer;
  late Timer dTimer;
  late Timer eTimer;

  late Timer timer;
  func() async {
    List<List<LatLng>> routes = await mapdistance.fetchAndDrawRoute(
      27.691152,
      85.317635, //maitighat
      27.623939,
      85.304224, //ekantakuna

      27.710865,
      85.314851, //Dilli bazar
      27.597818,
      85.371219, //Dodawari

      27.693456,
      85.281605, //Kalanki
      27.707927,
      85.343316, //Gaushala

      27.706072,
      85.316224, //Ratnapark
      27.660994,
      85.446476,
      //Suryabinaya
      27.706072,
      85.316224, //Ratnapark
      27.660994,
      85.446476,
    );
    aroutess = routes[0];
    broutess = routes[1];
    croutess = routes[2];
    droutess = routes[3];
    eroutess = routes[4];

    // return routes;
    int a = 0;
    int b = 0;
    int c = 0;
    int d = 0;
    int e = 0;
    aTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      if (a < aroutess.length) {
        Provider.of<MarkerProvider>(context, listen: false)
            .aupdateMarkerLatLng(aroutess[a]);
        a++;
      } else {
        timer.cancel();
      }
    });

    bTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      if (b < broutess.length) {
        Provider.of<MarkerProvider>(context, listen: false)
            .bupdateMarkerLatLng(broutess[b]);
        b++;
      } else {
        timer.cancel();
      }
    });

    cTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      if (c < croutess.length) {
        Provider.of<MarkerProvider>(context, listen: false)
            .cupdateMarkerLatLng(croutess[c]);
        c++;
      } else {
        timer.cancel();
      }
    });

    dTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      if (d < droutess.length) {
        Provider.of<MarkerProvider>(context, listen: false)
            .dupdateMarkerLatLng(droutess[d]);
        d++;
      } else {
        timer.cancel();
      }
    });

    eTimer = Timer.periodic(const Duration(milliseconds: 1000), (timer) async {
      if (e < eroutess.length) {
        Provider.of<MarkerProvider>(context, listen: false)
            .eupdateMarkerLatLng(eroutess[e]);
        e++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    func();
  }

  @override
  Widget build(BuildContext context) {
    // func();
    return Scaffold(
      body: FutureBuilder(
        future: mapdistance.fetchAndDrawRoute(
          27.691152,
          85.317635, //maitighat
          27.623939,
          85.304224, //ekantakuna

          27.710865,
          85.314851, //Dilli bazar
          27.597818,
          85.371219, //Dodawari

          27.693456,
          85.281605, //Kalanki
          27.707927,
          85.343316, //Gaushala

          27.706072,
          85.316224, //Ratnapark
          27.660994,
          85.446476, //Suryabinayak

          27.706072,
          85.316224, //Ratnapark
          27.660994,
          85.446476, //Suryabinayak
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the Future is still running, display a loading indicator.
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // If there was an error, display an error message.
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data.isEmpty) {
            // If there is no data or the data is empty, display a message.
            return const Text('No route available.');
          } else {
            // If the data is available, build the map with the route.
            final routePoints = snapshot.data;
            return SlidingUpPanel(
              minHeight: 100,
              maxHeight: 500,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              panel: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Center(
                      child: Text(
                        "Nearby Routes",
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: GoogleFonts.bebasNeue().fontFamily,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(225, 0, 187, 134),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    BusInfoTile(
                      busPhoto: 'assets/busone.jpeg',
                      route: "Route 123",
                      busNumber: "Bus #1",
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.busoneview);
                      },
                    ),
                    const Divider(),
                    BusInfoTile(
                      busPhoto: 'assets/white-bus.jpeg',
                      route: "Route 456",
                      busNumber: "Bus #2",
                      onTap: () {},
                    ),
                    const Divider(),
                    BusInfoTile(
                      busPhoto: 'assets/mayur.jpeg',
                      route: "Route 789",
                      busNumber: "Bus #3",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              body: Center(
                  child: Column(
                children: [
                  Flexible(
                    child: FlutterMap(
                      options: MapOptions(
                        center: const LatLng(27.677109, 85.332748),
                        zoom: 13,
                      ),
                      children: [
                        TileLayer(
                          retinaMode: true,
                          urlTemplate:
                              'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        Consumer<MarkerProvider>(
                          builder: (context, markerProvider, _) {
                            final _aanimatedLatLng =
                                markerProvider.amarkerLatLng;
                            final _banimatedLatLng =
                                markerProvider.bmarkerLatLng;
                            final _canimatedLatLng =
                                markerProvider.cmarkerLatLng;
                            final _danimatedLatLng =
                                markerProvider.dmarkerLatLng;
                            final _eanimatedLatLng =
                                markerProvider.emarkerLatLng;

                            return MarkerLayer(
                              markers: [
                                Marker(
                                  width: 30.0,
                                  height: 30.0,
                                  point: _aanimatedLatLng,
                                  builder: (ctx) => const CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                        Color.fromARGB(255, 181, 177, 177),
                                    child: Icon(
                                      Icons.bus_alert_sharp,
                                      size: 20.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                Marker(
                                  width: 30.0,
                                  height: 30.0,
                                  point: _banimatedLatLng,
                                  builder: (ctx) => const CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                        Color.fromARGB(255, 181, 177, 177),
                                    child: Icon(
                                      Icons.bus_alert_sharp,
                                      size: 20.0,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Marker(
                                  width: 30.0,
                                  height: 30.0,
                                  point: _canimatedLatLng,
                                  builder: (ctx) => const CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                        Color.fromARGB(255, 181, 177, 177),
                                    child: Icon(
                                      Icons.bus_alert_sharp,
                                      size: 20.0,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                Marker(
                                  width: 30.0,
                                  height: 30.0,
                                  point: _danimatedLatLng,
                                  builder: (ctx) => const CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                        Color.fromARGB(255, 181, 177, 177),
                                    child: Icon(
                                      Icons.bus_alert_sharp,
                                      size: 20.0,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                                Marker(
                                  width: 30.0,
                                  height: 30.0,
                                  point: _eanimatedLatLng,
                                  builder: (ctx) => const CircleAvatar(
                                    radius: 10,
                                    backgroundColor:
                                    Color.fromARGB(255, 181, 177, 177),
                                    child: Icon(
                                      Icons.bus_alert_sharp,
                                      size: 20.0,
                                      color: Colors.purple,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 30.0,
                              height: 30.0,
                              point: const LatLng(27.677121, 85.332963),
                              builder: (ctx) => const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.blue,
                                child: Icon(
                                  Icons.location_pin,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        PolylineLayer(
                          polylines: [
                            Polyline(
                                points: routePoints[0],
                                strokeWidth: 4, // Width of the route line
                                color: Colors.blue
                                // Color of the route line
                                ),
                            Polyline(
                                points: routePoints[1],
                                strokeWidth: 4, // Width of the route line
                                color: Colors.red // Color of the route line
                                ),
                            Polyline(
                                points: routePoints[2],
                                strokeWidth: 4, // Width of the route line
                                color: Colors.green // Color of the route line
                                ),
                            Polyline(
                                points: routePoints[3],
                                strokeWidth: 4, // Width of the route line
                                color: Colors.purple // Color of the route line
                                ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
            );
          }
        },
      ),
    );
  }
}
