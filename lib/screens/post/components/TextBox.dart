import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  TextBox(
      {this.controller,
      this.width,
      this.hint: "Insert text here...",
      this.fillColor: Colors.white,
      this.margins : const EdgeInsets.all(0),
      this.maxLines : 1, //Use this to change size
      this.maxChars : 50,
      this.contentPadding : const EdgeInsets.all(10),
      this.borderColor: Colors.black,
      this.borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      this.borderSyle: BorderStyle.solid, //can be BorderStyle.none
      this.borderWidth: 2.0});
  final TextEditingController controller;
  final double width;
  final String hint;
  final Color fillColor;
  final EdgeInsets margins;
  final int maxLines;
  final int maxChars;
  final EdgeInsets contentPadding;

  final Color borderColor;
  final BorderRadius borderRadius;
  final BorderStyle borderSyle;
  final double borderWidth;
  // static GlobalKey<FormState> key1 = new GlobalKey<FormState>();
  //TODO other things
  @override
  Widget build(BuildContext context) {
    var border = new OutlineInputBorder(
            borderRadius: borderRadius,
            borderSide: BorderSide(
                style: borderSyle, width: borderWidth, color: borderColor),
          );
    return Container(
      margin: margins,
      width: width,
      child: TextFormField(
        key: key,
        controller: controller,
        maxLines: maxLines,
        maxLength: maxChars,
        decoration: new InputDecoration(          
          hintText: hint,
          contentPadding: contentPadding,
          fillColor: fillColor,
          border: border,
          enabledBorder: border
        ),
        validator: (val) {
          if (val.length == 0) {
            return "Text cannot be empty";
          } else {
            return null;
          }
        },
        
        style: new TextStyle(
          fontFamily: "Poppins",
          fontSize: 14.0,
        ),
      ),
    );
  }
}
