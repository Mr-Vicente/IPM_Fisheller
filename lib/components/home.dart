import 'package:fisheller_app/screens/feed/components/body.dart';
import 'package:flutter/material.dart';

import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/map/map_screen.dart';
import 'package:fisheller_app/components/navigation_bar.dart';
import 'package:fisheller_app/components/home_components/amaz_drawer.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  //TODO add Feed and Cart pages here
  final List<Widget> _children = [MapPage(), Feed(),Feed()];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      body: Stack(children: <Widget>[
        _children[_currentIndex],
        Positioned(
            top: 25,
            right: 10,
            child: SafeArea(
                child: FloatingActionButton(
              onPressed: () => scaffoldKey.currentState.openEndDrawer(),
              child: Image.asset('assets/icons/extra_menu.png', height: 20),
              backgroundColor: Colors.white,
            ))),
        if(_currentIndex == 1)
          Positioned(
            top: 25,
            left: 10,
            child: SafeArea(
                child: FloatingActionButton(
                  onPressed: () => scaffoldKey.currentState.openEndDrawer(),
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
        topPosition:150,
        width: 300,
        height: 80,
        elevation: 5,
        color: PRIMARY_COLOUR,
        //backgroundColor: WHITE_COLOUR,
        items: [
        AmazDrawerItem(iconData: Icons.face, iconSize: 50.0, text: "Profile"),
        AmazDrawerItem(iconData: Icons.settings, iconSize: 50.0, text: "Settings"),
        AmazDrawerItem(iconData: Icons.help, iconSize: 50.0, text: "Help")
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
        height: 70.0,
        width: 70.0,
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
            onPressed: () {},
            tooltip: 'Increment',
            child: Icon(Icons.add),
            elevation: 3.0,
            backgroundColor: PRIMARY_COLOUR,
          ),
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
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
