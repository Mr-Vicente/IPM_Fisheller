import 'package:fisheller_app/models/market.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sell.g.dart';

@JsonSerializable(explicitToJson: true)
class Sell{
  Seafood seafood;
  Vendor vendor;
  String marketName;

  Sell({
    this.seafood,
    this.vendor,
  });

  factory Sell.fromJson(Map<String, dynamic> json) => _$SellFromJson(json);
  Map<String, dynamic> toJson() => _$SellToJson(this);

}