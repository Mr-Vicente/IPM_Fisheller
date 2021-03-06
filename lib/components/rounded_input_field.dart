import 'package:fisheller_app/components/text_field_container.dart';
import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOUR,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: PRIMARY_COLOUR,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}