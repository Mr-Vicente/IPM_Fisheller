
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';

class Order {
  Vendor vendor;
  Sell sell;
  Consumer consumer;
  int deposit;

  double quantity;
  bool isUnits;

  Order({
    this.vendor,
    this.sell,
    this.consumer,
    this.quantity,
    this.isUnits,
    this.deposit = 0,
  });

  Order.fromJson(Map<String, dynamic> json){
    vendor = json['vendor'];
    sell = json['sell'];
    consumer = json['consumer'];
    quantity = json['quantity'];
    isUnits = json['isUnits'];
    deposit = json['deposit'];
  }

  Map<String, dynamic> toJson() => {
    'vendor': vendor,
    'sell': sell,
    'consumer': consumer,
    'quantity': quantity,
    'isUnits': isUnits,
    'deposit': deposit,
  };

  //TODO
  double getWeight(){
    return 0.0;
  }

  //TODO
  double getTotalPrice(){
    return 0.0;
  }

}