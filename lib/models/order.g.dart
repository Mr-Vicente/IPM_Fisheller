// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    vendor: json['vendor'] == null
        ? null
        : Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
    sell: json['sell'] == null
        ? null
        : Sell.fromJson(json['sell'] as Map<String, dynamic>),
    consumer: json['consumer'] == null
        ? null
        : Consumer.fromJson(json['consumer'] as Map<String, dynamic>),
    quantity: (json['quantity'] as num)?.toDouble(),
    isUnits: json['isUnits'] as bool,
    deposit: (json['deposit'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'vendor': instance.vendor?.toJson(),
      'sell': instance.sell?.toJson(),
      'consumer': instance.consumer?.toJson(),
      'deposit': instance.deposit,
      'quantity': instance.quantity,
      'isUnits': instance.isUnits,
    };
