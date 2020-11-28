import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:fisheller_app/models/seafood_type.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Selling_Card extends StatelessWidget {
  final Sell sell;
  final Function press;
  final Color color, textColor;
  final double percentage_width;
  final String type;
  const Selling_Card({
    Key key,
    this.sell,
    this.press,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double s = type.contains("feed") ? 350 : 300;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: s,
      width: size.width * percentage_width,
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            //Image_Box(seafood: sell.seafood),
            Info_Box(sell: sell, type: type),
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WHITE_COLOUR,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 0), // changes position of shadow
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
  final String type;
  const Info_Box({
    Key key,
    this.sell,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: size.width * 0.8,
      //color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Title_Tags_Box(seafood: sell.seafood),
          if (type.contains("feed")) MarketInfo(sell: sell),
          Numbers_Box(
            seafood: sell.seafood,
          ),
          Vendor_Box(
            vendor: sell.vendor,
          ),
          if (type.contains("feed")) DrawStars(vendor: sell.vendor)
        ],
      ),
    );
  }
}

class MarketInfo extends StatelessWidget {
  final Sell sell;
  const MarketInfo({
    Key key,
    this.sell,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Market: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            sell.marketName,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

class DrawStars extends StatelessWidget {
  final Vendor vendor;
  const DrawStars({
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RatingBar.builder(
            initialRating: vendor.getRating().toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
            ignoreGestures: true,
            itemSize: 25.0,
          ),
        ],
      ),
    );
  }
}

class Title_Tags_Box extends StatelessWidget {
  final Seafood seafood;
  const Title_Tags_Box({Key key, this.seafood}) : super(key: key);
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
          SizedBox(width: 10, height: 5),
          for (var tag in seafood.tags) Tag_Box(tag: tag.name),
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
      margin: EdgeInsets.symmetric(horizontal: 6),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          child: Text(
            tag,
            style: TextStyle(color: WHITE_COLOUR),
          ),
          color: PRIMARY_COLOUR,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        ),
      ),
    );
  }
}

class Title_Box extends StatelessWidget {
  final String title;
  static const TextStyle textStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 30);
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
            style: textStyle,
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
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: TextDirection.ltr)
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Number_Info_Box(
            number: seafood.price,
            text: "Price\n(€ / Kg)",
            sz: Size(75, 75),
            space: 15.0,
          ),
          Equivalent_Box(seafood: seafood),
        ],
      ),
    );
  }
}

class Number_Info_Box extends StatelessWidget {
  final num number;
  final String text;
  final Size sz;
  final num space;
  const Number_Info_Box(
      {Key key, this.number, this.text, this.sz, this.space, thi})
      : super(key: key);
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
            circle_size: sz,
          ),
          Container(
            margin: EdgeInsets.only(top: space / 2),
            child: Text(
              text,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

class Equivalent_Box extends StatelessWidget {
  final Seafood seafood;
  const Equivalent_Box({
    Key key,
    this.seafood,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Number_Info_Box(
            number: seafood.quantityUnits,
            text: "Quantity\n(Unit.)",
            sz: Size(60, 60),
            space: 35.0,
          ),
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              padding: EdgeInsets.only(bottom: 50),
              child: Image.asset("assets/icons/double-arrow.png", width: 20,),),
          Number_Info_Box(
            number: seafood.quantityMass,
            text: "Quantity\n(Kg.)",
            sz: Size(60, 60),
            space: 35.0,
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
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 50,
            height: 50,
            child: Container(
              //color: Colors.black38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    width: 3, color: Colors.black, style: BorderStyle.solid),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset(vendor.profile).image,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 10,
          ),
          Text(
            vendor.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class Number_Circle extends StatelessWidget {
  final num arcWidth;
  final Size circle_size;
  static const Size s = Size(200, 200);
  final String text;

  const Number_Circle({
    Key key,
    this.text,
    this.arcWidth,
    this.circle_size = s,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      width: circle_size.width,
      height: circle_size.height,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 30 - (circle_size.width / s.width) * 30,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
            width: 6, color: PRIMARY_COLOUR, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

/*class Number_Circle extends StatelessWidget {
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
              defaultRenderer: charts.ArcRendererConfig(arcWidth: (10 - (circle_size.width / s.width) * 10).round()),
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
}*/
