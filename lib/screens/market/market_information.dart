import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketUI_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new GestureDetector(
          onTap: () {FocusScope.of(context).requestFocus(new FocusNode());},
          child: MarketUI(),
        )
    );
  }
}


class MarketUI extends StatelessWidget {
  const MarketUI({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height * 0.3),
      height: 500,
      decoration: BoxDecoration(
        color: WHITE_COLOUR,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    );
  }
}