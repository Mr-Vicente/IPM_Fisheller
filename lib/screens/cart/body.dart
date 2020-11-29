import 'dart:io';

import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/components/cart_card.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:fisheller_app/screens/cart/background.dart';
import 'package:flutter/material.dart';

class CartToggle extends StatefulWidget {
  @override
  CartToggleState createState() => CartToggleState();
}

class CartToggleState extends State<CartToggle> {
  CardList pending = CardList(true);
  CardList history = CardList(false);
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
          Container(
            height: 30,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.black87,
              //border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ToggleButtons(
              children: <Widget>[
                Text(
                  "      Pending      ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "      History      ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
              borderRadius: BorderRadius.circular(10),
              fillColor: PRIMARY_COLOUR,
              selectedColor: WHITE_COLOUR,
              color: WHITE_COLOUR,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            width: size.width,
            child: AnimatedCrossFade(
              duration: const Duration(microseconds: 1),
              firstChild: pending,
              secondChild: history,
              crossFadeState: isSelected[0]
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
      ],
    );
  }
}

class CardList extends StatefulWidget {
  final bool isPending;

  CardList(this.isPending);

  @override
  CardListState createState() => CardListState(isPending);
}

class CardListState extends State<CardList> {
  bool isPending;

  CardListState(this.isPending);

  _fetchConsumerObject() {
    return MySharedPreferences.instance
        .getCurrentUser("currentUser")
        .then((email) {
      print(email);
      return MySharedPreferences.instance.getUser(email).then((value) {
        print(value);
        return Consumer.fromJson(value);
      });
    });
  }

  List<Widget> showCards(AsyncSnapshot snapshot) {
    List<Widget> ws = [];
    if (!snapshot.hasData) {
      ws = [CartEmpty()];
    } else {
      Consumer currentUser = snapshot.data;
      print(currentUser);
      print(currentUser.bookings);
      List<Order> l;
      if (isPending)
        l = currentUser.bookings;
      else
        l = currentUser.purchases;
      for (var booking in l) {
        ws.add(
          CartCard(
            booking: booking,
            press: () {
              return null;
            },
            isPending: isPending,
          ),
        );
      }
      if (l.isEmpty) ws = [CartEmpty()];
    }
    return ws;
  }

  Widget _getHistory() {
    return
      SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
          child:
          FutureBuilder(
        future: _fetchConsumerObject(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: showCards(snapshot),
          );
        }));
  }

  Widget _getPending() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100),
      child: FutureBuilder(
          future: _fetchConsumerObject(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: showCards(snapshot),
            );
          }),
    );
  }

  Widget _getList() {
    if (isPending)
      return _getPending();
    else
      return _getHistory();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SizedBox(
            height: size.height - 150,
            child: _getList()
        )
    );
  }
}

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(top:20),
      width: size.width * 0.9,
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
