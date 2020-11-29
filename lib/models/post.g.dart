// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['title'] as String,
    json['description'] as String,
    (json['imagesNames'] as List)?.map((e) => e as String)?.toList(),
    json['vendor'] as Vendor
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'imagesNames': instance.imagesNames,
      'vendor' : instance.vendor?.toJson(),
    };
