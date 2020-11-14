
import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/feed/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    for ( var sell in fixeFixe_market.items )
      print(sell.market);
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for ( var market in markets )
              for (var sell in market.items)
                Selling_Card(
                sell: sell,
                type: "feed",
                press: (){return null;},)

          ],
        ),
      ),
    );
  }
}