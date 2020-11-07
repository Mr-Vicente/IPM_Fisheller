import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fisheller_app/constants.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  /// ************************* Variables ***************************/
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  BitmapDescriptor markerIcon;
  LocationData currentLocation;
  Location location = new Location();


  /// ************************* Aux methods ***************************/
  void _setMarkerIcons()  {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icons/map_marker.png').then((onValue) {
      markerIcon = onValue;
    });
  }

  CameraPosition _initialCameraPosition(){
    var target;
    if (currentLocation != null) {
      target = LatLng(currentLocation.latitude, currentLocation.longitude);
    }else {
      target = LISBON_LOCATION;
    }
    return CameraPosition( zoom: CAMERA_ZOOM, target: target);
  }

  void _onMapCreated(GoogleMapController controller) async{
    try {
      currentLocation = await location.getLocation();
      if(currentLocation != null)
        setState(() {
          var currentLat = currentLocation.latitude;
          var currentLong = currentLocation.longitude;
          var pinPosition =  LatLng(currentLat, currentLong);
          controller.moveCamera(CameraUpdate.newLatLng(pinPosition));
        });
    } catch (e) {
      currentLocation = null;
    }
  }

  void _addMarkers() {
    _markers.add(Marker(
        markerId: MarkerId('fixeFixePin'),
        position: FIXE_FIXE_LOCATION,
        icon: markerIcon
    ));

    _markers.add(Marker(
        markerId: MarkerId('docaPortPin'),
        position: DOCA_PORT_LOCATION,
        icon: markerIcon
    ));
  }

  /// ************************* 'Main' methods ***************************/
  @override
  void initState() {
    super.initState();
    _setMarkerIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
              myLocationEnabled: true,
              compassEnabled: true,
              tiltGesturesEnabled: false,
              markers: _markers,
              mapType: MapType.normal,
              initialCameraPosition: _initialCameraPosition(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                setState(() {
                  _addMarkers();
                });
                _onMapCreated(controller);
              })
        ],
      ),
    );
  }
}