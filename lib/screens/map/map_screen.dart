import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  MapPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  var location = new Location();
  var _center = const LatLng(38.736946, -9.142685);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

    _getLocation().then((value) {
      setState(() {
        if (value != null) {
          _center = LatLng(value.latitude, value.longitude);
          mapController.moveCamera(CameraUpdate.newLatLng(_center));
        }
        else {

        }
      });
    });
  }

  Future<LocationData> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(38.736946, -9.142685),
            zoom: 11.0,
          ),
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
        ),
      ),
    );
  }
}
