import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Market{
  LatLng mapLocation;
  String name;
  Image image;
  List<Sell> items;

  Market({
    this.mapLocation,
    this.name,
    this.image,
    this.items,
  });
}