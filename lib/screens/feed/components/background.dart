import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'body.dart';

class FeedBackground extends StatefulWidget {
  final Widget child;
  FeedBackground({
    Key key,
    @required this.child,
  });
  FeedBackgroundState createState() => FeedBackgroundState(child: child);
}

class FeedBackgroundState extends State<FeedBackground>{
  List<bool> isSelected = [true,false];
  final Widget child;
  FeedBackgroundState({
    Key key,
    @required this.child,
  });

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
            top: 100.0,
            child:
            FeedToggle()
          )
        ],
      ),
    );
  }
}