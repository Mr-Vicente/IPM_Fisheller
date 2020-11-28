// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Market _$MarketFromJson(Map<String, dynamic> json) {
  return Market(
    mapLocation: LatLng.fromJson(json['mapLocation']),
    name: json['name'] as String,
    imageName: json['imageName'] as String,
    items: (json['items'] as List)
        ?.map(
            (e) => e == null ? null : Sell.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MarketToJson(Market instance) => <String, dynamic>{
      'mapLocation': jsonEncode(instance.mapLocation),
      'name': instance.name,
      'imageName': instance.imageName,
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };
