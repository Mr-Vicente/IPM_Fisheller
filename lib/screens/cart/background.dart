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
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 50.0,
            child: Text(
              "CART",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 50,
              ),
            ),
          ),
          Positioned(child:
            CartToggle(),
            top: 130.0,
          ),
        ],
      ),
    );
  }
}