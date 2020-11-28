
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
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
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
/*
  Order.fromJson(Map<String, dynamic> json){
    vendor = Vendor.fromJson(json['vendor']);
    sell = Sell.fromJson(json['sell']);
    consumer = Consumer.fromJson(json['consumer']);
    quantity = json['quantity'];
    isUnits = json['isUnits'];
    deposit = json['deposit'];
  }

  Map<String, dynamic> toJson() => {
    'vendor': vendor.toJson(),
    'sell': sell.toJson(),
    'consumer': consumer.toJson(),
    'quantity': quantity,
    'isUnits': isUnits,
    'deposit': deposit,
  };
*/


  //TODO
  double getWeight(){
    return 0.0;
  }

  //TODO
  double getTotalPrice(){
    return 0.0;
  }

}