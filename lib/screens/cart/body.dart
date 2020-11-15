import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/cart/background.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if(markets.length > 0)
              CartEmpty(),
            if(markets.length == 0)
              for ( var market in markets )
                for (var sell in market.items)
                  Selling_Card(
                    sell: sell,
                    type: "feed",
                    press: (){return null;},
                  )
          ],
        ),
      ),
    );
  }
}

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
        width: size.width * 0.8,
        height: 70,
        decoration: BoxDecoration(
          color: WHITE_COLOUR,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: -15,
              blurRadius: 11,
              offset: Offset(0, -13), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: -15,
              blurRadius: 11,
              offset: Offset(0, 13), // changes position of shadow
            ),
          ],
        ),
      child: Center(
          child: Text(
            "Cart empty",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
        ),
      ),
    );
  }
}