import 'dart:io';

import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/components/cart_card.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/screens/cart/background.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class OrdersBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _something() {
      return MySharedPreferences.instance.getCurrentUser("currentUser").then((email) {
        print(email);
        return MySharedPreferences.instance.getConsumer(email).then((value) {
          print(value);
          return Consumer.fromJson(value);
        });
      });
    }

    List<Widget> showCards(AsyncSnapshot snapshot){
      List<Widget> ws = [];
      if (!snapshot.hasData) {
        ws = [OrdersEmpty()];
      } else {
        Consumer currentUser = snapshot.data;
        print(currentUser);
        print(currentUser.bookings);
        for (var booking in currentUser.bookings) {
          ws.add(CartCard(
              booking: booking,
              press: () {
                return null;
              }),
          );
        }
        if(currentUser.bookings.isEmpty)
          ws = [OrdersEmpty()];
      }
      return ws;
    }

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return BackgroundOrders(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: FutureBuilder(
            future: _something(),
            builder: (context, snapshot) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: showCards(snapshot),
              );
            }
        ),
      ),
    );
  }
}

class OrdersEmpty extends StatelessWidget {
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
          "No Orders",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}