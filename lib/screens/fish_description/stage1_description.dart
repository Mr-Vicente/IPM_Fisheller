import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/home.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/fish_and_tips.dart';
import 'package:fisheller_app/models/seafood.dart';
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

//list of images from fish




class Stage1Description extends StatefulWidget {

  final Sell description;

  Stage1Description(this.description);

  @override
  _Stage1Description createState() => _Stage1Description(description);
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  Seafood seafood;

  CarouselWithIndicatorDemo(this.seafood);
  
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState(seafood);
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {

  List<Widget> imageSliders;
  int _current = 0;

  Seafood seafood;

  _CarouselWithIndicatorState(this.seafood);

  void _getImageSlider(){
    imageSliders = seafood.media.map((item) => Container(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item, fit: BoxFit.cover, width: 1000.0),
              ],
            )
        ),
      ),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {

    _getImageSlider();

    return Column(
        children: [
          CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: seafood.media.map((url) {
              int index = seafood.media.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                ),
              );
            }).toList(),
          ),
        ]
    );

  }
}

class _Stage1Description extends State<Stage1Description> {

  final Sell description;

  _Stage1Description(this.description);


  Widget _screen(Size size){
    return Container(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CarouselWithIndicatorDemo(description.seafood),
                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                  child:Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            description.seafood.type.name,
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900)
                        ),
                        SizedBox(width: 10.0),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Text(
                              description.marketName
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2, bottom: 8.0),
                          child:  Image(
                            image:AssetImage('assets/icons/pin_marker_unfilled.png'
                            ),
                            height: 20.0,
                            width: 20.0,
                          ),
                        )
                      ]
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child:Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            width: 40,
                            height: 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Container(
                                //color: Colors.black38,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 10,color: Colors.black38,style: BorderStyle.solid),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(description.vendor.profile),
                                  ),
                                ),
                              ),
                            )
                        ),

                        Text(
                          description.vendor.name,
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 12.0),
                        FlatButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FishAndTips(seafoodTips[description.seafood.type])),
                              );},
                            child: Stack(
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(left: 30.0, top: 5),
                                      child:

                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.3),
                                                  spreadRadius: 0,
                                                  blurRadius: 5,
                                                ),
                                              ]
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.only(left: 20.0 , right: 5.0, top: 6.0, bottom: 6.0),
                                              child: Text(
                                                "Fish and Tips",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              )
                                          )
                                      )),
                                  Container(
                                    height: 40,
                                    width: 40,
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
                                    child: Image(
                                      image:AssetImage('assets/icons/icon_fish_and_tips.png'
                                      ),
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  )
                                ]
                            )
                        )
                      ]),
                ),
                SizedBox(height: 20.0,),
                Container(
                  width: size.width*0.8,
                  child: Text(
                    description.seafood.description,
                    textAlign: TextAlign.justify,
                  ),
                ),

                SizedBox(height: 30.0,),
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              height: 100.0,
                              child:Center(
                                  child: Text(description.seafood.price.toString(), style: TextStyle(fontFamily: 'RobotoMono', fontSize: 45))
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 10.0,color: Colors.teal,style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text("Price (Euro/KG)", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                          ]
                      ),
                      SizedBox(width: 20.0),
                      Column(
                          children: <Widget>[
                            Container(
                              width: 70.0,
                              height: 70.0,
                              child:Center(
                                  child: Text(description.seafood.quantityUnits.toString(), style: TextStyle(fontFamily: 'RobotoMono', fontSize: 25))
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 7.0,color: Colors.teal,style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text("Quantity (Unit.)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                          ]
                      ),
                      SizedBox(width: 5.0),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5,),
                        padding: EdgeInsets.only(bottom: 17),
                        child: Image.asset("assets/icons/double-arrow.png", width: 20,),
                      ),
                      SizedBox(width: 5.0),
                      Column(
                          children: <Widget>[
                            Container(
                              width: 70.0,
                              height: 70.0,
                              child:Center(
                                  child: Text(description.seafood.quantityMass.toString(), style: TextStyle(fontFamily: 'RobotoMono', fontSize: 25))
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(width: 7.0,color: Colors.teal,style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text("Quantity (KG)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                          ]
                      ),

                    ]
                ),
                SizedBox(height: 30.0,),
                Align(
                  alignment: Alignment(-0.75,-0.4),
                  child: Text(
                    'Tags',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                  child:Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for ( var tag in description.seafood.tagsToString() )
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                color: Colors.teal,
                                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                              ),
                            ),
                          ),
                      ]
                  ),
                ),
                SizedBox(height: 30.0,),

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: _bookButton(),
            )
          )
        ]
      )

    );
  }

  Widget _bookButton(){
    return FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BookFish(description)
              ),//stage2description
            );
          },
          child: Stack(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 35.0),
                    child:
                    Container(
                      height: 74.0,
                      width: 120,
                      decoration: BoxDecoration(
                          color:PRIMARY_COLOUR,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 10,
                            ),
                          ]
                      ),

                    )),
                Container(
                  height: 74.0,
                  width: 74.0,
                  decoration: BoxDecoration(
                    color: PRIMARY_COLOUR,
                    border: Border.all(width: 5, color: PRIMARY_COLOUR, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(100),

                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 19.0),
                    child: Text(
                      "Book",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white),
                    )
                )
              ]
          )
      );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Back(body: _screen(size))
      ]
    );


  }

}