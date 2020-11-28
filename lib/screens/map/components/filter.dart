import 'package:fisheller_app/components/slider.dart';
import 'package:fisheller_app/models/filter_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/components/drop_down.dart';
import 'package:fisheller_app/screens/map/components/map.dart';

class FilterPopUp extends StatefulWidget{
  final Map map;

  const FilterPopUp(this.map);

  @override
  _FilterPopUpState createState() => _FilterPopUpState(this.map);
}

class _FilterPopUpState extends State<FilterPopUp>{

  final Map map;
  FilterModel model = FilterModel();
  DropDown categoryDD = DropDown('CATEGORY', CATEGORIES, 137, 40, PRIMARY_COLOUR, Colors.white, 13, null);
  DropDown seafoodDD = new DropDown('SEAFOOD', SEAFOODS, 120, 40, PRIMARY_COLOUR, Colors.white, 13, null);
  CustomRangeSlider priceSlider = CustomRangeSlider(max: 40, step: 1,);
  CustomRangeSlider quantitySlider = CustomRangeSlider(max: 10, step: 1,);

  _FilterPopUpState(this.map);


  void _applyStateFilter(){
    if(categoryDD.getState().getValue() == null)
      model.category = '';
    else
      model.category =  categoryDD.getState().getValue();
    if(seafoodDD.getState().getValue() ==  null)
      model.seafood = '';
    else
      model.seafood = seafoodDD.getState().getValue();
    model.minPrice = priceSlider.getState().getBottomValue();
    model.maxPrice = priceSlider.getState().getTopValue();
    model.minQuantity = quantitySlider.getState().getBottomValue();
    model.maxQuantity = quantitySlider.getState().getTopValue();

    map.getState().filterMarkers(model);
  }

  void _clearFilter(){
    map.getState().clearFilter();
  }


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        children: <Widget>[
          Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;

              return Container(
                height: height - 570,
                width: width,
              );
            },
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Filter',style: TextStyle(fontFamily: 'Raleway', fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                    FloatingActionButton(
                      child: Icon(Icons.clear_rounded, color: Colors.red,),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                      backgroundColor: Colors.white,
                      mini: true,
                      elevation: 0.0,
                    ),
                  ]
              ),
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    categoryDD,
                    seafoodDD
                  ]
              ),
              SizedBox(height: 20),
              Text('Price (€/Kg)', style: TextStyle(fontFamily: 'Raleway', fontSize: 18),),
              SizedBox(height: 10),
              priceSlider,
              SizedBox(height: 20),
              Text('Quantity (Kg)', style: TextStyle(fontFamily: 'Raleway', fontSize: 18),),
              SizedBox(height: 10),
              quantitySlider,
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 90.0,
                    height: 30.0,
                    child: RaisedButton(
                      elevation: 0.1,
                      color: Colors.white38,
                      child: Text("Clear Filters", style: TextStyle(fontFamily: 'Raleway', fontSize: 10, color: Colors.black),),
                      onPressed: () {
                        _clearFilter();
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: PRIMARY_COLOUR,
                      child: Text("Done", style: TextStyle(fontFamily: 'Raleway', fontSize: 20, color: Colors.white),),
                      onPressed: () {
                        _applyStateFilter();
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(
                Radius.circular(10.0))
        )
    );
  }
}

