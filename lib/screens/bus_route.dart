import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BusRouteMap extends StatefulWidget {
  @override
  _BusRouteMapState createState() => _BusRouteMapState();
}

class _BusRouteMapState extends State<BusRouteMap> {
  late GoogleMapController mapController;

  // Define the bus stops (Start and End)
  static const LatLng _p1 = LatLng(34.0522, -118.2437); // Los Angeles
  static const LatLng _p2 = LatLng(34.0407, -118.2685); // Nearby Point

  // Store the route lines
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _createRoute();
  }

  void _createRoute() {
    _polylines.add(
      Polyline(
        polylineId: PolylineId("bus_route_1"),
        points: [_p1, _p2], // Add all coordinates for the route here
        color: Colors.blue,
        width: 5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _p1, zoom: 14),
        polylines: _polylines,
        onMapCreated: (controller) => mapController = controller,
        markers: {
          Marker(markerId: MarkerId("source"), position: _p1, infoWindow: InfoWindow(title: "Bus Stop A")),
          Marker(markerId: MarkerId("dest"), position: _p2, infoWindow: InfoWindow(title: "Bus Stop B")),
        },
      ),
    );
  }
}