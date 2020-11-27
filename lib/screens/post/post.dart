import 'package:flutter/material.dart';
import 'package:fisheller_app/screens/post/components/TextBox.dart';
import '../../constants.dart';

class PostPage extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: size.width,
            leading: FlatButton.icon(
              icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
              label: new Text('back',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              onPressed: () => Navigator.pop(context),
            )),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus.unfocus();
            }
          },
          child: Container(
            color: WHITE_COLOUR,
            height: size.height,
            width: size.width,
            child: Column(
              children: <Widget>[
                Text("Add Post",
                    style:
                        TextStyle(fontSize: 55, fontWeight: FontWeight.w900)),
                SizedBox(height: 15), //spacer

                Container(
                  width: size.width - 50,
                  child: Text(
                    "Title",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),

                TextBox(
                  controller: titleController,
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                  maxLines: 1,
                  width: 350,
                ),
                Container(
                  width: size.width - 50,
                  child: Text(
                    "Description",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
                TextBox(
                  controller: descriptionController,
                  borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                  maxLines: 3,
                  maxChars: 150,
                  width: 350,
                ),

                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(),
                    Align(
                      alignment : Alignment.center,
                      child: Container(
                        margin: EdgeInsets.only(top:10),
                        width: size.width*0.8,
                        height: size.height*0.15,
                        child: Container(),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              spreadRadius: 1,
                              color: Colors.grey[600],
                              blurRadius: 5,
                            )
                          ],
                        ),
                        child: FittedBox(
                          child: FloatingActionButton(
                            onPressed: () {},
                            tooltip: 'Increment',
                            child: Icon(
                              Icons.add,
                              size: 50,
                            ),
                            elevation: 3.0,
                            backgroundColor: PRIMARY_COLOUR,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
