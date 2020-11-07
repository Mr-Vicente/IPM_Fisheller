import 'package:flutter/material.dart';

import 'package:fisheller_app/screens/map/components/map.dart';
import 'package:fisheller_app/screens/map/components/search_bar.dart';

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {FocusScope.of(context).requestFocus(new FocusNode(descendantsAreFocusable: false));},
        child: new Container(
            child: Stack(
                children: <Widget>[
                  Positioned.fill(child: Map()),
                  Positioned(
                      top: 15,
                      left: 15,
                      right: 90,
                      child: SearchBar()
                  )
                ]
            )
        )
      )
    );
  }
}