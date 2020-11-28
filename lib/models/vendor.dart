import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vendor.g.dart';

@JsonSerializable(explicitToJson: true)
class Vendor extends User{
  List<Order> orders;
  List<Order> history;
  List<int> stars;
  List<User> followers;
  String profile;

  Vendor(String name, String email, String password, String profile){
    this.name = name;
    this.email = email;
    this.password = password;
    this.orders = [];
    this.history = [];
    this.stars = [5];
    this.followers = [];
    this.profile = profile;
  }

  int getRating(){
    int sum = 0;
    stars.forEach((review) { sum += review;});
    return sum ~/ stars.length;
  }

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);
  Map<String, dynamic> toJson() => _$VendorToJson(this);

  /*Vendor.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
    profile = json['profile'];
    stars = List<int>.from(json["stars"].map((x) => x));
    orders  = List<Order>.from(json["orders"].map((x) => Order.fromJson(x)));
    history = List<Order>.from(json["history"].map((x) => Order.fromJson(x)));
    followers = List<User>.from(json["followers"].map((x) => User.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'profile': profile,
    'orders': List<dynamic>.from(orders.map((x) => x.toJson())),
    'history': List<dynamic>.from(history.map((x) => x.toJson())),
    'followers': List<dynamic>.from(followers.map((x) => x.toJson())),
    'stars': List<dynamic>.from(stars.map((x) => x)),
  };*/

}