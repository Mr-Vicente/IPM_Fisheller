import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Selling_Card extends StatelessWidget {
  final Sell sell;
  final Function press;
  final Color color, textColor;
  final double percentage_width;
  const Selling_Card({
    Key key,
    this.sell,
    this.press,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      width: size.width * percentage_width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          color: WHITE_COLOUR,
          onPressed: press,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image_Box(seafood: sell.seafood),
              Info_Box(sell: sell,),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 20,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

class Image_Box extends StatelessWidget {
  final Seafood seafood;
  const Image_Box({
    Key key,
    this.seafood,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size.width * 0.3,
      child: Image.asset("assets/images/sea_bass.png"),

    );
  }
}

class Info_Box extends StatelessWidget {
  final Sell sell;
  const Info_Box({
    Key key,
    this.sell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size.width * 0.5,
      //color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Title_Tags_Box(seafood: sell.seafood),
          Numbers_Box(seafood: sell.seafood,),
          Vendor_Box(vendor: sell.vendor,),
        ],
      ),
    );
  }
}

class Title_Tags_Box extends StatelessWidget {
  final Seafood seafood;
  const Title_Tags_Box({
    Key key,
    this.seafood
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Title_Box(title: seafood.type.name),
          for ( var tag in seafood.tags)
            Tag_Box(tag:tag.name),
        ],
      ),
    );
  }
}

class Tag_Box extends StatelessWidget {
  final String tag;
  const Tag_Box({
    Key key,
    this.tag,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            child: Text(
              tag,
              style: TextStyle(
                color: WHITE_COLOUR
              ),
            ),
            color: PRIMARY_COLOUR,
            padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
        ),
      ),
    );
  }
}

class Title_Box extends StatelessWidget {
  final String title;
  static const TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20
  );
  const Title_Box({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          Container(
            width: _textSize(title, textStyle).width,
            height: 2,
            color: PRIMARY_COLOUR,
          )
        ],
      ),
    );
  }
}

Size _textSize(String text, TextStyle style) {
  final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
    ..layout(minWidth: 0, maxWidth: double.infinity);
  return textPainter.size;
}

class Numbers_Box extends StatelessWidget {
  final Seafood seafood;
  const Numbers_Box({
    Key key,
    this.seafood,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Number_Info_Box(number: seafood.price,text:"Price\n(€ / Kg)"),
          Number_Info_Box(number: seafood.quantityUnits,text:"Quantity\n(Unit.)"),
        ],
      ),
    );
  }
}

class Number_Info_Box extends StatelessWidget {
  final num number;
  final String text;
  const Number_Info_Box({
    Key key,
    this.number,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Number_Circle(
            text: number.toString(),
            circle_size: Size(90,90),
          ),
          Center(
            child:
              Text(
                text,
                textAlign: TextAlign.center,
              ),
          ),
        ],
      ),
    );
  }
}

class Vendor_Box extends StatelessWidget {
  final Vendor vendor;
  const Vendor_Box({
    Key key,
    this.vendor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //vendor.image,
          Container(
            width: 50,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                color: Colors.black38,
              ),
            )
          ),
          SizedBox(height: 50,width: 10,),
          Text(vendor.name),
        ],
      ),
    );
  }
}

class Number_Circle extends StatelessWidget {
  final List<charts.Series> seriesList;
  final charts.Color color;
  final num arcWidth;
  final Size circle_size;
  static const Size s = Size(200, 200);
  final String text;

  static List<charts.Series<num, String>> _createData(charts.Color c) {
    final data = [0];

    return [
      new charts.Series<num, String>(
        id: 'Fill',
        domainFn: (num n, _) => "",
        measureFn: (num n, _) => 100,
        data: data,
        colorFn: (num n, _) => c,
      )
    ];
  }
  const Number_Circle({
    Key key,
    this.text,
    this.seriesList,
    this.color = CHART_PRIMARY_COLOUR,
    this.arcWidth,
    this.circle_size = s,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      child:SizedBox(
        width: circle_size.width,
        height: circle_size.height,
        child: Stack(
          children: <Widget>[
            charts.PieChart(
              _createData(color),
              animate: true,
              animationDuration: Duration(milliseconds: 500),
              selectionModels: [
                new charts.SelectionModelConfig(
                  type: charts.SelectionModelType.info,
                  changedListener: null,
                )
              ],
              defaultRenderer: charts.ArcRendererConfig(arcWidth: (12 - (circle_size.width / s.width) * 12).round()),
            ),
            Center(
              child: Text(
                text,
                style:
                TextStyle(
                  fontSize: 30 - (circle_size.width / s.width) * 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

