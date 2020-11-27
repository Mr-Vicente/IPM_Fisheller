import 'package:fisheller_app/components/NumberBox.dart';
import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:fisheller_app/components/drop_down.dart';
import 'package:fisheller_app/screens/post/components/TextBox.dart';

import 'add_tags.dart';


class Catch extends StatefulWidget {

  Catch();

  @override
  _Catch createState() => _Catch();
}

class _Catch extends State<Catch> {

  final descriptionController = TextEditingController();
  final priceController1 = TextEditingController();
  final priceController2 = TextEditingController();
  final weightController1 = TextEditingController();
  final weightController2 = TextEditingController();
  final quantityController = TextEditingController();

  _Catch();


  Widget _screen(){
    return Container(
      child:SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Center(
                child: new DropDown('SELECT SEAFOOD', SEAFOODS, 300, 40, PRIMARY_COLOUR, Colors.white, 15),
              ),

              SizedBox(height: 20.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child: Text(
                  "Price / Kg:",
                  textScaleFactor: 1.0,
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20.0),
                    NumberBox(
                      controller: priceController1,
                      borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                      maxLines: 1,
                      maxChars: 2,
                      width: 60,
                    ),
                    SizedBox(width: 10.0),
                    Text(',',style: TextStyle(fontSize: 30,height: 2.0),),
                    SizedBox(width: 10.0),
                    NumberBox(
                      controller: priceController2,
                      borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                      maxLines: 1,
                      maxChars: 2,
                      width: 60,
                    ),
                    SizedBox(width: 10.0),
                    Text('€',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    SizedBox(width: 5.0),
                  ]
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:
                Text(
                  "Total Weight:",
                  textScaleFactor: 1.0,
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 20.0),
                    NumberBox(
                      controller: weightController1,
                      borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                      maxLines: 1,
                      maxChars: 2,
                      width: 60,
                    ),
                    SizedBox(width: 10.0),
                    Text(',',style: TextStyle(fontSize: 30,height: 2.0),),
                    SizedBox(width: 10.0),
                    NumberBox(
                      controller: weightController2,
                      borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                      maxLines: 1,
                      maxChars: 2,
                      width: 60,
                    ),
                    SizedBox(width: 10.0),
                    Text('Kg',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ]
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:
                Text(
                  "Quantity:",
                  textScaleFactor: 1.0,
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    NumberBox(
                      controller: quantityController,
                      borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10.0),
                      maxLines: 1,
                      maxChars: 2,
                      width: 60,
                    ),
                    SizedBox(width: 10.0),
                    Text('Units',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(width: 45.0),
                  ]
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:
                Text(
                  "Tags:",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 0.0, 0.0),
                  child: TagsButtons()
              ),


              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:Text(
                  "Description:",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child:
                TextBox(
                  controller: descriptionController,
                  borderColor: PRIMARY_COLOUR.withOpacity(0.2),
                  contentPadding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                  maxLines: 5,
                  maxChars: 150,
                  width: 320,
                ),
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                    children: <Widget>[

                      FlatButton(
                        onPressed: (){

                        },
                        child: Container(
                          height: 60,
                          width: 140,
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
                          child:Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: 10,),
                              Text(
                                'Next',
                                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded, size: 22, color: Colors.white)
                            ]
                          )
                        ),
                      ),
                      SizedBox(height: 10)
                    ]
                ),
              )
            ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Back(body:_screen()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}