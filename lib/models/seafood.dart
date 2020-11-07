import 'package:fisheller_app/models/seafood_type.dart';
import 'package:flutter/material.dart';

class Seafood{
  Seafood_Type name;
  List<String> tags;
  int price;
  int quantityUnits;
  double quantitymass;
  List<Image> media;

  Seafood({
    this.name,
    this.tags,
    this.price,
    this.quantityUnits,
    this.quantitymass,
    this.media
  });
}