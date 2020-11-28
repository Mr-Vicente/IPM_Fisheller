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

  /*Consumer.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
    imageName = json['imageName'];
    bookings  = List<Order>.from(json["bookings"].map((x) => Order.fromJson(x)));
    //purchases = List<Order>.from(json["purchases"].map((x) => Order.fromJson(x)));
    //following = List<User>.from(json["following"].map((x) => User.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'imageName': imageName,
    'bookings': List<dynamic>.from(bookings.map((x) => x.toJson())),
    //'purchases': List<dynamic>.from(purchases.map((x) => x.toJson())),
    //'following': List<dynamic>.from(following.map((x) => x.toJson())),
  };*/


}