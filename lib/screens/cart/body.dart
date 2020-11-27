import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/components/cart_card.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/screens/cart/background.dart';
import 'package:flutter/material.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    /*Consumer currentUser;
    MySharedPreferences.instance
        .getCurrentUser("currentUser")
        .then((email) {
          print(email);
        MySharedPreferences.instance
            .getConsumer(email).then(
                (value) {
                  print(value);
                  currentUser = Consumer.fromJson(value);
                          );
    });
  }
    print(currentUser);
    print(currentUser.bookings);
    print(currentUser.bookings.length);*/
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*if(currentUser.bookings.length == 0)
              CartEmpty(),
            if(currentUser.bookings.length > 0)
              for ( var booking in currentUser.bookings )*/
            CartCard(
              booking: null,
              press: (){return null;},
            ),
            CartCard(
              booking: null,
              press: (){return null;},
            ),
            CartCard(
              booking: null,
              press: (){return null;},
            ),
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