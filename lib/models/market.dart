import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';

class Market{
  String address;
  String name;
  Image image;
  List<Sell> items;

  Market({
    this.address,
    this.name,
    this.image,
    this.items,
  });
}