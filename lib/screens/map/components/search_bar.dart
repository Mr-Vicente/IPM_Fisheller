import 'package:flutter/material.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/components/text_field_container.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: SafeArea(
            child:SearchInputField(
              hintText: "Search Location",
              onChanged: (value) {},
            )
        )
    );
  }
}

class SearchInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const SearchInputField({
    Key key,
    this.hintText,
    this.icon = Icons.location_on_outlined,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: PRIMARY_COLOUR,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: PRIMARY_COLOUR,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}