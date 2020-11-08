import 'package:flutter/material.dart';

import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/map/map_screen.dart';
import 'package:fisheller_app/components/navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  //TODO add Feed and Cart pages here
  final List<Widget> _children = [MapPage(), SecondRoute()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _children[_currentIndex],
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
            FABBottomAppBarItem(iconData: Icons.search, text: 'Feed'),
            FABBottomAppBarItem(iconData: Icons.shopping_cart, text: 'Cart'),
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

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
