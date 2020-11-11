import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:flutter/material.dart';

class Seafood{
  Seafood_Type type;
  List<Tag> tags;
  int price;
  int quantityUnits;
  double quantityMass;
  List<String> media;

  Seafood({
    this.type,
    this.tags,
    this.price,
    this.quantityUnits,
    this.quantityMass,
    this.media
  });
}