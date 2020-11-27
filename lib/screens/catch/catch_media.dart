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

  _openGallery () async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
  }

  ImageProvider _decideImageView(){
    if(imageFile == null){
      return Image.asset("image_placeholder_portrait.png").image;
    }
    else{
      return Image.file(imageFile).image;
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
                Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     Container(
                       child: Column(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: <Widget>[
                             Container(
                               height: 180,
                               width: 120,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 image: new DecorationImage(
                                   fit: BoxFit.cover,
                                   image: _decideImageView(),
                                 ),

                               ),
                             ),

                             RaisedButton(onPressed: (){
                               _openGallery();
                             },child: Text('+'),),

                           ]
                       ),
                     ),
                     Container(
                       child: Column(
                           mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: <Widget>[
                             Container(
                               height: 180,
                               width: 120,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 image: new DecorationImage(
                                   fit: BoxFit.cover,
                                   image: _decideImageView(),
                                 ),

                               ),
                             ),

                             RaisedButton(onPressed: (){
                               _openGallery();
                             },child: Text('+'),),

                           ]
                       ),
                     ),
          ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: _decideImageView(),
                                    ),

                                ),
                              ),

                              RaisedButton(onPressed: (){
                                _openGallery();
                              },child: Text('+'),),

                            ]
                        ),
                      ),
                      Container(
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                height: 180,
                                width: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: new DecorationImage(
                                    fit: BoxFit.cover,
                                    image: _decideImageView(),
                                  ),

                                ),
                              ),

                              RaisedButton(onPressed: (){
                                _openGallery();
                              },child: Text('+'),),

                            ]
                        ),
                      ),
                    ]
                ),
              ]
          ),
        ),
      ),
    );
  }
}


