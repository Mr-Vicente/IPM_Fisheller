import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'body.dart';

class FeedBackground extends StatefulWidget {
  List<bool> isSelected;
  FeedBackground(this.isSelected);
  FeedBackgroundState createState() => FeedBackgroundState(isSelected);
}

class FeedBackgroundState extends State<FeedBackground>{
  List<bool> isSelected;
  FeedBackgroundState(this.isSelected);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 120.0,
            child: SvgPicture.asset(
              "assets/images/waves_feed.svg",
              height: size.height * 0.8,
            ),
          ),
          Positioned(
            top: 70.0,
            child:
            FeedToggle(isSelected)
          )
        ],
      ),
    );
  }
}