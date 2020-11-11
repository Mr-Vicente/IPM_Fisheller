import 'package:fisheller_app/screens/market/market_information.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fisheller_app/constants.dart';

class Map extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapState();
}

class MapState extends State<Map> {

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

    markets.forEach((m) {
      _markers.add(
        Marker(
          markerId: MarkerId(m.name+"pin"),
          position: m.mapLocation,
          icon: markerIcon,
          onTap: (){
            print("MEOW *********************" + m.name);
            MarketUI_Screen();
          },
        )
      );
    });
  }

void _currentLocation() async {
   final GoogleMapController controller = await _controller.future;
   LocationData currentLocation;
   var location = new Location();
   try {
     currentLocation = await location.getLocation();
     } on Exception {
       currentLocation = null;
       }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
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
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            tiltGesturesEnabled: false,
            myLocationButtonEnabled: false,
            markers: _markers,
            mapType: MapType.normal,
            initialCameraPosition: _initialCameraPosition(),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                _addMarkers();
              });
              _onMapCreated(controller);
              }            
            ),
          Positioned(
            bottom: 70,
            right: 10,
            child: FloatingActionButton(
              onPressed: _currentLocation,
              mini: true,
              child: Icon(Icons.location_searching,color: Colors.black),
              backgroundColor: Colors.white,
              )
              )
          
          
        ],
      ),
    );
  }
}
