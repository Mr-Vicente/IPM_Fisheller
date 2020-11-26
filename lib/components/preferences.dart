import 'dart:convert';

import 'package:fisheller_app/models/consumer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  MySharedPreferences._privateConstructor();



  static final MySharedPreferences instance =
  MySharedPreferences._privateConstructor();
  setBooleanValue(String key, bool value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool(key, value);
  }

  Future<bool> getBooleanValue(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(key) ?? false;
  }
  Future<String> getCurrentUser(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getString(key);
  }

  setCurrentUser(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  setConsumer(String key, Consumer value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, json.encode(value));
  }

  getConsumer(String key) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    return json.decode(myPrefs.getString(key));
  }
}