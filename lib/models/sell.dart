import 'package:fisheller_app/models/market.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';

class Sell{
  Seafood seafood;
  Vendor vendor;
  Market _market;

  Sell({
    this.seafood,
    this.vendor,
  });

  void setMarket(Market m){
    this.market = m;
  }

  Market get market => _market;

  set market(Market m) {
    _market = m;
  }
}