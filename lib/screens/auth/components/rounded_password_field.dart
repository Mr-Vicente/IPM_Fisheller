import 'package:fisheller_app/components/text_field_container.dart';
import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);
  @override
  _FormFieldSampleState createState() => _FormFieldSampleState(onChanged:onChanged);
}

class _FormFieldSampleState extends State<RoundedPasswordField> {
  final ValueChanged<String> onChanged;

  _FormFieldSampleState({
    this.onChanged,
  });

  bool _obscureText = true;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width:200,
            child: TextFormField(
              obscureText: _obscureText,
              onChanged: onChanged,
              cursorColor: PRIMARY_COLOUR,
              decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: PRIMARY_COLOUR,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          FlatButton(child:
          Icon(
            Icons.visibility,
            color: PRIMARY_COLOUR,
          ),
            onPressed: (){_toggle();},

          ),
        ],
      ),
    );

  }
}