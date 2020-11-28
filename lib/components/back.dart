import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_components/amaz_drawer.dart';

class Back extends StatelessWidget{
  Widget body;
  Widget bottom;
  Back({
    this.body,
    this.bottom
  });
  var scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
      key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: size.height*0.09,
          actions: <Widget>[
            SafeArea(
                child: FloatingActionButton(
                  onPressed: () => scaffoldKey.currentState.openEndDrawer(),
                  child: Image.asset('assets/icons/extra_menu.png', height: 20),
                  backgroundColor: Colors.white,
                )),
            SizedBox(width: 10)
          ],
          leadingWidth: size.width,
          leading: FlatButton.icon(
            icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
            label: new Text('back',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      drawerScrimColor: Colors.grey.withOpacity(0.54),
      endDrawer: AmazDrawer(
          topPosition: size.width * 0.35,
          width: size.width * 0.74,
          height: size.height * 0.1,
          elevation: 5,
          color: PRIMARY_COLOUR,
          //backgroundColor: WHITE_COLOUR,
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
          ]),
        
        body:
        new GestureDetector(
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