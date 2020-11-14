import 'package:flutter/material.dart';
import 'package:fisheller_app/constants.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  final double initValue;
  final double max;
  final double min;
  final double step;
  final double fontSize;
  _CustomSliderState state;
  
   CustomSlider({
    this.initValue = 0,
    this.max = 100,
    this.min = 0,
    this.step = 0.01,
    this.fontSize = 12
  });

  @override
  _CustomSliderState createState() => (state = _CustomSliderState(initValue: this.initValue, max: this.max, min: this.min, step: this.step, fontSize: this.fontSize));
  _CustomSliderState getState(){
    return state;
  }
}

class _CustomSliderState extends State<CustomSlider> {

  double _value= 0;
  double initValue;
  final double max;
  final double min;
  final double step;
  final double fontSize;


  _CustomSliderState({
    this.initValue = 0,
    this.max = 100,
    this.min = 0,
    this.step = 0.01,
    this.fontSize = 12
  }){
    _value = initValue;
  }


  Slider _slider(){
    return Slider(
        value: _value,
        max: max,
        min: min,
        label: '$_value',
        focusNode: FocusNode(),
        divisions: ((max-min)/step).round(),
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        }
    );
  }

  Widget _customSlider(){
    return SliderTheme(
        data: SliderTheme.of(context).copyWith(
          showValueIndicator: ShowValueIndicator.always,
          valueIndicatorColor: PRIMARY_COLOUR,
          valueIndicatorTextStyle: TextStyle(color: Colors.white, fontSize: fontSize),
          valueIndicatorShape: RectangularSliderValueIndicatorShape(),
          minThumbSeparation: step,
          activeTickMarkColor: PRIMARY_COLOUR,
          inactiveTickMarkColor: SECONDARY_COLOUR.withOpacity(1),
          activeTrackColor: PRIMARY_COLOUR,
          inactiveTrackColor: SECONDARY_COLOUR.withOpacity(1),
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 6.0,
          thumbColor: PRIMARY_COLOUR,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
          overlayColor: SECONDARY_COLOUR.withOpacity(0.5),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
        ),
        child: _slider()
    );
  }

  double getValue(){
    return _value;
  }

  @override
  Widget build(BuildContext context) {
    return
      Row(
          children: <Widget>[
            _customSlider(),
            Text(max.round().toString(), style: TextStyle(fontFamily: 'Raleway', fontSize: 18),),
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
          inactiveTickMarkColor: SECONDARY_COLOUR.withOpacity(1),
          activeTrackColor: PRIMARY_COLOUR,
          inactiveTrackColor: SECONDARY_COLOUR.withOpacity(1),
          rangeTrackShape: RoundedRectRangeSliderTrackShape(),
          trackHeight: 6.0,
          thumbColor: PRIMARY_COLOUR,
          rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 8.0),
          overlayColor: SECONDARY_COLOUR.withOpacity(0.5),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
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