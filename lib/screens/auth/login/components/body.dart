import 'package:fisheller_app/components/home.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/components/rounded_button.dart';
import 'package:fisheller_app/components/rounded_input_field.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/User.dart';
import 'package:fisheller_app/models/consumer.dart';
import 'package:fisheller_app/screens/auth/login/components/background.dart';
import 'package:fisheller_app/screens/auth/components/rounded_password_field.dart';
import 'package:fisheller_app/screens/auth/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/already_have_an_account_acheck.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String email = null;
    String password = null;
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/fisheller_logo.png",
                height: size.height * 0.2,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                    MySharedPreferences.instance
                          .getUser(email).then(
                              (value) {
                                User c  = User.fromJson(value);
                                print(c.password);
                              if (c != null && c.password == password){
                                MySharedPreferences.instance
                                    .setCurrentUser("currentUser", email);
                                Navigator.pop(context);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                       return Home();
                                    },
                                  ),
                                );
                            }
                              });
                },
                color: WHITE_COLOUR,
                textColor: PRIMARY_COLOUR,
                percentage_width: 0.4,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
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
            ]
          ),
        ),
    );
  }
}
