import 'dart:convert';

import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market.g.dart';

@JsonSerializable(explicitToJson: true)
class Market{
  @JsonKey(fromJson: LatLng.fromJson, toJson: jsonEncode)
  LatLng mapLocation;
  String name;
  String imageName;
  List<Sell> items;

  Market({
    this.mapLocation,
    this.name,
    this.imageName,
    this.items,
  });

  factory Market.fromJson(Map<String, dynamic> json) => _$MarketFromJson(json);
  Map<String, dynamic> toJson() => _$MarketToJson(this);
  /*
  Market.fromJson(Map<String, dynamic> json){
    name = json['name'];
    mapLocation = LatLng.fromJson(json['mapLocation']);
    imageName = json['imageName'];
    items  = List<Sell>.from(json["items"].map((x) => Sell.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'mapLocation': mapLocation.toJson(),
    'imageName': imageName,
    'items': List<dynamic>.from(items.map((x) => x.toJson())),
  };
  */
}