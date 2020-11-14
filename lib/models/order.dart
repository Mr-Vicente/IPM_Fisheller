
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';

class Order {
  Vendor vendor;
  Sell sell;
  Consumer consumer;

  double quantity;
  bool isUnits;

  Order({
    this.vendor,
    this.sell,
    this.consumer,
  });
}