import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/screens/catch/catch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'home.dart';
import 'home_components/amaz_drawer.dart';

class Back extends StatelessWidget{
  Widget body;
  Widget bottom;
  Text current;
  List<Seafood> seafoods;
  List<String> seafoodImages;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  Back({
    this.body,
    this.bottom,
    this.current,
    this.seafoods : null,
    this.seafoodImages : null,
  });



  Widget _getLeading(BuildContext context){
    if(current.data != "review"){
      return FlatButton.icon(
        icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
        label: new Text('back',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        onPressed: () {
          Navigator.pop(context);
          if(current.data == "feed"){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Home(index:1)
              ),
            );
          }
        },
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: size.height * 0.09,
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                child: FloatingActionButton(
                  onPressed: () => scaffoldKey.currentState.openEndDrawer(),
                  child: Image.asset('assets/icons/extra_menu.png', height: 20),
                  backgroundColor: Colors.white,
                )),
          ],
          leadingWidth: size.width,
          leading: _getLeading(context),
      ),
      drawerScrimColor: Colors.grey.withOpacity(0.54),
      endDrawer: AmazDrawer(
          topPosition: size.width * 0.35,
          width: size.width * 0.74,
          height: size.height * 0.1,
          elevation: 5,
          color: PRIMARY_COLOUR,
          items: [
            AmazDrawerItem(
                iconData: Icons.face,
                iconSize: size.width * 0.1,
                text: "Profile",
                textSize: size.width * 0.08),
            AmazDrawerItem(
                iconData: Icons.settings,
                iconSize: size.width * 0.1,
                text: "Settings",
                textSize: size.width * 0.08),
            AmazDrawerItem(
                iconData: Icons.help,
                iconSize: size.width * 0.1,
                text: "Help",
                textSize: size.width * 0.08),
            AmazDrawerItem(iconData: Icons.logout, iconSize: 50.0, text: "Logout")
          ]),
        body: new GestureDetector(
          onTap: () {FocusScope.of(context).requestFocus(new FocusNode());},
          child:body,
        ),
        bottomSheet: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: bottom,
        ),
    );
  }
  
}