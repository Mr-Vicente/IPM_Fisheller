import 'package:fisheller_app/components/rounded_button.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/auth/login/login_screen.dart';
import 'package:fisheller_app/screens/auth/signup/signup_screen.dart';
import 'package:fisheller_app/screens/auth/welcome/components/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            Image.asset(
              "assets/images/fisheller_logo.png",
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              color: WHITE_COLOUR,
              textColor: PRIMARY_COLOUR,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: WHITE_COLOUR,
              textColor: PRIMARY_COLOUR,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}