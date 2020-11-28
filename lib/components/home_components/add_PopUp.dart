import 'package:fisheller_app/screens/catch/catch.dart';
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
        SizedBox(height: size.height * 0.56),
        Container(
          child: AlertDialog(
            insetPadding: EdgeInsets.only(left:size.height * 0.01, right:size.height * 0.01,),
            elevation: 3,
            contentPadding: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            content: Container(
              height: size.height*0.226,
              width: size.width*0.84,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildButton(
                      size: size,
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Catch(null, null)),
                          ),
                      imageName: "assets/icons/icon_add_seafood.svg",
                      text: "Add Catch"),
                  SizedBox(width: size.height * 0.01), //Spacer
                  _buildButton(
                      size: size,
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PostPage()),
                          ),
                      imageName: "assets/icons/icon_add_post.svg",
                      text: "Add Post")
                ],
              ),
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

  Widget _buildButton(
      {Size size, Function onPressed, String imageName, String text}) {
    //TODO eventually pass a function as a parameter and use it, on the onPressed, so we can change pages.
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: size.width*0.01),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          child: FlatButton(
            color: WHITE_COLOUR,
            onPressed: onPressed,
            padding: EdgeInsets.all(size.height * 0.017),
            child: SvgPicture.asset(
              imageName,
              height: size.height * 0.13,
              width: size.height * 0.13,
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
              offset: Offset(0, size.width*0.007) // changes position of shadow
            ),
          ],
        ),
      ),
      SizedBox(height: size.height * 0.012 //spacer
          ),
      Text(text,
          
          style: TextStyle(
              fontSize: size.height * 0.03, fontWeight: FontWeight.bold, ))
    ]);
  }
}
