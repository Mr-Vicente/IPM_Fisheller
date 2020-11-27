import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:flutter/material.dart';

class Vendor extends User{
  List<Order> orders;
  List<Order> history;
  List<int> stars;
  List<User> followers;
  String profile;

  Vendor(String name, String email, String password, String profileImage){
    this.name = name;
    this.email = email;
    this.password = password;
    this.orders = [];
    this.history = [];
    this.stars = [5];
    this.followers = [];
    this.profile = profileImage;
  }

  int getRating(){
    int sum = 0;
    stars.forEach((review) { sum += review;});
    return sum ~/ stars.length;
  }

}