import 'package:fisheller_app/screens/book_fish/components/select_quantity.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/constants.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  final double initValue;
  final double max;
  final double min;
  final double step;
  final double fontSize;
  final String units;
  QuantityState parent;
  
   CustomSlider({
     this.initValue = 0,
     this.max = 100,
     this.min = 0,
     this.step = 0.01,
     this.fontSize = 12,
     this.units = '',
     this.parent
  });

  @override
  _CustomSliderState createState() =>_CustomSliderState(
      initValue: this.initValue, 
      max: this.max, 
      min: this.min, 
      step: this.step, 
      fontSize: this.fontSize, 
      units: this.units, 
      parent: this.parent);
  

}

class _CustomSliderState extends State<CustomSlider> {

  double _value = 0.0;
  double initValue;
  final double max;
  final double min;
  final double step;
  final double fontSize;
  final String units;
  QuantityState parent;


  _CustomSliderState({
    this.initValue = 0,
    this.max = 100,
    this.min = 0,
    this.step = 0.01,
    this.fontSize = 12,
    this.units = '',
    this.parent
  });


  Slider _slider(){
    return Slider(
        value: _value,
        max: max,
        min: min,
        label: '$_value',
        focusNode: FocusNode(),
        divisions: ((max-min)/step).round(),
        onChanged: (double value) {
          setState(() {
            _value = double.parse((value).toStringAsFixed(2));
            _updateParent(value);
          });
        }
    );
  }
  
  void _updateParent(double value){
    if(parent == null)
      return;
    parent.updateSliderValue(value);
  }

  Widget _customSlider(){
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorColor: PRIMARY_COLOUR,
          valueIndicatorTextStyle: TextStyle(color: Colors.white, fontSize: fontSize-8),
          valueIndicatorShape: RectangularSliderValueIndicatorShape(),
          minThumbSeparation: step,
          activeTickMarkColor: PRIMARY_COLOUR,
          inactiveTickMarkColor: LIGHT_GRAY_COLOUR,
          activeTrackColor: PRIMARY_COLOUR,
          inactiveTrackColor: LIGHT_GRAY_COLOUR,
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: fontSize/2,
          thumbColor: PRIMARY_COLOUR,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: (fontSize/2) + 1 ),
          overlayColor: Colors.black12,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 5.0),
        ),
        child: _slider()
    );
  }

  double getValue(){
    return _value;
  }

  @override
  void initState() {
    _value = initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String top = max.round().toString() + units;
    return
      Row(
          children: <Widget>[
            Container(
              width: 220 ,
              //child: _customSlider()
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child:_customSlider()
              )
            ),
            Text(top, style: TextStyle(fontFamily: 'Raleway', fontSize: fontSize + 6, fontWeight: FontWeight.w600))
          ]
      );
  }
}

// ignore: must_be_immutable
class CustomRangeSlider extends StatefulWidget {
  final double maxInitValue;
  final double minInitValue;
  final double max;
  final double min;
  final double step;
  final double fontSize;
  _CustomRangeSliderState state;

  CustomRangeSlider({
    this.minInitValue,
    this.maxInitValue,
    this.max = 100,
    this.min = 0,
    this.step = 0.01,
    this.fontSize = 12
  });

  @override
  _CustomRangeSliderState createState() => (state = _CustomRangeSliderState(minInitValue: this.minInitValue, maxInitValue: this.maxInitValue, max: this.max, min: this.min, step: this.step, fontSize: this.fontSize));

  _CustomRangeSliderState getState(){
    return state;
  }

}

class _CustomRangeSliderState extends State<CustomRangeSlider> {

  RangeValues _currentRangeValues;
  double maxInitValue;
  double minInitValue;
  final double max;
  final double min;
  final double step;
  final double fontSize;


  _CustomRangeSliderState({
    this.minInitValue,
    this.maxInitValue,
    this.max = 100,
    this.min = 0,
    this.step = 0.01,
    this.fontSize = 12
  }){
    if(minInitValue == null)
      minInitValue = min;
    if(maxInitValue == null)
      maxInitValue = (max-min)/2 + min;
    _currentRangeValues = RangeValues(minInitValue, maxInitValue);
  }


  RangeSlider _slider(){
    return RangeSlider(
        values: _currentRangeValues,
        max: max,
        min: min,
        labels: RangeLabels(
          _currentRangeValues.start.round().toString(),
          _currentRangeValues.end.round().toString(),
        ),
        divisions: ((max-min)/step).round(),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeValues = values;
          });
        },
    );
  }

  Widget _customRangeSlider(){
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorColor: PRIMARY_COLOUR,
          valueIndicatorTextStyle: TextStyle(color: Colors.white, fontSize: fontSize),
          rangeValueIndicatorShape: RectangularRangeSliderValueIndicatorShape(),
          minThumbSeparation: step,
          activeTickMarkColor: PRIMARY_COLOUR,
          inactiveTickMarkColor: LIGHT_GRAY_COLOUR,
          activeTrackColor: PRIMARY_COLOUR,
          inactiveTrackColor: LIGHT_GRAY_COLOUR,
          rangeTrackShape: RoundedRectRangeSliderTrackShape(),
          trackHeight: 6.0,
          thumbColor: PRIMARY_COLOUR,
          rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 8.0),
          overlayColor: Colors.black12,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 5.0),
        ),
        child: _slider()
    );
  }

  double getBottomValue(){
    return _currentRangeValues.start;
  }

  double getTopValue(){
    return _currentRangeValues.end;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
          children: <Widget>[
            Text(min.round().toString(), style: TextStyle(fontFamily: 'Raleway', fontSize: 18),),
            _customRangeSlider(),
            Text(max.round().toString(), style: TextStyle(fontFamily: 'Raleway', fontSize: 18),),
          ]
      );



  }
}