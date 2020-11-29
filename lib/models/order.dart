
import 'package:fisheller_app/constants.dart';
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
  double deposit;

  double quantity;
  bool isUnits;

  Order({
    this.vendor,
    this.sell,
    this.consumer,
    this.quantity = 0.0,
    this.isUnits = false,
    this.deposit = 0.0,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  double getWeight(){
    if(isUnits)
      return sell.seafood.quantityMass * quantity;
    else
      return quantity;
  }

  //TODO
  double getTotalPrice(){
    return avrgPrice();
  }

  String isUnitsText(){
    return isUnits ? "units" : "kg";
  }

  double avrgPrice(){
    if(isUnits)
      return avrgUnitPrice();
    return avrgMassPrice();
  }

  double avrgUnitPrice(){
    return quantity*
       sell.seafood.price*
        seafoodTips[sell.seafood.type].avrgWeight/1000;
  }

  double avrgMassPrice(){
    return quantity * sell.seafood.price;
  }

}