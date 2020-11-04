import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/screens/map/map_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primaryColor: PRIMARY_COLOUR,
        scaffoldBackgroundColor: PRIMARY_COLOUR,
      ),
      //home: LoginScreen(),
      home: MapPage(title: 'Fisheller'),
    );
  }
}
