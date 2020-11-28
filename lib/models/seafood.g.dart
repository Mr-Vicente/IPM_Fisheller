// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seafood.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seafood _$SeafoodFromJson(Map<String, dynamic> json) {
  return Seafood(
    type: _$enumDecodeNullable(_$Seafood_TypeEnumMap, json['type']),
    tags: (json['tags'] as List)
        ?.map((e) => _$enumDecodeNullable(_$TagEnumMap, e))
        ?.toList(),
    price: json['price'] as double,
    quantityUnits: json['quantityUnits'] as int,
    quantityMass: (json['quantityMass'] as num)?.toDouble(),
    media: (json['media'] as List)?.map((e) => e as String)?.toList(),
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$SeafoodToJson(Seafood instance) => <String, dynamic>{
      'type': _$Seafood_TypeEnumMap[instance.type],
      'tags': instance.tags?.map((e) => _$TagEnumMap[e])?.toList(),
      'price': instance.price,
      'quantityUnits': instance.quantityUnits,
      'quantityMass': instance.quantityMass,
      'media': instance.media,
      'description': instance.description,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$Seafood_TypeEnumMap = {
  Seafood_Type.sea_bass: 'sea_bass',
  Seafood_Type.lobster: 'lobster',
  Seafood_Type.tuna: 'tuna',
  Seafood_Type.cod_fish: 'cod_fish',
};

const _$TagEnumMap = {
  Tag.fish: 'fish',
  Tag.aquaculture: 'aquaculture',
  Tag.shellfish: 'shellfish',
  Tag.sea: 'sea',
  Tag.imported: 'imported',
};
