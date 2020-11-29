import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}