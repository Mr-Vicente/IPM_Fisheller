import 'dart:io';

import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/home.dart';
import 'package:fisheller_app/components/home_components/amaz_drawer.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/models/post.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:fisheller_app/screens/catch/catch.dart';
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
  var scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _screen(Size size) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Add Post",
              style: TextStyle(
                  fontSize: size.width * 0.12, fontWeight: FontWeight.w900)),
          SizedBox(height: size.width * 0.02), //spacer

          Container(
            width: size.width * 0.9,
            child: Text(
              "Title",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: size.width * 0.05, fontWeight: FontWeight.w900),
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
                  fontSize: size.width * 0.05, fontWeight: FontWeight.w900),
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
              callback: (val) => setState(() => image1_FilePath = val),
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
          SizedBox(
            height: size.height * 0.05,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
                onPressed: () => {
                      if (titleController.text.isEmpty)
                        error(context)
                      else
                        publish(context)
                    },
                child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.023),
                    height: 70,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                        color: PRIMARY_COLOUR,
                        border: Border.all(
                            width: 5,
                            color: PRIMARY_COLOUR,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 0,
                            blurRadius: 5,
                          ),
                        ]),
                    child: Center(
                      child: Text(
                        'Publish',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ))),
          )
        ],
      ),
    );
  }

  Future<dynamic> error(context) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return ErrorPopUp(["Title"], "Please fill these fields:");
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: size.height * 0.09,
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 10),
              child: FloatingActionButton(
                onPressed: () => scaffoldKey.currentState.openEndDrawer(),
                child: Image.asset('assets/icons/extra_menu.png', height: 20),
                backgroundColor: Colors.white,
              )),
        ],
        leadingWidth: size.width,
        leading: FlatButton.icon(
          icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
          label: new Text('back',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawerScrimColor: Colors.grey.withOpacity(0.54),
      endDrawer: AmazDrawer(
          topPosition: size.width * 0.35,
          width: size.width * 0.74,
          height: size.height * 0.1,
          elevation: 5,
          color: PRIMARY_COLOUR,
          items: [
            AmazDrawerItem(
                iconData: Icons.face,
                iconSize: size.width * 0.1,
                text: "Profile",
                textSize: size.width * 0.08),
            AmazDrawerItem(
                iconData: Icons.settings,
                iconSize: size.width * 0.1,
                text: "Settings",
                textSize: size.width * 0.08),
            AmazDrawerItem(
                iconData: Icons.help,
                iconSize: size.width * 0.1,
                text: "Help",
                textSize: size.width * 0.08),
            AmazDrawerItem(
                iconData: Icons.logout, iconSize: 50.0, text: "Logout")
          ]),
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: _screen(size),
      ),
    );
  }

  //return Back(body: _screen(size),current: Text("post"),);
  // return Scaffold(body: new GestureDetector(
  //       onTap: () {FocusScope.of(context).requestFocus(new FocusNode());},
  //       child:_screen(size),
  //     ),);

  Future<dynamic> publish(context) {
    //TODO Icon
    Size size = MediaQuery.of(context).size;

    List<String> imgs = [];
    if (image1_FilePath != "") imgs.add(image1_FilePath);

    if (image2_FilePath != "") imgs.add(image2_FilePath);

    print(titleController.text +
        " " +
        descriptionController.text +
        " " +
        image1_FilePath);
    Vendor vd;
    Post post;
    getCurrentVendorObject().then((currentUser) {
      vd = currentUser;
      post = Post(titleController.text, descriptionController.text, imgs, vd);
      posts.add(post);
    });
    //MySharedPreferences.instance.setPost(post);

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
                                      Navigator.pop(context),
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Home(
                                                    index: 1,
                                                  )))
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
