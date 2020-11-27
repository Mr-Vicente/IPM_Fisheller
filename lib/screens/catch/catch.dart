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


class Catch extends StatefulWidget {

  Catch();

  @override
  _Catch createState() => _Catch();
}

class _Catch extends State<Catch> {

  _Catch();

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
              label: new Text('back', style: TextStyle(fontSize:20, fontWeight: FontWeight.w600)),
              onPressed:() {
                Navigator.pop(context);
              }
          )
      ),
      body: Container(
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
        ),
              ),
                SizedBox(
                  height: 70,
                  child:TimelineTile(
                    axis: TimelineAxis.horizontal,
                    alignment: TimelineAlign.manual,
                    lineXY:0.5,
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
                    endChild: Text("Review"),
                  ),
                ),
              ]
          ),
          ),
              SizedBox(height: 10.0,),
            new DropDown('SELECT SEAFOOD', SEAFOODS, 300, 30, PRIMARY_COLOUR, Colors.white, 13),
              SizedBox(height: 20.0,),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
              child:Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Price / Kg:",
                      textScaleFactor: 1.0,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]
              ),
          ),
              SizedBox(height: 10.0,),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 0.0, 0.0),
              child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(

                        border: Border.all(color: Colors.teal,width: 5.0),
                        borderRadius: BorderRadius.circular(10.0),
                    ),
                      child:SizedBox(height:40,width:50,child:TextField(
                        style: TextStyle(fontSize: 25,height: 2.0),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                           hintText: '00',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      ),
                ),
                Text(',',style: TextStyle(fontSize: 30,height: 2.0),),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(

                    border: Border.all(color: Colors.teal,width: 5.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child:SizedBox(height:40,width:50,child:TextField(
                    style: TextStyle(fontSize: 25,height: 2.0),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '00',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  ),
                ),
                Text('\u{20AC}',style: TextStyle(fontSize: 30,height: 2.0),),
                ]
          ),
          ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Total Weight:",
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 0.0, 0.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(

                          border: Border.all(color: Colors.teal,width: 5.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:SizedBox(height:40,width:50,child:TextField(
                          style: TextStyle(fontSize: 25,height: 2.0),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '00',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        ),
                      ),
                      Text(',',style: TextStyle(fontSize: 30,height: 2.0),),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(

                          border: Border.all(color: Colors.teal,width: 5.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:SizedBox(height:40,width:50,child:TextField(
                          style: TextStyle(fontSize: 25,height: 2.0),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '00',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        ),
                      ),
                      Text('Kg',style: TextStyle(fontSize: 20,height: 2.0),),
                    ]
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Quantity:",
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(100.0, 0.0, 0.0, 0.0),
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(

                          border: Border.all(color: Colors.teal,width: 5.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:SizedBox(height:40,width:50,child:TextField(
                          style: TextStyle(fontSize: 25,height: 2.0),
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '00',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        ),
                      ),
                      Text('Units',style: TextStyle(fontSize: 20,height: 2.0),),
                    ]
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Tags:",
                        textScaleFactor: 1.0,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.0,),
    Padding(
    padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
    child:Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[


    ]
    ),
    ),
              SizedBox(height: 100.0,),
          ]
              ),
      ),
      ),
      bottomNavigationBar: BottomAppBar(//app bar geral
        child: Container(
          height:65.0,
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}