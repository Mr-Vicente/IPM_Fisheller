import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/fish_and_tips.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/screens/book_fish/book_screen.dart';
import 'package:fisheller_app/screens/fish_and_tips/fishNTips_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slide_button/slide_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:fisheller_app/components/drop_down.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class CatchMedia extends StatefulWidget {

  CatchMedia();

  @override
  _CatchMedia createState() => _CatchMedia();
}

class _CatchMedia extends State<CatchMedia> {

  File imageFile;
  File imageFile2;
  File imageFile3;
  File imageFile4;

  _openGallery (int n) async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (n == 1) {
      this.setState(() {
        imageFile = picture;
      });
    }
    if (n == 2) {
      this.setState(() {
        imageFile2 = picture;
      });
    }
    if (n == 3) {
      this.setState(() {
        imageFile3 = picture;
      });
    }
    if (n == 4) {
      this.setState(() {
        imageFile4 = picture;
      });
    }
  }

  ImageProvider _decideImageView(int n){
    if (n == 1) {
      if (imageFile == null) {
        return Image
            .asset("assets/images/image_placeholder_portrait.png")
            .image;
      }
      else {
        return Image
            .file(imageFile)
            .image;
      }
    }
    if (n == 2) {
      if (imageFile2 == null) {
        return Image
            .asset("assets/images/image_placeholder_portrait.png")
            .image;
      }
      else {
        return Image
            .file(imageFile2)
            .image;
      }
    }
    if (n == 3) {
      if (imageFile3 == null) {
        return Image
            .asset("assets/images/image_placeholder_portrait.png")
            .image;
      }
      else {
        return Image
            .file(imageFile3)
            .image;
      }
    }
    if (n == 4) {
      if (imageFile4 == null) {
        return Image
            .asset("assets/images/image_placeholder_portrait.png")
            .image;
      }
      else {
        return Image
            .file(imageFile4)
            .image;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 200.0,
          leading:
          FlatButton.icon(
              icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
              label: new Text('back',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              onPressed: () {
                Navigator.pop(context);
              }
          )
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Add Seafood",
                        textScaleFactor: 3.0,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 70,
                          child: TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.5,
                            isFirst: true,
                            indicatorStyle: const IndicatorStyle(
                              width: 20,
                              color: Colors.teal,
                            ),
                            endChild: Text("Info"),
                            beforeLineStyle: const LineStyle(color: Colors.teal),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          child: TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.5,
                            indicatorStyle: const IndicatorStyle(
                              width: 20,
                              color: Colors.teal,
                            ),
                            endChild: Text("Media"),
                            beforeLineStyle: const LineStyle(color: Colors.teal),
                            afterLineStyle: const LineStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          child: TimelineTile(
                            axis: TimelineAxis.horizontal,
                            alignment: TimelineAlign.manual,
                            lineXY: 0.5,
                            isLast: true,
                            endChild: Text("Review"),
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 20.0,),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
               child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Container(
                       height:200,
                       width: 150,
                       child: Stack(
                           children: <Widget>[
                             Container(
                               height: 180,
                               width: 120,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 border: Border.all(width: 3, color: Colors.black26, style: BorderStyle.solid),
                                 image: new DecorationImage(
                                   fit: BoxFit.cover,
                                   image: _decideImageView(1),
                                 ),

                               ),
                             ),

                             Positioned(
                               left:60,
                               top:150.0,
                               bottom:-10.0,
                               right: 0.0,
                               child:FlatButton(onPressed: (){
                               _openGallery(1);
                             },child: Container(
                               height: 40,
                               width: 40,
                               decoration: BoxDecoration(
                                   color: PRIMARY_COLOUR,
                                   border: Border.all(width: 5, color: PRIMARY_COLOUR, style: BorderStyle.solid),
                                   borderRadius: BorderRadius.circular(100),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.black.withOpacity(0.3),
                                       spreadRadius: 0,
                                       blurRadius: 5,
                                     ),
                                   ]
                               ),
                               child:Image(
                                 image:AssetImage('assets/icons/plus.png'
                                 ),
                                 height: 20.0,
                                 width: 20.0,
                               ),


                               ),
                             ),
                             ),

                           ]
                       ),
                     ),
                     Container(
                       height:200,
                       width: 150,
                       child: Stack(
                           children: <Widget>[
                             Container(
                               height: 180,
                               width: 120,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 border: Border.all(width: 3, color: Colors.black26, style: BorderStyle.solid),
                                 image: new DecorationImage(
                                   fit: BoxFit.cover,
                                   image: _decideImageView(2),
                                 ),

                               ),
                             ),

                             Positioned(
                               left:60,
                               top:150.0,
                               bottom:-10.0,
                               right: 0.0,
                               child:FlatButton(onPressed: (){
                                 _openGallery(2);
                               },child: Container(
                                 height: 40,
                                 width: 40,
                                 decoration: BoxDecoration(
                                     color: PRIMARY_COLOUR,
                                     border: Border.all(width: 5, color: PRIMARY_COLOUR, style: BorderStyle.solid),
                                     borderRadius: BorderRadius.circular(100),
                                     boxShadow: [
                                       BoxShadow(
                                         color: Colors.black.withOpacity(0.3),
                                         spreadRadius: 0,
                                         blurRadius: 5,
                                       ),
                                     ]
                                 ),
                                 child:Image(
                                   image:AssetImage('assets/icons/plus.png'
                                   ),
                                   height: 20.0,
                                   width: 20.0,
                                 ),


                               ),
                               ),
                             ),

                           ]
                       ),
                     ),
          ]
                ),
          ),
                SizedBox(height: 20.0,),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height:200,
                        width: 150,
                        child: Stack(
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 3, color: Colors.black26, style: BorderStyle.solid),
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: _decideImageView(3),
                                  ),

                                ),
                              ),

                              Positioned(
                                left:60,
                                top:150.0,
                                bottom:-10.0,
                                right: 0.0,
                                child:FlatButton(onPressed: (){
                                  _openGallery(3);
                                },child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: PRIMARY_COLOUR,
                                      border: Border.all(width: 5, color: PRIMARY_COLOUR, style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 0,
                                          blurRadius: 5,
                                        ),
                                      ]
                                  ),
                                  child:Image(
                                    image:AssetImage('assets/icons/plus.png'
                                    ),
                                    height: 20.0,
                                    width: 20.0,
                                  ),


                                ),
                                ),
                              ),

                            ]
                        ),
                      ),
                      Container(
                        height:200,
                        width: 150,
                        child: Stack(
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(width: 3, color: Colors.black26, style: BorderStyle.solid),
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: _decideImageView(4),
                                  ),

                                ),
                              ),

                              Positioned(
                                left:60,
                                top:150.0,
                                bottom:-10.0,
                                right: 0.0,
                                child:FlatButton(onPressed: (){
                                  _openGallery(4);
                                },child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: PRIMARY_COLOUR,
                                      border: Border.all(width: 5, color: PRIMARY_COLOUR, style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(100),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 0,
                                          blurRadius: 5,
                                        ),
                                      ]
                                  ),
                                  child:Image(
                                    image:AssetImage('assets/icons/plus.png'
                                    ),
                                    height: 20.0,
                                    width: 20.0,
                                  ),


                                ),
                                ),
                              ),

                            ]
                        ),
                      ),
                    ]
                ),
          ),
                SizedBox(height: 50.0,),
                Align(
                  alignment: Alignment.bottomRight,
                child: FlatButton(onPressed: (){
                  ;
                },child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOUR,
                      border: Border.all(width: 5, color: PRIMARY_COLOUR, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 5,
                        ),
                      ]
                  ),
                  child:Text(
                    'Next  >',
                    style: TextStyle(color: Colors.white,fontSize: 22),
                    textAlign: TextAlign.center,
                  ),


                ),
                ),
                ),
                SizedBox(height: 20.0,),
              ]
          ),
        ),
      ),
    );
  }
}


