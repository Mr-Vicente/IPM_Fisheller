import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/auth/login/login_screen.dart';
import 'package:fisheller_app/screens/auth/welcome/welcome_screen.dart';
import 'package:fisheller_app/screens/book_fish/book_screen.dart';
import 'package:fisheller_app/screens/market/temp.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/screens/map/map_screen.dart';
import 'package:fisheller_app/components/home.dart';
import 'package:fisheller_app/screens/fish_and_tips/fishNTips_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    julioBass.market = fixeFixe_market;
    julioLobster.market = fixeFixe_market;
    julioCod.market = fixeFixe_market;

    josefinaBass.market = docaPortimao_market;
    josefinaLobster.market = docaPortimao_market;
    josefinaCod.market = docaPortimao_market;
    seabass2.media = seabassMedia;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        fontFamily:'Raleway',
        primaryColor: PRIMARY_COLOUR,
        scaffoldBackgroundColor: PRIMARY_COLOUR,
      ),
      //home: LoginScreen(),
      //home: MapPage(),
      
      //home: Temp(),
      //home: Home()
      //home:FishAndTips(codTips),
      //home:FishAndTips(lobsterTips),
      home: BookFish(seabass2, 'Doca Portimão')

    );
  }
}

