// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return Vendor(
    json['name'] as String,
    json['email'] as String,
    json['password'] as String,
    json['profile'] as String,
  )
    ..imageName = json['imageName'] as String
    ..orders = (json['orders'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..history = (json['history'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..stars = (json['stars'] as List)?.map((e) => e as int)?.toList()
    ..followers = (json['followers'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'imageName': instance.imageName,
      'orders': instance.orders?.map((e) => e?.toJson())?.toList(),
      'history': instance.history?.map((e) => e?.toJson())?.toList(),
      'stars': instance.stars,
      'followers': instance.followers?.map((e) => e?.toJson())?.toList(),
      'profile': instance.profile,
    };
