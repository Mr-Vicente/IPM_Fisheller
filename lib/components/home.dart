import 'package:fisheller_app/components/home_components/add_PopUp.dart';
import 'package:fisheller_app/screens/cart/body.dart';
import 'package:fisheller_app/screens/feed/components/body.dart';
import 'package:fisheller_app/screens/feed/components/search_bar.dart';
import 'package:flutter/material.dart';

import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/map/map_screen.dart';
import 'package:fisheller_app/components/navigation_bar.dart';
import 'package:fisheller_app/components/home_components/amaz_drawer.dart';

class Home extends StatefulWidget {
  final int index;
  Home({
    this.index = 0,
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeState(currentIndex: index);
  }
}

class _HomeState extends State<Home> {
  int currentIndex;
  final List<Widget> _children = [MapPage(), Feed(), Cart()];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  _HomeState({
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      body: Stack(children: <Widget>[
        _children[currentIndex],
        Positioned(
            top: 25,
            right: 10,
            child: SafeArea(
                child: FloatingActionButton(
                  onPressed: () => scaffoldKey.currentState.openEndDrawer(),
                  child: Image.asset('assets/icons/extra_menu.png', height: 20),
                  backgroundColor: Colors.white,
            ))),
        if (currentIndex == 1)
          Positioned(
              top: 25,
              left: 10,
              child: SafeArea(
                  child: FloatingActionButton(
                    onPressed: () => SearchBarFeed(),
                    child: Icon(
                      IconData(59828, fontFamily: 'MaterialIcons'),
                      color: Colors.black87,
                      size: 35,
                ),
                backgroundColor: Colors.white,
              ))),
      ]),
      drawerScrimColor: Colors.grey.withOpacity(0.54),
      endDrawer: AmazDrawer(
          topPosition: size.width*0.35,
          width: size.width*0.74,
          height: size.height*0.1,
          elevation: 5,
          color: PRIMARY_COLOUR,
          //backgroundColor: WHITE_COLOUR,
          items: [
            AmazDrawerItem(
                iconData: Icons.face, iconSize: size.width*0.1, text: "Profile", textSize: size.width*0.08),
            AmazDrawerItem(
                iconData: Icons.settings, iconSize: size.width*0.1, text: "Settings", textSize: size.width*0.08),
            AmazDrawerItem(iconData: Icons.help, iconSize: size.width*0.1, text: "Help", textSize: size.width*0.08), 
          ]),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(0.0, 70.0),
              spreadRadius: 5,
              color: Colors.black,
              blurRadius: 200,
            ),
          ],
        ),
        child: FABBottomAppBar(
          color: Colors.grey,
          height: size.height*0.08,
          iconSize: size.height*0.04,
          backgroundColor: Colors.white, //Color(0xFFFFFFF0)
          selectedColor: PRIMARY_COLOUR,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _onTabTapped,
          items: [
            FABBottomAppBarItem(iconData: Icons.location_pin, text: 'Map'),
            FABBottomAppBarItem(
                imageName: "assets/icons/feed_green_icon.png", text: 'Feed'),
            FABBottomAppBarItem(iconData: Icons.shopping_cart, text: 'Orders'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Container(
        height: size.height*0.09,
        width: size.height*0.09,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              spreadRadius: 1,
              color: Colors.grey[600],
              blurRadius: 5,
            )
          ],
        ),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: add,
            tooltip: 'Increment',
            child: Icon(
              Icons.add,
              size: 50,
            ),
            elevation: 3.0,
            backgroundColor: PRIMARY_COLOUR,
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<dynamic> add() {
    return showDialog(
        barrierColor: Colors.white.withOpacity(0),
        context: context,
        builder: (BuildContext context) {
          return add_PopUp();
        });
  }
}

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FeedBody(),
    );
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CartBody(),
    );
  }
}
