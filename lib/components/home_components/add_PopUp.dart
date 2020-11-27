import 'package:fisheller_app/screens/post/post.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class add_PopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color color = Colors.white;

    return Column(
      children: <Widget>[
        SizedBox(
          height: 450,
        ),
        Container(
          child: AlertDialog(
            insetPadding: EdgeInsets.all(15),
            elevation: 3,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
                  width: 400,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      _buildButton(
                          onPressed: () => {},
                          imageName: "assets/icons/icon_add_seafood.svg",
                          text: "Add Catch"),
                      SizedBox(width: 5), //Spacer
                      _buildButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostPage()),
                              ),
                          imageName: "assets/icons/icon_add_post.svg",
                          text: "Add Post")
                    ],
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                // changes position of shadow
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton({Function onPressed, String imageName, String text}) {
    //TODO eventually pass a function as a parameter and use it, on the onPressed, so we can change pages.
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: FlatButton(
            color: WHITE_COLOUR,
            onPressed: onPressed,
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset(
              imageName,
              height: 110,
              width: 110,
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
      ),
      SizedBox(
        height: 15, //spacer
      ),
      Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
    ]);
  }
}
