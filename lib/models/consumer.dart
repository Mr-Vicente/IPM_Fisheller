import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:flutter/material.dart';

class Consumer extends User{
  List<Order> bookings;
  List<Order> purchases;
  List<User> following;
  Consumer(String name, String email, String password){
    this.name = name;
    this.email = email;
    this.password = password;
    this.bookings = [];
    this.purchases = [];
    this.following = [];
  }
}