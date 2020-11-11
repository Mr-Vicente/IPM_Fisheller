import 'package:fisheller_app/components/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/components/drop_down.dart';

class FilterModel {
  String category;
  String seafood;
  double maxPrice;
  double minPrice;
  double minQuantity;
  double maxQuantity;

  FilterModel({this.category, this.seafood, this.maxPrice, this.minPrice, this.minQuantity, this.maxQuantity});
}



class FilterPopUp extends StatefulWidget{
  @override
  _FilterPopUpState createState() => _FilterPopUpState();

}

class _FilterPopUpState extends State<FilterPopUp>{


  FilterModel model = FilterModel();

  DropDown categoryDD = DropDown('CATEGORY', CATEGORIES, 137, 40, PRIMARY_COLOUR, Colors.white, 13);
  DropDown seafoodDD = new DropDown('SEAFOOD', SEAFOODS, 120, 40, PRIMARY_COLOUR, Colors.white, 13);
  CustomRangeSlider priceSlider = CustomRangeSlider(max: 40, step: 1,);
  CustomRangeSlider quantitySlider = CustomRangeSlider(max: 10, step: 1,);



  void _applyStateFilter(){
      model.category =  categoryDD.getState().getValue();
      model.seafood = seafoodDD.getState().getValue();
      model.minPrice = priceSlider.getState().getBottomValue();
      model.maxPrice = priceSlider.getState().getTopValue();
      model.minQuantity = quantitySlider.getState().getBottomValue();
      model.maxQuantity = quantitySlider.getState().getTopValue();

      print('{\n'+ model.category +
          '\n' + model.seafood +
          '\n' + model.minPrice.toString() +
          '\n' + model.maxPrice.toString()+
          '\n' + model.minQuantity.toString() +
          '\n' + model.maxQuantity.toString() +'\n}' );
      //TODO - apply filter to map markers
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
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

