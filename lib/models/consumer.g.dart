// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Consumer _$ConsumerFromJson(Map<String, dynamic> json) {
  return Consumer(
    bookings: (json['bookings'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    purchases: (json['purchases'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    following: (json['following'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] as String,
    email: json['email'] as String,
    password: json['password'] as String,
  )..imageName = json['imageName'] as String;
}

Map<String, dynamic> _$ConsumerToJson(Consumer instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'imageName': instance.imageName,
      'bookings': instance.bookings?.map((e) => e?.toJson())?.toList(),
      'purchases': instance.purchases?.map((e) => e?.toJson())?.toList(),
      'following': instance.following?.map((e) => e?.toJson())?.toList(),
    };
