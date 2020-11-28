import 'dart:io';

import 'package:fisheller_app/components/slider.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../book_screen.dart';

class Quantity extends StatefulWidget {
  final Seafood seafood;
  BookBox parent;
  Quantity(this.seafood, this.parent);

  QuantityState createState() => QuantityState(seafood, parent);
}

class QuantityState extends State<Quantity>{
  final Seafood seafood;
  BookBox parent;

  List<bool> isSelected = [true,false];
  CustomSlider unitSlider;
  CustomSlider massSlider;
  NumberCircle nP = NumberCircle('0.00 €', '~Price');
  NumberCircle nD = NumberCircle('0.00 €', 'Deposit');

  double unitValue = 0;
  double massValue = 0;

  String price;
  String deposit;

  Widget displayedSlider;

  QuantityState(this.seafood, this.parent);



  double avrgPrice(){
    if(isSelected[0])
      return avrgUnitPrice();
    return avrgMassPrice();
  }

  double avrgUnitPrice(){
    return unitValue*
        seafood.price*
        seafoodTips[seafood.type].avrgWeight/1000;
  }

  double avrgMassPrice(){
    return massValue* seafood.price;
  }

  void _updatePrices(){
    price = avrgPrice().toStringAsFixed(2)+'€';
    deposit = (avrgPrice()*0.1).toStringAsFixed(2)+'€';
    nP.updateText(price);
    nD.updateText(deposit);
    parent.setOrder(avrgPrice(), avrgPrice()*0.1, massValue, unitValue, isSelected[0]);
  }


  void updateSliderValue(double value){
    if(isSelected[0])
      unitValue = value;
    else
      massValue = value;
    _updatePrices();
  }


  @override
  void initState() {
    super.initState();
    unitSlider = CustomSlider(max: seafood.quantityUnits.toDouble(), step: 1.0, fontSize: 22, units: ' u', parent: this,);
    massSlider = CustomSlider(max: seafood.quantityMass.toDouble(), fontSize: 22, units: ' kg', parent: this);

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 30,
          width: 144,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.black87,
            //border: Border.all(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: ToggleButtons(
            children: <Widget>[
              Text("      Unit.      ",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text("      Kg      ",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
                _updatePrices();
              });
            },
            isSelected: isSelected,
            borderRadius: BorderRadius.circular(10),
            fillColor: PRIMARY_COLOUR,
            selectedColor: WHITE_COLOUR,
            color: WHITE_COLOUR,
          )
        ),

        Padding(
            padding: EdgeInsets.only(left: 15.0, top: 20),
            child: AnimatedCrossFade(
              duration: const Duration(microseconds: 1),
              firstChild: unitSlider,
              secondChild: massSlider,
              crossFadeState: isSelected[0] ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            )
        ),
        Padding(
            padding: EdgeInsets.only(top: 20),
            child:
            Wrap(
                children: <Widget>[
                  nP,
                  SizedBox(width: 20),
                  nD
                ]
            )
        )
      ],
    );
  }
}

class NumberCircle extends StatefulWidget{
  final String text;
  final String label;
  NumberCircleState state;
  
  NumberCircle(
    this.text,
    this.label
  );

  @override
  State<NumberCircle> createState() => state = NumberCircleState(
      text,
      label
  );

  void updateText(String t){
    state.updateText(t);
  }

}


class NumberCircleState extends State<NumberCircle> {
  String text;
  String label;

  NumberCircleState(
    this.text,
    this.label
  );

  void updateText(String t){
    setState(() {
      text = t;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 130,
            height: 130,
            child:Column(
              children: <Widget>[
                SizedBox(height: 40),
                Text(text, style: TextStyle(fontFamily: 'RobotoMono', fontSize: 20)),
                SizedBox(height: 5),
                Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
              ]
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 5, color: PRIMARY_COLOUR, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(100),
            ),
          ),

        ]
    );
  }


}