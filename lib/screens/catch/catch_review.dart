import 'dart:io';

import 'package:fisheller_app/components/NumberBox.dart';
import 'package:fisheller_app/components/add_catch_card.dart';
import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:fisheller_app/components/drop_down.dart';
import 'package:fisheller_app/screens/post/components/TextBox.dart';

import 'add_tags.dart';
import 'catch_media.dart';


class CatchReview extends StatefulWidget {

  List<Seafood> seafoods;
  List<File> seafoodImages;
  CatchReview(this.seafoods, this.seafoodImages);

  @override
  CatchReviewState createState() => CatchReviewState(seafoods, seafoodImages);
}

class CatchReviewState extends State<CatchReview> {

  List<Seafood> seafoods;
  List<File> seafoodImages = [];
  CatchReviewState(this.seafoods, this.seafoodImages);


  Widget _screen(){
    return Container(
      child:SingleChildScrollView(
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
                child:Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                        child:TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.manual,
                          lineXY:0.5,
                          isFirst: true,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: Colors.teal,
                          ),
                          endChild: Text("Info"),
                          afterLineStyle:
                          const LineStyle(color: Colors.teal),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child:TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.manual,
                          lineXY:0.5,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: Colors.teal,
                          ),
                          beforeLineStyle:
                          const LineStyle(color: Colors.teal),
                          endChild: Text("Media"),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child:TimelineTile(
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.manual,
                          lineXY:0.5,
                          isLast: true,
                          indicatorStyle: const IndicatorStyle(
                            width: 20,
                            color: Colors.teal,
                          ),
                          beforeLineStyle:
                          const LineStyle(color: Colors.teal),
                          endChild: Text("Review"),
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.0,),
              SeafoodReviews(seafoods, seafoodImages),
            ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = _screen();
    return Back(body: screen,current: Text("review"),);
  }

}


class SeafoodReviews extends StatefulWidget{
  List<Seafood> seafoods;
  List<File> seafoodImages;
  SeafoodReviews(this.seafoods, this.seafoodImages);

  @override
  SeafoodReviewsState createState() => SeafoodReviewsState(this.seafoods, this.seafoodImages);
  
}

class SeafoodReviewsState extends State<SeafoodReviews>{
  List<Seafood> seafoods;
  List<File> seafoodImages;
  SeafoodReviewsState(this.seafoods, this.seafoodImages);

  List<Widget> seafoodReviews(){
    List<Widget> temp = [];
    int index = 0;
    for (Seafood s in seafoods){
      temp.add(
          CatchCard(
            seafood: s,
            image: seafoodImages[index],
          )
      );
      index ++;
    }
    return temp;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: seafoodReviews(),
    );
  }
  
}