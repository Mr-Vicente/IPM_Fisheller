

import 'package:fisheller_app/components/popup_card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class CartCard extends StatelessWidget {
  final Function press;
  final Order booking;
  final Color color, textColor;
  final double percentage_width;
  final bool isPending;
  const CartCard({
    Key key,
    this.booking,
    this.press,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
    this.isPending = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Order order = booking;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: size.width * percentage_width,
      child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image_Box(seafood: booking.sell.seafood),
              Info_Box(order: order, isPending: isPending,),
            ],
          ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WHITE_COLOUR,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

class Image_Box extends StatelessWidget {
  final Seafood seafood;
  const Image_Box({
    Key key,
    this.seafood,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: size.width * 0.3,
      height:  180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(seafood.media[0]).image,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

class Info_Box extends StatelessWidget {
  final Order order;
  final isPending;
  const Info_Box({
    Key key,
    this.order,
    this.isPending,
  }) : super(key: key);


  Widget _getHistoryInfo(){
    String unit = (order.quantity == 1) ? "%2.0f Unit": "%2.0f Units";
    String format = order.isUnits ? unit: "%2.2f Kg";
    return Column(
      children: <Widget>[
        text_info(categoryText: "Price", content: sprintf("%2.2f €",[order.getTotalPrice()])),
        text_info(categoryText: "Quantity", content: sprintf(format,[order.quantity]))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Seafood seafood = order.sell.seafood;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: size.width * 0.55,
      //color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Title_Tags_Box(order: order),
          text_info(categoryText: "Market:", content: order.sell.marketName),
          if(!isPending)
            _getHistoryInfo(),
          if(isPending)
              text_info(categoryText: "Deposit", content: sprintf("%2.2f €",[order.deposit])),
          Vendor_Box(vendor: order.vendor),
          if(isPending)
            DrawButtons(order:order),
        ],
      ),
    );
  }
}

class text_info extends StatelessWidget {
  final String categoryText;
  final String content;
  const text_info({
    Key key,
    this.categoryText,
    this.content,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(top: 5,left:5, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(categoryText, style: TextStyle(fontWeight: FontWeight.bold),),
          Text(content),
        ],
      ),
    );
  }
}


class Title_Tags_Box extends StatelessWidget {
  final Order order;
  const Title_Tags_Box({
    Key key,
    this.order
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Seafood seafood = order.sell.seafood;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(top: 5,left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Title_Box(title: seafood.type.name),
          SizedBox(width:10,height:5),
          for ( var tag in seafood.tags)
            Tag_Box(tag:tag.name),
        ],
      ),
    );
  }
}

class Tag_Box extends StatelessWidget {
  final String tag;
  const Tag_Box({
    Key key,
    this.tag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          child: Text(
            tag,
            style: TextStyle(
                color: WHITE_COLOUR,
              fontSize: 10,
            ),
          ),
          color: PRIMARY_COLOUR,
          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
        ),
      ),
    );
  }
}

class Title_Box extends StatelessWidget {
  final String title;
  static const TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20
  );
  const Title_Box({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: textStyle,
          ),
          Container(
            width: _textSize(title, textStyle).width,
            height: 2,
            color: PRIMARY_COLOUR,
          )
        ],
      ),
    );
  }
}

Size _textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

class Vendor_Box extends StatelessWidget {
  final Vendor vendor;
  const Vendor_Box({
    Key key,
    this.vendor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
              width: 30,
              height: 30,
                child: Container(
                  //color: Colors.black38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 2, color: Colors.black, style: BorderStyle.solid),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.asset(vendor.profile).image,
                    ),
                  ),
                ),
          ),
          SizedBox(height: 50,width: 10,),
          Text(
            vendor.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ],
      ),
    );
  }
}

class DrawButtons extends StatelessWidget {
  final Order order;
  const DrawButtons({
    Key key,
    this.order,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              color: PRIMARY_COLOUR,
              child: Text(
                "Buy",
                style: TextStyle(fontFamily: 'Raleway', fontSize: 12, color: WHITE_COLOUR, fontWeight: FontWeight.bold),
              ),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PopUpCard(order:order,percentage_width: 0.8, popupType:2);
                  },
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            FlatButton(
              color: SALMON_COLOUR,
              child: Text(
                "Cancel",
                style: TextStyle(fontFamily: 'Raleway', fontSize: 12, color: WHITE_COLOUR, fontWeight: FontWeight.bold),
              ),
              onPressed: (){
                print("--------CANCEL--------");
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return PopUpCard(order:order,percentage_width: 0.8,popupType:1);
                    },
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ]
      ),
    );
  }
}