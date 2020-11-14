import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatefulWidget {
  final Widget child;
  Background({
    Key key,
    @required this.child,
  });
  BackgroundMain createState() => BackgroundMain(child: child);
}

class BackgroundMain extends State<Background>{
  List<bool> isSelected = [true,false];
  final Widget child;
  BackgroundMain({
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
            top: 200.0,
            child: SvgPicture.asset(
              "assets/images/waves_feed.svg",
              height: size.height * 0.8,
            ),
          ),
          Positioned(
            top: 120.0,
            child:
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.black87,
                //border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              child:
                ToggleButtons(
                  children: <Widget>[
                    Text("      Food      ",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    Text("      Posts      ",
                        style: TextStyle(
                        fontWeight: FontWeight.w700,
                          fontSize: 20,
                    ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                        if (buttonIndex == index) {
                          isSelected[buttonIndex] = true;
                        } else {
                          isSelected[buttonIndex] = false;
                        }
                      }
                    });

                  },
                  isSelected: isSelected,
                  borderRadius: BorderRadius.circular(15),
                  fillColor: PRIMARY_COLOUR,
                  selectedColor: WHITE_COLOUR,
                  color: WHITE_COLOUR,
                ),
            ),
          ),
          Positioned(
            child: child,
            top: 250.0,
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
          )
        ],
      ),
    );
  }
}