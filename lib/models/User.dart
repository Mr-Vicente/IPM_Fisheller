import 'package:flutter/material.dart';

class User{
  String email;
  String password;
  String name;
  String imageName;
  User({
    this.email,
    this.password,
    this.name,
    this.imageName,
  });

  T cast<T>(x) => x is T ? x : null;

}