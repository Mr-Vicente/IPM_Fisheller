import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/models/recipies.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/models/fish_and_tips.dart';
import 'package:fisheller_app/models/seafood_type.dart';

import '../../constants.dart';

class FishAndTips extends StatelessWidget {
  final Size circleSize = Size(115, 115);
  final FishNTips seafood;
  List<Widget> nutritional = <Widget>[];
  List<Widget> facts = <Widget>[];
  List<Widget> recipies = <Widget>[];

  FishAndTips(this.seafood);

  void _back(){

  }

  List<Widget> _nutritional(){
    for(String n in seafood.nutritional){
      nutritional.add(Nutritional(label: n));
    }
    return nutritional;
  }

  List<Widget> _facts(){
    for(String n in seafood.funfacts){
      facts.add(FunFacts(fact: n));
    }
    return facts;
  }

  List<Widget> _recipies(){
    for(Recipe n in seafood.recipies){
      recipies.add(InfoBox(recipe: n));
    }
    return recipies;
  }

  Widget _screen(Size size){
    return Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(seafood.type.name, style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, color: Colors.black)),
                            SizedBox(width: 5),
                            Text('For aprox. ' + seafood.avrgWeight.toStringAsFixed(0) + 'g', style: TextStyle(fontSize: 15, color: Colors.black)),
                          ]
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          NumberCircle(text: seafood.kcal.toStringAsFixed(1), circleSize: circleSize, circleColor: Colors.black12, label:'Kcal'),
                          SizedBox(width: 5),
                          NumberCircle(text: seafood.fat.toStringAsFixed(1), circleSize: circleSize, circleColor: Colors.black26, label: 'Fat(g)'),
                          SizedBox(width: 5),
                          NumberCircle(text: seafood.protein.toStringAsFixed(1), circleSize: circleSize, circleColor: Colors.black54, label: 'Protein(g)')
                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20.0, top:20),
                      child: Wrap(
                          runSpacing: 10.0,
                          spacing: 10.0,
                          children: _nutritional()
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top:20),
                    child: Text('Fun Facts', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20.0, top:20),
                      child: Wrap(
                          runSpacing: 10.0,
                          spacing: 10.0,
                          children: _facts()
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top:20),
                    child: Text('Suggestions/Recipes', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20.0, top:20),
                      child: Wrap(
                          alignment: WrapAlignment.start,
                          runSpacing: 10.0,
                          spacing: 5.0,
                          children:_recipies()
                      )
                  ),
                  SizedBox(height: 5),
                ]
            )
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Back(body: _screen(size),current: Text("tips"),);
  }
}

class NumberCircle extends StatelessWidget {
  final num arcWidth;
  final Size circleSize;
  static const Size s = Size(200, 200);
  final String text;
  final circleColor;
  final String label;

  const NumberCircle({
    this.text,
    this.arcWidth,
    this.circleSize = s,
    this.circleColor,
    this.label
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: circleSize.width,
          height: circleSize.height,
          child:Center(
            child: Text(text, style: TextStyle(fontFamily: 'RobotoMono', fontSize: 30))
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 10,color: circleColor,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
      ]
    );
  }
}

class Nutritional extends StatelessWidget{
  final String label;
  final TextStyle style = const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);

  const Nutritional({
    this.label
  });

  Size _textSize() {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: label, style: style), maxLines: 1, textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: _textSize().width + 20,
      child: Center(
        child: Text(label, style: style, maxLines: 1)),
      decoration: BoxDecoration(
        color: PRIMARY_COLOUR,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class FunFacts extends StatelessWidget{
  final String fact;
  final TextStyle style = const TextStyle( fontSize: 16, fontWeight: FontWeight.w600);

  const FunFacts({
    this.fact
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 80.0,
      width: size.width,
      child: Row(
        children:  <Widget>[
          Icon(Icons.fiber_manual_record, size: 25 ),
          SizedBox(width: 5),
          Flexible(
              child: Text(fact, style: style)
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: -15,
            blurRadius: 11,
            offset: Offset(0, -13), // changes position of shadow
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: -15,
            blurRadius: 11,
            offset: Offset(0, 13), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

class InfoBox extends StatelessWidget{
  final Recipe recipe;
  const InfoBox({
    this.recipe
  });

  _launchURL() async {
    if (await canLaunch(recipe.link)) {
      await launch(recipe.link);
    } else {
      throw 'Could not launch ' + recipe.link;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return GestureDetector(
        onTap: (){
          _launchURL();
        },
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: size.width * 0.40,
            width: size.width * 0.42,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 0,
                    blurRadius: 11,
                    offset: Offset(0, 0),
                  ),
                ]
            ),
            //color: Colors.black38,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Container(
                        height: size.width * 0.2,
                        width: size.width * 0.35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(recipe.image),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5),
                      child:Text(recipe.title, style: TextStyle(fontWeight: FontWeight.w900) )
                  )
                ],
              ),
            )
        )
    );
  }
}