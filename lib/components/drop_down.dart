import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String _dropdownLabel;
  final List<String> _dropDownItems;
  final double _width;
  final double _height;
  final Color _color;
  final Color _textColor;
  final double _fontSize;
  String _dropdownValue;

  DropDown(this._dropdownLabel, this._dropDownItems, this._width, this._height, this._color, this._textColor, this._fontSize, this._dropdownValue);

   _DropDownState state;
  @override
  _DropDownState createState() => (state = new _DropDownState(this._dropdownLabel, this._dropDownItems, this._width, this._height, this._color, this._textColor, this._fontSize, this._dropdownValue));

  _DropDownState getState(){
    return state;
  }
}

class _DropDownState extends State<DropDown> {
  String _dropdownLabel;
  List<String> _dropDownItems;
  double _width;
  double _height;
  Color _color;
  Color _textColor;
  double _fontSize;
  List<DropdownMenuItem<String>> _items;
  String _dropdownValue;

  _DropDownState(this._dropdownLabel,  this._dropDownItems, this._width, this._height, this._color, this._textColor, this._fontSize, this._dropdownValue);


  List<Widget> _selectedItem(String item){
    List<Widget> w = <Widget>[
      Text(item)];
    if(item != _dropdownValue)
      w.add(Icon(Icons.drag_handle, color: _textColor, size: _fontSize));
    return w;
  }


  List<DropdownMenuItem<String>> _updateItems(){
    DropdownMenuItem<String> selectedItem;
    List<DropdownMenuItem<String>> items = <DropdownMenuItem<String>>[];
    _dropDownItems.forEach((String value) {
      DropdownMenuItem<String> currentItem =  DropdownMenuItem(
          value: value,
          child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _selectedItem(value)
              )
          ));
      if(value == _dropdownValue){
        selectedItem = currentItem;
      }
      else{
        items.add(currentItem);
      }
    });
    if(selectedItem !=null)
      items.insert(0, selectedItem);
    return items;
  }

  String getValue(){
    return _dropdownValue;
  }

  @override
  Widget build(BuildContext context) {
    _items = _updateItems();
    return Container(
        height: _height,
        width: _width,
        decoration: BoxDecoration(
            color: _color,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(2.0))
        ),
        child: Padding(
            padding: EdgeInsets.only(left: 15, right:0),
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    value: _dropdownValue,
                    dropdownColor: _color,
                    icon: Icon(Icons.arrow_drop_down, color: _textColor, size: _fontSize),
                    hint: Text(_dropdownLabel, style:  TextStyle(color: _textColor, fontSize: _fontSize)),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: _textColor, fontSize: _fontSize, fontFamily: 'Raleway'),
                    onChanged: (String newValue) {
                      setState(() {
                        _dropdownValue = newValue;
                        _items = _updateItems();
                      });
                    },
                    items: _items
                )
            )
        )
    );
  }
}