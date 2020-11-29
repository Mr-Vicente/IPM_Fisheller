import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'dart:io';

class CatchCard extends StatelessWidget {
  final Seafood seafood;
  final File image;
  final Color color, textColor;
  final double percentage_width;
  const CatchCard({
    Key key,
    this.seafood,
    this.image,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.95,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: size.width * percentage_width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image_Box(image: image),
          Info_Box(seafood: seafood),
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
  final File image;
  const Image_Box({
    Key key,
    this.image,
  }) : super(key: key);

  ImageProvider _image() {
    if (image == null) {
      return Image.asset("assets/images/image_placeholder_portrait.png").image;
    } else {
      return Image.file(image).image;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: size.width * 0.3,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: _image(),
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
  final Seafood seafood;
  const Info_Box({
    Key key,
    this.seafood,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: size.width * 0.55,
      //color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Title_Tags_Box(seafood: seafood),
          Numbers_Box(
            seafood: seafood,
          ),
          DrawButtons(),
        ],
      ),
    );
  }
}

class Title_Tags_Box extends StatelessWidget {
  final Seafood seafood;
  const Title_Tags_Box({Key key, this.seafood}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(top: 5, left: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Title_Box(title: seafood.type.name),
          SizedBox(width: 10, height: 5),
          Flexible(
            child:
            Wrap(
                spacing: 3,
                runSpacing: 2,
                children: <Widget> [
                  for (int i = 0; i<2 && i<seafood.tags.length; i++)
                    Tag_Box(tag: seafood.tags[i].name),
                ]
            )
          )
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
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        ),
      ),
    );
  }
}

class Title_Box extends StatelessWidget {
  final String title;
  static const TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
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
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
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
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Number_Info_Box(
            number: seafood.price,
            text: "Price\n(€ / Kg)",
            sz: Size(70, 70),
            space: 5.0,
            fontSize: 24,
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
  final double fontSize;
  const Number_Info_Box(
      {Key key, this.number, this.text, this.sz, this.space, this.fontSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Number_Circle(
            text: number.toString(),
            circle_size: sz,
            fontSize: fontSize,
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
            fontSize: 18,
            number: seafood.quantityUnits,
            text: "Quantity\n(Unit.)",
            sz: Size(55, 55),
            space: 20.0,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Image.asset(
              "assets/icons/double-arrow.png",
              width: 20,
            ),
          ),
          Number_Info_Box(
            fontSize: 18,
            number: seafood.quantityMass,
            text: "Quantity\n(Kg.)",
            sz: Size(55, 55),
            space: 20.0,
          ),
        ],
      ),
    );
  }
}

class Number_Circle extends StatelessWidget {
  final num arcWidth;
  final Size circle_size;
  final double fontSize;
  static const Size s = Size(200, 200);
  final String text;

  const Number_Circle({
    Key key,
    this.fontSize: 35,
    this.text,
    this.arcWidth,
    this.circle_size: s,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      width: circle_size.width,
      height: circle_size.height,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
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
  const DrawButtons({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, top: 4),
              child: Container(
                  height: 40,
                  width: 40,
                  child: Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.create_outlined,
                          color: Colors.black45, size: 25)),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 3,
                        color: Colors.black45,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(100),
                  )),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  child: Container(
                      height: 40,
                      width: 40,
                      child: Align(
                          alignment: Alignment.center,
                          child: Image.asset('assets/icons/trash_icon.png', width: 20, color: SALMON_COLOUR)
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: SALMON_COLOUR,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(100),
                      )),
                  onPressed: () {},
                )
            ),
          ]),
    );
  }
}
