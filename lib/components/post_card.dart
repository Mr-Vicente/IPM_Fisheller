import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/post.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:shape_of_view/shape_of_view.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Color color, textColor;
  final double percentage_width;
  const PostCard({
    Key key,
    this.post,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var images = post.imagesNames;
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: size.width * percentage_width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image_Box(imageName: images.isEmpty ? null : images[0], file: true,),
          Info_Box(post: post,vendor:post.vendor),
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
  final String imageName;
  final bool file;
  const Image_Box({
    Key key,
    this.imageName,
    this.file: false,
  }) : super(key: key);

  ImageProvider _image() {
    if (imageName == null) {
      return Image.asset("assets/images/image_placeholder_portrait.png").image;
    } else {
      if (!imageName.contains("assets")) {
        return Image.file(File(imageName)).image;
      }
        else return Image.asset(imageName).image;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: size.width * 0.35,
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
  final Post post;
  final Vendor vendor;
  const Info_Box({
    Key key,
    this.post,
    this.vendor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(left: 5),
      width: size.width * 0.45,
      //color: Colors.black38,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Title_Box(title: post.title),
          Description(description: post.description,),
          Vendor_Box(vendor: vendor,),
        ],
      ),
    );
  }
}


class Title_Box extends StatelessWidget {
  final String title;
  static const TextStyle textStyle =
  TextStyle(fontWeight: FontWeight.w900, fontSize: 18);
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
          SizedBox(height: 3,),
          /*Container(
            width: _textSize(title, textStyle).width,
            height: 5,
            decoration: BoxDecoration(
              color: PRIMARY_COLOUR,
              borderRadius: BorderRadius.circular(20),
            ),
          )*/
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

class Description extends StatelessWidget {
  final String description;
  const Description({
    Key key,
    this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: size.width*0.8,
      child: Text(
        description,
        textAlign: TextAlign.justify,
      ),
    );
  }
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
    return /*SizedBox(height: 50,width:100,child:*/Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 30,
            height: 30,
            child: Container(
              //color: Colors.black38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 3, color: Colors.black, style: BorderStyle.solid),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(vendor.profile).image,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 5,
          ),
          Text(
            vendor.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );

  }
}

