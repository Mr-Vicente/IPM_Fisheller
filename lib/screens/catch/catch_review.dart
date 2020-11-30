import 'dart:io';

import 'package:fisheller_app/components/NumberBox.dart';
import 'package:fisheller_app/components/add_catch_card.dart';
import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/home.dart';
import 'package:fisheller_app/components/page_transitions.dart';
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
import 'catch.dart';
import 'catch_media.dart';


class CatchReview extends StatefulWidget {

  List<Seafood> seafoods;
  List<String> seafoodImages;
  CatchReview(this.seafoods, this.seafoodImages);

  @override
  CatchReviewState createState() => CatchReviewState(seafoods, seafoodImages);
}

class CatchReviewState extends State<CatchReview> {

  List<Seafood> seafoods;
  List<String> seafoodImages = [];
  CatchReviewState(this.seafoods, this.seafoodImages);


  Widget _publishButton(Size size){
    return FlatButton(
        onPressed: () {
          showDialog(
              barrierColor: Colors.black.withOpacity(0.2),
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return _publishedPopUp(size);
              });
        },
        child: Container(
            height: 70,
            width: size.width*0.9,
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
            child:
            Center(
              child:
              Text(
                'Publish',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            )
        )
    );
  }


  Widget _publishedPopUp(Size size){
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
                      "Catch Successfully Published",
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
                      height: 50,
                      width: size.width * 0.9,
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
                            Navigator.push(
                              context, SlideRightRoute(page: Home(index: 0,)),
                            )

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
  }


  Widget _screen(Size size){
    return Stack(
      children:<Widget>[
        SingleChildScrollView(
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
                              color: PRIMARY_COLOUR,
                            ),
                            endChild: Text("Info", style: TextStyle(fontWeight: FontWeight.bold)),
                            afterLineStyle:
                            const LineStyle(color: PRIMARY_COLOUR),
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
                              color: PRIMARY_COLOUR,
                            ),
                            beforeLineStyle:
                            const LineStyle(color: PRIMARY_COLOUR),
                            endChild: Text("Media", style: TextStyle(fontWeight: FontWeight.bold)),
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
                              color: PRIMARY_COLOUR,
                            ),
                            beforeLineStyle:
                            const LineStyle(color: PRIMARY_COLOUR),
                            endChild: Text("Review", style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 10.0,),
                SeafoodReviews(seafoods, seafoodImages),
                SizedBox(height: 100.0,),
              ]
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _publishButton(size),
            )
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget screen = _screen(size);
    return Back(body: screen,current: Text("review"),);
  }

}


class SeafoodReviews extends StatefulWidget{
  List<Seafood> seafoods;
  List<String> seafoodImages;
  SeafoodReviews(this.seafoods, this.seafoodImages);

  @override
  SeafoodReviewsState createState() => SeafoodReviewsState(this.seafoods, this.seafoodImages);
  
}

class SeafoodReviewsState extends State<SeafoodReviews>{
  List<Seafood> seafoods;
  List<String> seafoodImages;
  SeafoodReviewsState(this.seafoods, this.seafoodImages);

  List<Widget> seafoodReviews(){
    List<Widget> temp = [];
    int index = 0;
    print("noooooooobaskdoaksodl ");
    for (Seafood s in seafoods){
      print("NEEEEGGAA $index");
      temp.add(
          CatchCard(
            seafood: s,
            image: seafoodImages[index],
          )
      );
      temp.add(SizedBox(height: 10));
      index ++;
    }
    temp.add(SizedBox(height: 10));
    temp.add(
      Align(
        alignment: Alignment.bottomRight,
        child: _addMore()
      )
    );
    temp.add(SizedBox(height: 20));
    return temp;
  }



  
  Widget _addMore(){
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Catch(seafoods, seafoodImages)
          ),//stage2description
        );
      },
      child: Container(
          height: 50,
          width: 120,
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
                  'Add',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.add,
                    size: 22, color: Colors.white)
              ])),
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Column(
      children: seafoodReviews());
  }
  
}