import 'package:flutter/material.dart';

import 'package:fisheller_app/screens/map/components/map.dart';
import 'package:fisheller_app/screens/map/components/search_bar.dart';
import 'package:flutter/src/painting/borders.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

void _filter(){

}

void _menu(){

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {FocusScope.of(context).requestFocus(new FocusNode());},
        child: new Container(
            child: Stack(
                children: <Widget>[
                  Positioned.fill(child: Map()),
                  Positioned(
                      top: 15,
                      left: 15,
                      right: 90,
                      child: SearchBar()
                  ),   
                  Positioned(
                    top: 25,
                    right: 10,
                    child: SafeArea(
                      child: FloatingActionButton(
                        onPressed: _filter,
                        child: Image.asset('assets/icons/extra_menu.png', height: 20),
                        backgroundColor: Colors.white,
                        )
                    )
                  ),
                  Positioned(
                    top: 100,
                    left: 10,
                    child: SafeArea(
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        child: FloatingActionButton(
                            onPressed: _menu,
                            child: Image.asset('assets/icons/filter_icon.png', height: 50),
                            backgroundColor: Colors.white,
                          )
                        )
                        )
                  )
                ]
            )
        )
      )
    );
  }
}