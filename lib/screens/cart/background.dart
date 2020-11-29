import 'package:fisheller_app/components/popup_card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/cart/body.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class CartBackground extends StatefulWidget {
  CartBackground({
    Key key,
  });
  BackgroundMain createState() => BackgroundMain();
}

class BackgroundMain extends State<CartBackground>{
  List<bool> isSelected = [true,false];
  BackgroundMain({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(child:
            CartToggle(),
            top: 70.0,
          ),
        ],
      ),
    );
  }
}