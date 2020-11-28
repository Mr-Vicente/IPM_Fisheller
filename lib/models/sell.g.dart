// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sell _$SellFromJson(Map<String, dynamic> json) {
  return Sell(
    seafood: json['seafood'] == null
        ? null
        : Seafood.fromJson(json['seafood'] as Map<String, dynamic>),
    vendor: json['vendor'] == null
        ? null
        : Vendor.fromJson(json['vendor'] as Map<String, dynamic>),
  )..marketName = json['marketName'] as String;
}

Map<String, dynamic> _$SellToJson(Sell instance) => <String, dynamic>{
      'seafood': instance.seafood?.toJson(),
      'vendor': instance.vendor?.toJson(),
      'marketName': instance.marketName,
    };
