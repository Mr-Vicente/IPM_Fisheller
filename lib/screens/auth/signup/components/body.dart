import 'package:fisheller_app/components/rounded_button.dart';
import 'package:fisheller_app/components/rounded_input_field.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/auth/components/already_have_an_account_acheck.dart';
import 'package:fisheller_app/screens/auth/components/rounded_password_field.dart';
import 'package:fisheller_app/screens/auth/login/login_screen.dart';
import 'package:fisheller_app/screens/auth/signup/components/background.dart';
import 'package:fisheller_app/screens/auth/signup/components/ordivider.dart';
import 'package:fisheller_app/screens/auth/signup/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/fisheller_logo.png",
              height: size.height * 0.2,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
              color: WHITE_COLOUR,
              textColor: PRIMARY_COLOUR,
              percentage_width: 0.4,
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}