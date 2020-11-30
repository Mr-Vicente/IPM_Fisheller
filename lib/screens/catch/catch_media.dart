import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/page_transitions.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/fish_and_tips.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/screens/book_fish/book_screen.dart';
import 'package:fisheller_app/screens/catch/catch_review.dart';
import 'package:fisheller_app/screens/fish_and_tips/fishNTips_screen.dart';
import 'package:fisheller_app/screens/post/components/MediaBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'catch.dart';

class CatchMedia extends StatefulWidget {
  List<Seafood> seafoods;
  List<String> seafoodImages;

  CatchMedia(this.seafoods, this.seafoodImages);

  @override
  _CatchMedia createState() => _CatchMedia(seafoods, seafoodImages);
}

class _CatchMedia extends State<CatchMedia> {
  List<Seafood> seafoods;
  List<String> seafoodImages;
  File imageFile;
  File imageFile2;
  File imageFile3;
  File imageFile4;

  int timer=0;

  String image1_FilePath = '';
  String image2_FilePath = '';
  String image3_FilePath = '';
  String image4_FilePath = '';

  _CatchMedia(this.seafoods, this.seafoodImages);

  void _updateSeafood() {
    timer++;
    print("THIS is the imags length timer $seafoodImages.lenght");
    if (image1_FilePath != '') {
      seafoodImages.removeLast();
      seafoodImages.add(image1_FilePath);
      return;
    }
    if (image2_FilePath != '') {
      seafoodImages.removeLast();
      seafoodImages.add(image2_FilePath);
      return;
    }
    if (image3_FilePath != '') {
      seafoodImages.removeLast();
      seafoodImages.add(image3_FilePath);
      return;
    }
    if (image4_FilePath != '') {
      seafoodImages.removeLast();
      seafoodImages.add(image4_FilePath);
      return;
    }
    ;
  }

  Widget _screen(Size size) {
    return Container(
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
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ]),
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
                          color: PRIMARY_COLOUR,
                        ),
                        endChild: Text("Info",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        beforeLineStyle: const LineStyle(color: PRIMARY_COLOUR),
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
                          color: PRIMARY_COLOUR,
                        ),
                        endChild: Text("Media",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        beforeLineStyle: const LineStyle(color: PRIMARY_COLOUR),
                        afterLineStyle:
                            const LineStyle(color: LIGHT_GRAY_COLOUR),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      child: TimelineTile(
                        axis: TimelineAxis.horizontal,
                        alignment: TimelineAlign.manual,
                        lineXY: 0.5,
                        isLast: true,
                        indicatorStyle: const IndicatorStyle(
                          width: 20,
                          color: LIGHT_GRAY_COLOUR,
                        ),
                        endChild: Text("Review",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        beforeLineStyle:
                            const LineStyle(color: LIGHT_GRAY_COLOUR),
                        afterLineStyle:
                            const LineStyle(color: LIGHT_GRAY_COLOUR),
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MediaBox(
                      borderColor: Color(0xFFc2d1e2),
                      fillColor: Color(0xFFc3c7d1),
                      mediaSize: Size(size.width * 0.3, size.width * 0.5),
                      callback: (val) => setState(() => image1_FilePath = val),
                      fillImage: image1_FilePath,
                      factor: Size(0.8, 1.1),
                    ),
                    MediaBox(
                      borderColor: Color(0xFFc2d1e2),
                      fillColor: Color(0xFFc3c7d1),
                      mediaSize: Size(size.width * 0.3, size.width * 0.5),
                      callback: (val) => setState(() => image2_FilePath = val),
                      fillImage: image2_FilePath,
                      factor: Size(0.8, 1.1),
                    ),
                  ]),
            ),
            SizedBox(height: 10,),
            Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MediaBox(
                      borderColor: Color(0xFFc2d1e2),
                      fillColor: Color(0xFFc3c7d1),
                      mediaSize: Size(size.width * 0.3, size.width * 0.5),
                      callback: (val) => setState(() => image3_FilePath = val),
                      fillImage: image3_FilePath,
                      factor: Size(0.8, 1.1),
                    ),
                    MediaBox(
                      borderColor: Color(0xFFc2d1e2),
                      fillColor: Color(0xFFc3c7d1),
                      mediaSize: Size(size.width * 0.3, size.width * 0.5),
                      callback: (val) => setState(() => image4_FilePath = val),
                      fillImage: image4_FilePath,
                      factor: Size(0.8, 1.1),
                    ),
                  ]),
            ),
            SizedBox(
              height: 50.0,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(children: <Widget>[
                FlatButton(
                  onPressed: () {
                    _updateSeafood();
                    print("seafood length " + seafoods.length.toString());
                    print("seafoo images " + seafoodImages.length.toString());
                    Navigator.push(
                      context,
                      SlideLeftRoute(
                          page: CatchReview(seafoods, seafoodImages)),
                    );
                  },
                  child: Container(
                      height: 60,
                      width: 140,
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
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Next',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                size: 22, color: Colors.white)
                          ])),
                ),
                SizedBox(height: 10)
              ]),
            ),
          ]),
    ));
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Back(
      body: _screen(size),
      current: Text("catchMedia"),
    );
  }
}
