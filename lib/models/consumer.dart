import 'dart:convert';

import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:flutter/material.dart';

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

  Consumer.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
    imageName = json['imageName'];
    print("Booking casting:");
    print(cast<List<Order>>(json['bookings']));
    bookings = cast<List<Order>>(json['bookings']);
    purchases = cast<List<Order>>(json['purchases']);
    following = cast<List<User>>(json['following']);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'imageName': imageName,
    'bookings': bookings,
    'purchases': purchases,
    'following': following,
  };

}