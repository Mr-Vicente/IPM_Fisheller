

import 'package:fisheller_app/components/popup_card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';

class CatchCard extends StatelessWidget {
  final Function press;
  final Sell sell;
  final Color color, textColor;
  final double percentage_width;
  const CatchCard({
    Key key,
    this.sell,
    this.press,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: size.width * percentage_width,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image_Box(seafood: null),
          Info_Box(sell: sell),
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
          image: Image.asset("assets/images/sea_bass.png").image,
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
  final Sell sell;
  const Info_Box({
    Key key,
    this.sell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Seafood seafood = sell.seafood;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: size.width * 0.55,
      //color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Title_Tags_Box(sell: sell),
          Numbers_Box(seafood: sell.seafood,),
          DrawButtons(sell: sell),
        ],
      ),
    );
  }
}


class Title_Tags_Box extends StatelessWidget {
  final Sell sell;
  const Title_Tags_Box({
    Key key,
    this.sell
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Seafood seafood = sell.seafood;
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
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Text(
            tag,
            style: TextStyle(
              color: WHITE_COLOUR,
              fontSize: 10,
            ),
          ),
          color: PRIMARY_COLOUR,
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
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

class Numbers_Box extends StatelessWidget {
  final Seafood seafood;
  const Numbers_Box({
    Key key,
    this.seafood,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Number_Info_Box(
            number: seafood.price,
            text: "Price\n(€ / Kg)",
            sz: Size(60, 60),
            space: 15.0,
          ),
          Equivalent_Box(seafood: seafood),
        ],
      ),
    );
  }
}

class Number_Info_Box extends StatelessWidget {
  final num number;
  final String text;
  final Size sz;
  final num space;
  const Number_Info_Box(
      {Key key, this.number, this.text, this.sz, this.space, thi})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Number_Circle(
            text: number.toString(),
            circle_size: sz,
          ),
          Container(
            margin: EdgeInsets.only(top: space / 2),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class Equivalent_Box extends StatelessWidget {
  final Seafood seafood;
  const Equivalent_Box({
    Key key,
    this.seafood,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Number_Info_Box(
            number: seafood.quantityUnits,
            text: "Quantity\n(Unit.)",
            sz: Size(40, 40),
            space: 35.0,
          ),
          Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Image.asset("assets/icons/double-arrow.png", width: 20,),),
          Number_Info_Box(
            number: seafood.quantityMass,
            text: "Quantity\n(Kg.)",
            sz: Size(40, 40),
            space: 35.0,
          ),
        ],
      ),
    );
  }
}

class Number_Circle extends StatelessWidget {
  final num arcWidth;
  final Size circle_size;
  static const Size s = Size(200, 200);
  final String text;

  const Number_Circle({
    Key key,
    this.text,
    this.arcWidth,
    this.circle_size = s,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      width: circle_size.width,
      height: circle_size.height,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20 - (circle_size.width / s.width) * 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
            width: 4, color: PRIMARY_COLOUR, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class DrawButtons extends StatelessWidget {
  final Sell sell;
  const DrawButtons({
    Key key,
    this.sell,
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
                "Edit",
                style: TextStyle(fontFamily: 'Raleway', fontSize: 15, color: WHITE_COLOUR),
              ),
              onPressed: (){
                /*showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PopUpCard(sell:sell,percentage_width: 0.8,popupType:2);
                  },
                ),*/
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            FlatButton(
              color: SALMON_COLOUR,
              child: Text(
                "Delete",
                style: TextStyle(fontFamily: 'Raleway', fontSize: 15, color: WHITE_COLOUR),
              ),
              onPressed: (){
                print("--------Delete--------");
                /*showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return PopUpCard(order:order,percentage_width: 0.8,popupType:1);
                  },
                );*/
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