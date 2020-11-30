import 'dart:io';

import 'package:fisheller_app/components/NumberBox.dart';
import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/page_transitions.dart';
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


class Catch extends StatefulWidget {
  List<Seafood> seafoods;
  List<String> seafoodImages;

  Catch(this.seafoods, this.seafoodImages);

  @override
  CatchState createState() => CatchState(seafoods, seafoodImages);
}

class CatchState extends State<Catch> {

  final descriptionController = TextEditingController();
  final priceController1 = TextEditingController();
  final priceController2 = TextEditingController();
  final weightController1 = TextEditingController();
  final weightController2 = TextEditingController();
  final quantityController = TextEditingController();

  List<Seafood> seafoods;
  List<String> seafoodImages;

  Seafood seafood = new Seafood();
  DropDown dd = new DropDown('SELECT SEAFOOD', SEAFOODS, 300, 40, PRIMARY_COLOUR, Colors.white, 15, null);

  TagsButtons tb;
  List<String> currentTags = [];


  CatchState(this.seafoods, this.seafoodImages);

  void setTags(List<String> tags){
    setState(() {
      String dropDownValue = dd.state.getValue();
      dd = new DropDown('SELECT SEAFOOD', SEAFOODS, 300, 40, PRIMARY_COLOUR, Colors.white, 15, dropDownValue);
      dd = dd;
      currentTags = tags;
      List<Tag> temp = [];
      for(String s in tags){
        temp.add(getTagEnum(s));
      }
      seafood.tags = temp;
    });
  }

  void _updateSeafood(){
    setState(() {
      double p1, p2, m1, m2;
      seafood.type = getSeafoodTypeEnum(dd.getState().getValue());
      seafood.description = descriptionController.text;
      try{
        p1 = double.parse(priceController1.text);
      } on Exception catch(e){
        p1 = 0;
      }

      try{
        p2 = double.parse(priceController2.text)*0.01 ;
      } on Exception catch(e){
        p2 = 0;
      }
      seafood.price = p1 + p2;

      try{
        seafood.quantityUnits = int.parse(quantityController.text);
      } on Exception catch(e){
        seafood.quantityUnits = 0;
      }


      try{
         m1 = double.parse(weightController1.text);
      } on Exception catch(e){
        m1 = 0;
      }
      try{
        m2 = double.parse(weightController2.text)*0.01;
      } on Exception catch(e){
        m2 = 0;
      }
      seafood.quantityMass = m1 + m2;
      seafoods.removeLast();
      seafoods.add(seafood);
    });
  }

  bool _checkState(){
    bool canAdd = true;
    List<String> errors = [];
    if(dd.getState() == null || dd.getState().getValue() == null){
      canAdd = false;
      errors.add("Seafood type cannot be empty.");
    }
    if(priceController1.text.isEmpty && priceController2.text.isEmpty){
      canAdd = false;
      errors.add("Price per kilo cannot be empty.");
    }

    if(weightController1.text.isEmpty && weightController2.text.isEmpty){
      canAdd = false;
      errors.add("Total weight cannot be empty.");
    }
    if(quantityController.text.isEmpty){
      canAdd = false;
      errors.add("Quantity of caught seafood cannot be empty.");
    }

    if(currentTags.isEmpty){
      canAdd = false;
      errors.add("At least one Tag must be assigned to this seafood");
    }

    if(descriptionController.text.isEmpty){
      canAdd = false;
      errors.add("Description for this seafood cannot be empty.");
    }
    if(!canAdd){
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return ErrorPopUp(errors, "All fields must be filled",);
          });
    }
    return canAdd;
  }



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
                          afterLineStyle: const LineStyle(color: LIGHT_GRAY_COLOUR),
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
                            color: LIGHT_GRAY_COLOUR,
                          ),
                          endChild: Text("Media", style: TextStyle(fontWeight: FontWeight.bold)),
                          beforeLineStyle:
                          const LineStyle(color: LIGHT_GRAY_COLOUR),
                          afterLineStyle: const LineStyle(color: LIGHT_GRAY_COLOUR),
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
                            color: LIGHT_GRAY_COLOUR,
                          ),
                          endChild: Text("Review", style: TextStyle(fontWeight: FontWeight.bold)),
                          beforeLineStyle:
                          const LineStyle(color: LIGHT_GRAY_COLOUR),
                          afterLineStyle: const LineStyle(color: LIGHT_GRAY_COLOUR),
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: dd,
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
                  child:  tb
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
                          if(_checkState()){
                            _updateSeafood();
                            Navigator.push(
                              context, SlideLeftRoute(page: CatchMedia(seafoods, seafoodImages)),
                            );
                          }
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
  void initState() {
    super.initState();
    if(seafoods == null)
      seafoods = [];
    seafoods.add(seafood);
    if (seafoodImages == null) {
      seafoodImages = [];
      print("I was null idk");}
    seafoodImages.add('');
  }

  @override
  Widget build(BuildContext context) {
    tb = TagsButtons(currentTags: currentTags, parent: this);
    return Back(body: _screen(),current: Text("catch"),);
  }

}

class ErrorPopUp extends StatefulWidget{
  List<String> errors;
  String subMessage;
  ErrorPopUp(this.errors, this.subMessage);

  @override
  ErrorPopUpState createState() => ErrorPopUpState(errors, subMessage);
}

class ErrorPopUpState extends State<ErrorPopUp>{
  List<String> errors;
  String subMessage;


  ErrorPopUpState(this.errors, this.subMessage);

 Widget _messages(){
    List <Widget> m = [];

    for(String e in errors){
      m.add(SizedBox(height: 10,));
      m.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(Icons.fiber_manual_record, size: 12 )
            ),
            SizedBox(width: 5),
            Flexible(child: Text( e,
              textAlign: TextAlign.justify,
            ))
          ]
        )
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: m,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: Container(
            height: 100.0 + (35*errors.length),
            width: 600,
            child:Stack(
                children: <Widget>[
                  Scaffold(
                      backgroundColor: Colors.white,
                      body: Stack(
                          children: <Widget>[
                            Text('Error:', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22, color: SALMON_COLOUR)),

                            Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child: Text(subMessage, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20, color: SALMON_COLOUR)),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 60.0),
                                child: _messages()
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child:
                                FlatButton(
                                  color: SALMON_COLOUR,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text('Ok', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white)),
                                  onPressed: ((){
                                    Navigator.pop(context);
                                  }),
                                ))
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}