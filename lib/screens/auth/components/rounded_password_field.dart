import 'package:fisheller_app/components/text_field_container.dart';
import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOUR,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: PRIMARY_COLOUR,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: PRIMARY_COLOUR,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}