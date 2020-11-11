import 'package:flutter/material.dart';

import 'package:fisheller_app/screens/map/components/map.dart';
import 'package:fisheller_app/screens/map/components/filter.dart';
import 'package:fisheller_app/screens/map/components/search_bar.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

Future<dynamic> _filter(){
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return FilterPopUp();
       });
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
                    top: 100,
                    left: 10,
                    child: SafeArea(
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        child: FloatingActionButton(
                            onPressed: _filter,
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