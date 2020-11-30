import 'package:fisheller_app/components/home_components/add_PopUp.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/screens/cart/background.dart';
import 'package:fisheller_app/components/navigation_bar_client.dart';
import 'package:fisheller_app/screens/cart/body.dart';
import 'package:fisheller_app/screens/feed/components/background.dart';
import 'package:fisheller_app/screens/feed/components/body.dart';
import 'package:fisheller_app/screens/feed/components/search_bar.dart';
import 'package:fisheller_app/screens/orders/body.dart';
import 'package:flutter/material.dart';

import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/map/map_screen.dart';
import 'package:fisheller_app/components/navigation_bar.dart';
import 'package:fisheller_app/components/home_components/amaz_drawer.dart';

class Home extends StatefulWidget {
  final int index;
  List<bool> isSelected;
  Home({
    this.index,
    this.isSelected
  });

  @override
  State<StatefulWidget> createState() {
    return _HomeState(currentIndex: index, isSelected: isSelected);
  }
}

class _HomeState extends State<Home> {
  int currentIndex;
  List<Widget> _children;
  List<Widget> _childrenVendor;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Future userType = isConsumer();
  List<bool> isSelected;

  _HomeState({
    this.currentIndex,
    this.isSelected
  });

  @override void initState() {
    super.initState();
    _children = [MapPage(), Feed(isSelected), Cart()];
    _childrenVendor = [MapPage(), Feed(isSelected), Orders()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      body: Stack(children: <Widget>[
        chooseChildren(),
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
                      Icons.search,
                      color: Colors.black87,
                      size: 35,
                    ),
                    backgroundColor: Colors.white,
                  ))),
      ]),
      drawerScrimColor: Colors.grey.withOpacity(0.54),
      endDrawer: AmazDrawer(
          topPosition: 150,
          width: 300,
          height: 80,
          elevation: 5,
          color: PRIMARY_COLOUR,
          //backgroundColor: WHITE_COLOUR,
          items: [
            AmazDrawerItem(
                iconData: Icons.face, iconSize: 50.0, text: "Profile"),
            AmazDrawerItem(
                iconData: Icons.settings, iconSize: 50.0, text: "Settings"),
            AmazDrawerItem(iconData: Icons.help, iconSize: 50.0, text: "Help"),
            AmazDrawerItem(
                iconData: Icons.logout, iconSize: 50.0, text: "Logout")
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
          child:
          decideNavigation(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: plusButton(),

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

  Widget vendorNavigationBar() {
    return FABBottomAppBar(

      color: Colors.grey,
      backgroundColor: Colors.white,
      //Color(0xFFFFFFF0)
      selectedColor: PRIMARY_COLOUR,
      notchedShape: CircularNotchedRectangle(),
      onTabSelected: _onTabTapped,
      selectedIndex: currentIndex,
      items: [
        FABBottomAppBarItem(iconData: Icons.location_pin, text: 'Map'),
        FABBottomAppBarItem(
            imageName: "assets/icons/feed_green_icon.png", text: 'Feed'),
        FABBottomAppBarItem(iconData: Icons.shopping_cart, text: 'Orders'),
      ],
    );
  }


  Widget clientNavigationBar() {
    return BottomAppBarClient(
      color: Colors.grey,
      backgroundColor: Colors.white,
      //Color(0xFFFFFFF0)
      selectedColor: PRIMARY_COLOUR,
      selectedIndex: currentIndex,
      onTabSelected: _onTabTapped,
      items: [
        BottomAppBarItemClient(iconData: Icons.location_pin, text: 'Map'),
        BottomAppBarItemClient(
            imageName: "assets/icons/feed_green_icon.png", text: 'Feed'),
        BottomAppBarItemClient(iconData: Icons.shopping_cart, text: 'Cart'),
      ],
    );
  }

  Widget decideNavigation() {
    return FutureBuilder(future: userType,
    builder: (context,snapshot) {
      print(snapshot.hasData);
        if (snapshot.hasData) {
          bool consumer = snapshot.data;
          if (consumer) {
            return clientNavigationBar();
          }
          else {
            return vendorNavigationBar();
          }
      }
        return SizedBox.shrink();
    }
,
    );
  }

  Widget plusButton() {
      return FutureBuilder(future: isConsumer(),
          builder: (context,snapshot)
      {
        if (snapshot.hasData) {
          bool consumer = snapshot.data;
          if (!consumer) {
            return Container(
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
            );
          }
          return SizedBox.shrink();
        }
        return SizedBox.shrink();
      }
      );
  }

  Widget chooseChildren() {
    return FutureBuilder(future: userType,
      builder: (context,snapshot) {
        print(snapshot.hasData);
        if (snapshot.hasData) {
          bool consumer = snapshot.data;
          if (consumer) {
            return _children[currentIndex];
          }
          else {
            return _childrenVendor[currentIndex];
          }
        }
        return SizedBox.shrink();
      }
      ,
    );
  }

}


class Feed extends StatelessWidget {
  List<bool> isSelected;
  Feed(this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FeedBackground(isSelected),
    );
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CartBackground(),
    );
  }
}

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: OrdersBody(),
    );
  }
}



