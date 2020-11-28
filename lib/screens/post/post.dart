import 'package:fisheller_app/components/home_components/amaz_drawer.dart';
import 'package:fisheller_app/screens/post/components/MediaBox.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/screens/post/components/TextBox.dart';
import '../../constants.dart';

class PostPage extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: WHITE_COLOUR,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: size.height*0.09,
          actions: <Widget>[
            SafeArea(
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
            onPressed: () => Navigator.pop(context),
          ),
        ),
        drawerScrimColor: Colors.grey.withOpacity(0.54),
        endDrawer: AmazDrawer(
            topPosition: size.width * 0.35,
            width: size.width * 0.74,
            height: size.height * 0.1,
            elevation: 5,
            color: PRIMARY_COLOUR,
            //backgroundColor: WHITE_COLOUR,
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
            ]),
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus.unfocus();
              }
            }, //TODO add drawerButton, how? if you want all scroll -> put stack with back button and drawer btn there inside scrollview, else just put it outside
            child: SingleChildScrollView(
              //To avoid
              child: Container(
                color: WHITE_COLOUR,
                height: size.height*0.9,
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
                      borderColor: Colors.green,
                      fillColor: Colors.grey,
                      mediaSize: Size(size.width * 0.7, size.width * 0.3),
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    MediaBox(
                      borderColor: Colors.green,
                      fillColor: Colors.grey,
                      mediaSize: Size(size.width * 0.7, size.width * 0.3),
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

  Future<dynamic> publish(context) {
    //TODO Icon
    Size size = MediaQuery.of(context).size;

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
