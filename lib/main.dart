import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:fisheller_app/screens/auth/login/login_screen.dart';
import 'package:fisheller_app/screens/auth/welcome/welcome_screen.dart';
import 'package:fisheller_app/screens/book_fish/book_screen.dart';
import 'package:fisheller_app/screens/catch/catch.dart';
import 'package:fisheller_app/screens/market/temp.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/screens/map/map_screen.dart';
import 'package:fisheller_app/components/home.dart';
import 'package:fisheller_app/screens/fish_and_tips/fishNTips_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'components/preferences.dart';

void main() => runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        fontFamily:'Raleway',
        primaryColor: PRIMARY_COLOUR,
        scaffoldBackgroundColor: PRIMARY_COLOUR,
      ),
      home: MyApp(),
    )
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return Stack(children: [
      new SplashScreen(
        seconds: 4,
        navigateAfterSeconds: new AfterSplash(),
        image: new Image.asset(
          "assets/images/fisheller_logo.png",
          width: 200,
        ),
        backgroundColor: SECONDARY_COLOUR,
        photoSize: 100.0,
        onClick: () {},
        loaderColor: PRIMARY_COLOUR,

      ),
    ],
    );
  }

}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    julioBass.marketName = fixeFixe_market.name;
    julioLobster.marketName = fixeFixe_market.name;
    julioCod.marketName = fixeFixe_market.name;

    josefinaBass.marketName = docaPortimao_market.name;
    josefinaLobster.marketName = docaPortimao_market.name;
    josefinaCod.marketName = docaPortimao_market.name;

    MySharedPreferences.instance
        .getBooleanValue("isfirstRun")
        .then((value) {
      print(value);
      //if (value == false)
      initialiseUsers();
    });
    //seabass2.media = seabassMedia;

    return LoginScreen();
    //home: MapPage(),

    //home: Temp(),
    //home: Home()
    //home:FishAndTips(codTips),
    //home:FishAndTips(lobsterTips),
    //home: BookFish(seabass2, 'Doca Portimão')
    //home: CatchMedia()
  }
}

void initialiseUsers(){
  MySharedPreferences.instance.setConsumer("ana@gmail.com",ana);
  MySharedPreferences.instance.setConsumer("hakeem@gmail.com",hakeem);

  MySharedPreferences.instance
      .setBooleanValue("isfirstRun", true);
  print("Users Initialized");
}
