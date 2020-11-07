
import 'package:flutter/material.dart';
import 'package:fisheller_app/screens/auth/signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new GestureDetector(
          onTap: () {FocusScope.of(context).requestFocus(new FocusNode());},
          child: Body(),
        )
    );
  }
}