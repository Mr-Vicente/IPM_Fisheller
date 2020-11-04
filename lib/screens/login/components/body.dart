import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/login/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/fisheller_logo.svg",
            height: size.height * 0.2,
          ),
          Container(
            width: size.width * 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                  color: Colors.white,
                  onPressed: (){},
                  child: Text(
                    "Login",
                    style: TextStyle(color: SECONDARY_COLOUR),
                  )
              ),
            ),
          ),
        ]
      ),
    );
  }
}
