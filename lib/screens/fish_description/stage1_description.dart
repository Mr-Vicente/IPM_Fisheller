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

//list of images from fish
final List<String> imgList = [
  'assets/images/lobster.png',
  'assets/images/sea_bass.png',
  'assets/images/fish_market.png'
];

final List<Widget> imageSliders = imgList.map((item) => Container(
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

class Stage1Description extends StatefulWidget {

  final Sell description;

  Stage1Description(this.description);

  @override
  _Stage1Description createState() => _Stage1Description(description);
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
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
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselWithIndicatorDemo(),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                child:Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        description.seafood.type.name,
                        textScaleFactor: 2.0,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        description.market.name,
                        textScaleFactor: 1.0,
                      ),
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
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              //color: Colors.black38,
                              decoration: BoxDecoration(
                                border: Border.all(width: 10,color: Colors.black38,style: BorderStyle.solid),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.asset("assets/images/julio.png").image,
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
                      SizedBox(width: 40.0),
                      Container(
                        height: 50.0,
                        child: FloatingActionButton(
                          onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => FishAndTips(seafoodTips[description.seafood.type])),
                            );},//fish and tips
                          heroTag: "ht2",
                          backgroundColor: Colors.teal,
                          child: Image(
                            image:AssetImage('assets/icons/icon_fish_and_tips.png'
                            ),
                            height: 30.0,
                            width: 30.0,
                            ),
                          ),
                        ),
                      Text(
                        "Fish and Tips",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
              SizedBox(height: 20.0,),
              Align(
                alignment: Alignment(-0.75,-0.4),
                child: Text(
                  description.seafood.description,
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
                            width: 80.0,
                            height: 80.0,
                            child:Center(
                                child: Text(description.seafood.price.toString(), style: TextStyle(fontFamily: 'RobotoMono', fontSize: 35))
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 5.0,color: Colors.teal,style: BorderStyle.solid),
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
                            width: 50.0,
                            height: 50.0,
                            child:Center(
                                child: Text(description.seafood.quantityUnits.toString(), style: TextStyle(fontFamily: 'RobotoMono', fontSize: 20))
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 5.0,color: Colors.teal,style: BorderStyle.solid),
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
                        padding: EdgeInsets.only(bottom: 25),
                        child: Text("<->")),
                    SizedBox(width: 5.0),
                    Column(
                        children: <Widget>[
                          Container(
                            width: 50.0,
                            height: 50.0,
                            child:Center(
                                child: Text(description.seafood.quantityMass.toString(), style: TextStyle(fontFamily: 'RobotoMono', fontSize: 15))
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(width: 5.0,color: Colors.teal,style: BorderStyle.solid),
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
                  textScaleFactor: 1.5,
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
              SlideButton(
                onButtonOpened: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookFish(description.seafood, description.market.name)),//stage2description
                  );
                },
                height: 64.0,
                borderRadius: 36.0,
                backgroundColor: Colors.transparent,
                slidingChild: Center(
                  child: Text("Book",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                slidingBarColor: Colors.teal,
                slideDirection: SlideDirection.LEFT,
              ),
              SizedBox(height: 25.0,),

            ],
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