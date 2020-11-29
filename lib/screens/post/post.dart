import 'dart:io';

import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/home_components/amaz_drawer.dart';
import 'package:fisheller_app/screens/post/components/MediaBox.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/screens/post/components/TextBox.dart';
import 'package:fisheller_app/components/add_catch_card.dart';
import '../../constants.dart';

class PostPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _PostState();
  }
}

class _PostState extends State<PostPage> {
  String image1_FilePath = '';
  String image2_FilePath = '';
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Widget _screen(Size size) {
    return Container(
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            },
            child: SingleChildScrollView(
              //To avoid
              child: Container(
                color: WHITE_COLOUR,
                height: size.height * 0.9,
                width: size.width,
                child: Column(
                  children: <Widget>[
                    Text("Add Post",
                        style: TextStyle(
                            fontSize: size.width * 0.12,
                            fontWeight: FontWeight.w900)),
                    SizedBox(height: size.width * 0.02), //spacer

                    Container(
                      width: size.width * 0.9,
                      child: Text(
                        "Title",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w900),
                      ),
                    ),

                    TextBox(
                      controller: titleController,
                      contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                      borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                      maxLines: 1,
                      width: size.width * 0.9,
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: Text(
                        "Description",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    TextBox(
                      controller: descriptionController,
                      borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                      maxLines: 3,
                      maxChars: 150,
                      width: size.width * 0.9,
                    ),
                    MediaBox(
                        borderColor: Color(0xFFc2d1e2),
                        fillColor: Color(0xFFc3c7d1),
                        mediaSize: Size(size.width * 0.7, size.width * 0.3),
                        callback: (val) =>
                            setState(() => image1_FilePath = val),
                        fillImage: image1_FilePath),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    MediaBox(
                      borderColor: Color(0xFFc2d1e2),
                      fillColor: Color(0xFFc3c7d1),
                      mediaSize: Size(size.width * 0.7, size.width * 0.3),
                      callback: (val) => setState(() => image2_FilePath = val),
                      fillImage: image2_FilePath,
                    ),

                    Expanded(
                        child: Align(
                            //padding: EdgeInsets.only(top: size.height * 0.023),
                            alignment: Alignment.center,
                            child: Container(
                              height: size.height * 0.083,
                              width: size.width * 0.7,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 1,
                                    ),
                                  ]),
                              child: FlatButton(
                                  color: PRIMARY_COLOUR,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text('Publish',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white)),
                                  onPressed: () => publish(context)),
                            ))),
                  ],
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Back(body: _screen(size));
  }

  Future<dynamic> publish(context) {
    //TODO Icon
    Size size = MediaQuery.of(context).size;

    List<String> imgs = [];
    if (image1_FilePath != null) imgs.add(image1_FilePath);

    if (image2_FilePath != null) imgs.add(image2_FilePath);
    // post = Post(
    //     title: titleController.text,
    //     description: descriptionController.text,
    //     info: imgs);

    double hPercentage = 0.05;
    double wPercentage = 0.32;
    return showDialog(
        barrierColor: Colors.black.withOpacity(0.2),
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: AlertDialog(
              insetPadding: EdgeInsets.all(15),
              elevation: 3,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                      width: 400,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "Post Successfully added",
                            style: TextStyle(fontSize: 25),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 20),
                          Icon(
                            Icons.celebration,
                            size: 100,
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: size.height * hPercentage,
                            width: size.width * wPercentage,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 0,
                                    blurRadius: 1,
                                  ),
                                ]),
                            child: FlatButton(
                                color: PRIMARY_COLOUR,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text('Ok',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white)),
                                onPressed: () => {
                                      Navigator.pop(context),
                                      Navigator.pop(context)
                                    }),
                          ),
                        ],
                      )

                      //Spacer

                      ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  // changes position of shadow
                ),
              ],
            ),
          );
        });
  }
}
