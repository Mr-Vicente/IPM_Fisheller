import 'package:fisheller_app/components/add_catch_card.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/models/market.dart';
import 'package:fisheller_app/screens/fish_description/stage1_description.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/filter_model.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/seafood_type.dart';

class Map extends StatefulWidget {
  MapState state;

  @override
  State<StatefulWidget> createState() => (state = MapState());

  MapState getState(){
    return state;
  }

}

class MapState extends State<Map> {

  /// ************************* Variables ***************************/
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = Set<Marker>();
  BitmapDescriptor markerIcon_fixe;
  BitmapDescriptor markerIcon_doca;
  LocationData currentLocation;
  Location location = new Location();


  /// ************************* Aux methods *************************/
  void _setMarkerIcons()  {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icons/fixe_fixe_marker.png').then((onValue) {
      markerIcon_fixe = onValue;
    });
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        'assets/icons/doca_marker.png').then((onValue) {
      markerIcon_doca = onValue;
    });
  }

  CameraPosition _initialCameraPosition(){
    var target;
    if (currentLocation != null) {
      target = LatLng(currentLocation.latitude, currentLocation.longitude);
    }else {
      target = PORTIMAO_LOCATION;
    }
    return CameraPosition( zoom: CAMERA_ZOOM, target: PORTIMAO_LOCATION);
  }

  void _onMapCreated(GoogleMapController controller) async{
    try {
      currentLocation = await location.getLocation();
      if(currentLocation != null)
        setState(() {
          var currentLat = currentLocation.latitude;
          var currentLong = currentLocation.longitude;
          var pinPosition =  LatLng(currentLat, currentLong);
          //controller.moveCamera(CameraUpdate.newLatLng(pinPosition));
        });
    } catch (e) {
      currentLocation = null;
    }
  }

  void _addMarkers() {

    Market m1 = markets[0];
    _markers.add(
        Marker(
          markerId: MarkerId(m1.name+"pin"),
          position: m1.mapLocation,
          icon: markerIcon_fixe,
          onTap: (){
            print(m1.name);
            editModalBottomSheet(context,m1);
          },
        )
    );
    Market m2 = markets[1];
    _markers.add(
        Marker(
          markerId: MarkerId(m2.name+"pin"),
          position: m2.mapLocation,
          icon: markerIcon_doca,
          onTap: (){
            print(m2.name);
            editModalBottomSheet(context,m2);
          },
        )
    );
  }

  void editModalBottomSheet(BuildContext context, Market m) {
    double d = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    showModalBottomSheet(backgroundColor: Colors.transparent,context: context,isScrollControlled: true, builder: (BuildContext bc) {
      return Container(
          decoration: new BoxDecoration(
              color: WHITE_COLOUR,
              borderRadius: new BorderRadius.only(
                  topLeft:  const  Radius.circular(40.0),
                  topRight: const  Radius.circular(40.0))
          ),
          height: d * .85,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                width: w,
                  child:Container(child:
                  Center(
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: WHITE_COLOUR,
                        borderRadius: BorderRadius.circular(29),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 4,
                            blurRadius: 29,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Center(
                        child:Text(
                          m.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topRight:  Radius.circular(29),topLeft: Radius.circular(29)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.asset("assets/images/fish_market.png").image,
                      ),
                    ),
                  ),
                ),
              Expanded(child:SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for ( var sell in m.items)
                        Selling_Card(
                          type: "normal",
                          sell: sell,
                          press: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Stage1Description(sell,"map")
                                )
                              );
                            },
                        ),
                    ]
                ),
              ),
              ),
            ],
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

  void clearFilter(){
    setState((){
      _markers = Set<Marker>();
      _addMarkers();
    });
  }

  void filterMarkers(FilterModel fm){
    Set<Marker> aux = Set<Marker>();
    print( ' *************************' +
        '\nCategory: '+ fm.category +
        '\nSeafood: ' + fm.seafood +
        '\nPrice min: ' + fm.minPrice.toString() +
        '\nPrice max: ' + fm.maxPrice.toString() +
        '\nQuantity min: ' + fm.minQuantity.toString()+
        '\nQuantity max: ' + fm.maxQuantity.toString()
    );
    markets.forEach((m) {
      print( ' *************************\n' +
          m.name);
        for(Sell i in  m.items) {
          bool addMarket = true;
          Seafood s = i.seafood;
          print(' ------------' +
              '\nTags: ' + s.tags.length.toString() + ' ' +
              s.tags.contains(fm.category).toString() +
              '\nSeafood: ' + s.type.name +
              '\nPrice: ' + s.price.toString() +
              '\nQuantity: ' + s.quantityMass.toString()

          );

          List<String> tags = s.tagsToString();
          if (fm.category != '' && tags.isNotEmpty &&
              !tags.contains(fm.category.toLowerCase().trim())){
            addMarket = false;
            print('1');
          }


          if (fm.seafood != '' && s.type != null &&
              s.type.name.toLowerCase().trim() != fm.seafood.toLowerCase().trim())
          {
            addMarket = false;
            print('2');
          }

          if (s.price < fm.minPrice || s.price > fm.maxPrice)
          {
            addMarket = false;
            print('3');
          }

          if (s.quantityMass < fm.minQuantity &&
              s.quantityMass > fm.maxQuantity)
          {
            addMarket = false;
            print('4');
          }


          print(addMarket.toString());

          if (addMarket) {
            BitmapDescriptor marker = m.name == "Doca Portimão" ? markerIcon_doca : markerIcon_fixe;
            aux.add(Marker(
              markerId: MarkerId(m.name + "pin"),
              position: m.mapLocation,
              icon: marker,
              onTap: () {
                editModalBottomSheet(context,m);
              },
            ));
            break;
          }
        }
    });

    setState((){
      _markers = aux;
    });

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
