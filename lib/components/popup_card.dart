import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';

class PopUpCard extends StatelessWidget {
  final Sell sell;
  final Function press;
  final Color color, textColor;
  final double percentage_width;
  final int popupType;
  const PopUpCard({
    Key key,
    this.sell,
    this.press,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
    this.popupType = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    switch(popupType) {
      case 0:
        return InfoPopUp();
      case 1:
        return PayPopUp();
      case 2:
        return ReviewPopUp();
    };
  }
}

class InfoPopUp extends StatelessWidget {
  final Function press;
  final double percentage_width;
  const InfoPopUp({
    Key key,
    this.press,
    this.percentage_width = 0.9,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: size.width * percentage_width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              TEXT_QUESTION_COMFIRM,
              style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              sprintf(TEXT_NOTE_COMFIRM,[3]),
              style: TextStyle(fontSize: 11, color: SALMON_COLOUR, fontWeight: FontWeight.bold),
            ),
          ),
          createPopButtons(
              40.0,
              () {},
              "Confirm",
              () {},
              "Back"
          ),
          //Image_Box(seafood: sell.seafood),
          //Info_Box(sell: sell,type: type),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WHITE_COLOUR,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),

    );
  }
}

class PayPopUp extends StatelessWidget {
  final double percentage_width;
  const PayPopUp({
    Key key,
    this.percentage_width = 0.9,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      width: size.width * percentage_width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              FINALISE_BUY,
              style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              sprintf(FINALISE_SEAFOOD, ["Lobster"]),
              style: TextStyle(fontSize: 15, color: PRIMARY_COLOUR, fontWeight: FontWeight.bold),
            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              sprintf(FINALISE_Quantity, [2]),
              style: TextStyle(fontSize: 15, color: PRIMARY_COLOUR, fontWeight: FontWeight.bold),
            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              sprintf(FINALISE_Weight, [4.0]),
              style: TextStyle(fontSize: 15, color: PRIMARY_COLOUR, fontWeight: FontWeight.bold),
            ),

          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              sprintf(FINALISE_TOTAL,[120.0]),
              style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w800),
            ),
          ),
          createPopButtons(
              20.0,
                  () {},
              "Pay",
                  () {},
              "Back"
          ),
          //Image_Box(seafood: sell.seafood),
          //Info_Box(sell: sell,type: type),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WHITE_COLOUR,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),

    );
  }
}


class ReviewPopUp extends StatefulWidget {
  ReviewPopUp({
    Key key,
  });
  _ReviewPopUp createState() => _ReviewPopUp();
}

class _ReviewPopUp extends State<ReviewPopUp>{
  _ReviewPopUp({
    Key key,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double percentage_width = 0.8;
    // This size provide us total height and width of our screen
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 250,
      width: size.width * percentage_width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Review Vendor",
              style: TextStyle(fontSize: 25, color: Colors.black87, fontWeight: FontWeight.w900),
            ),
          ),
          Vendor_Box(vendor: julio),
          createPopButtons(
              20.0,
                  () {},
              "Pay",
                  () {},
              "Back"
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: WHITE_COLOUR,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),

    );
  }
}


Widget createPopButtons(double margin, Function pressActionLeft, String textLeft, Function pressActionRight, String textRight){
  return Container(
      margin: EdgeInsets.only(top: margin),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
                color: PRIMARY_COLOUR,
                elevation: 0.1,
                child: Text(
                    textLeft,
                    style: TextStyle(fontFamily: 'Raleway', fontSize: 10, color: WHITE_COLOUR),
                ),
                onPressed: pressActionLeft(),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                ),
            ),
            RaisedButton(
                elevation: 0.1,
                color: SALMON_COLOUR,
                child: Text(
                    textRight,
                    style: TextStyle(fontFamily: 'Raleway', fontSize: 10, color: WHITE_COLOUR),
                ),
                onPressed: pressActionRight(),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                ),
            ),
        ]
      ),
  );
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
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //vendor.image,
          Container(
            width: 30,
            height: 30,
            child: Container(
              //color: Colors.black38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                //border: Border.all(width: 10,color: Colors.black38,style: BorderStyle.solid),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset("assets/images/julio.png").image,
                ),
              ),
            ),
          ),
          SizedBox(height: 50,width: 10,),
          Text(
            vendor.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ],
      ),
    );
  }
}
