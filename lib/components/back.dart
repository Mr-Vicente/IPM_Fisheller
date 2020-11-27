import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Back extends StatelessWidget{
  Widget body;
  Widget bottom;
  Back({
    this.body,
    this.bottom
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 200.0,
            leading:
            FlatButton.icon(
                icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
                label: new Text('back', style: TextStyle(fontSize:20, fontWeight: FontWeight.w600)),
                onPressed:() {
                  Navigator.pop(context);
                }
            )
        ),
        body: body,
        bottomSheet: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: bottom,
        ),
    );
  }
  
}