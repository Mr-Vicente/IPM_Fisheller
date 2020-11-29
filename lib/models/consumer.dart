import 'dart:convert';

import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'consumer.g.dart';

@JsonSerializable(explicitToJson: true)
class Consumer extends User{
  List<Order> bookings;
  List<Order> purchases;
  List<User> following;
  Consumer({
    this.bookings,
    this.purchases,
    this.following,
    String name,
    String email,
    String password,
  }) :super(name:name,email:email,password:password);

  factory Consumer.fromJson(Map<String, dynamic> json) => _$ConsumerFromJson(json);
  Map<String, dynamic> toJson() => _$ConsumerToJson(this);

}