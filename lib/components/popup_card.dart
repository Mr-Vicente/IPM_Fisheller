import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:fisheller_app/models/vendor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sprintf/sprintf.dart';
import 'package:fisheller_app/models/seafood_type.dart';

class PopUpCard extends StatelessWidget {
  final Order order;
  final Color color, textColor;
  final double percentage_width;
  final int popupType;
  const PopUpCard({
    Key key,
    this.order,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
    this.popupType = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    switch (popupType) {
      case 0:
        return InfoPopUp(
            order: order,
            question: TEXT_QUESTION_COMFIRM,
            textNote: TEXT_NOTE_COMFIRM);
      case 1:
        return InfoPopUp(
            order: order,
            question: TEXT_QUESTION_CANCEL,
            textNote: TEXT_NOTE_CANCEL);
      case 2:
        return PayPopUp(order: order,);
      case 3:
        return ReviewPopUp(order: order,);
    }
  }
}

class InfoPopUp extends StatelessWidget {
  final double percentage_width;
  final Order order;
  final String question;
  final String textNote;
  const InfoPopUp({
    Key key,
    this.order,
    this.question,
    this.textNote,
    this.percentage_width = 0.9,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Container(
        height: 200,
        width: size.width * percentage_width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                question,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                sprintf(textNote, [order.deposit]),
                style: TextStyle(
                    fontSize: 11,
                    color: SALMON_COLOUR,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      color: PRIMARY_COLOUR,
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 10,
                            color: WHITE_COLOUR),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    RaisedButton(
                      color: SALMON_COLOUR,
                      child: Text(
                        "back",
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 10,
                            color: WHITE_COLOUR),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class PayPopUp extends StatelessWidget {
  final Order order;
  final double percentage_width;
  const PayPopUp({
    Key key,
    this.order,
    this.percentage_width = 0.9,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
      content: Container(
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
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black87,
                    fontWeight: FontWeight.w900),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                sprintf(FINALISE_SEAFOOD, [order.sell.seafood.type.name]),
                style: TextStyle(
                    fontSize: 15,
                    color: PRIMARY_COLOUR,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                sprintf(FINALISE_Quantity, [order.quantity]),
                style: TextStyle(
                    fontSize: 15,
                    color: PRIMARY_COLOUR,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                sprintf(FINALISE_Weight, [order.getWeight()]),
                style: TextStyle(
                    fontSize: 15,
                    color: PRIMARY_COLOUR,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                sprintf(FINALISE_TOTAL, [order.getTotalPrice()]),
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                      color: PRIMARY_COLOUR,
                      child: Text(
                        "Buy",
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 10,
                            color: WHITE_COLOUR),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return PopUpCard(order:order,percentage_width: 0.8,popupType:3);
                          },
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    RaisedButton(
                      color: SALMON_COLOUR,
                      child: Text(
                        "Back",
                        style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 10,
                            color: WHITE_COLOUR),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]),
            ),
            //Image_Box(seafood: sell.seafood),
            //Info_Box(sell: sell,type: type),
          ],
        ),
      ),
    );
  }
}

class ReviewPopUp extends StatefulWidget {
  final Order order;
  ReviewPopUp({
    Key key,
    this.order
  });
  _ReviewPopUp createState() => _ReviewPopUp(order: order);
}

class _ReviewPopUp extends State<ReviewPopUp> {
  final Order order;
  bool showFollowing = false;
  String followingText = "Follow";
  String followingImageName = "assets/icons/follow_icon.png";
  bool isFollowing = false;
  _ReviewPopUp({
    Key key,
    this.order,
  });

  void _toggleFollowingInfo(){
    if(isFollowing) {
      followingText = "Following";
      followingImageName = "assets/icons/following_icon.png";
    }else{
      followingText = "Follow";
      followingImageName = "assets/icons/follow_icon.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double percentage_width = 0.8;
    // This size provide us total height and width of our screen
    return AlertDialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)),
    content: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: showFollowing ? 270 : 220,
      width: size.width * percentage_width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Review Vendor",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Vendor_Box(vendor: julio),
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
                  print(rating);
                  setState(() {
                    if(rating >= 4.0) {
                      showFollowing = true;
                    }else{
                      showFollowing = false;
                      isFollowing = false;
                      _toggleFollowingInfo();
                    }
                  });
            },
            itemSize: 25.0,
          ),
          if(showFollowing == true)
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 150,
              height: 40,
              child: RaisedButton(
                color: WHITE_COLOUR,
                child: Row(
              children: <Widget>[
                  Image.asset(
                    followingImageName,
                    width: 25,
                  ),
                  SizedBox(width: 18,),
                  Text(
                    followingText,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        color: Colors.black87),
                  ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing;
                    _toggleFollowingInfo();
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                
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
            ),
          Container(
            margin: EdgeInsets.only(top: 25.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: PRIMARY_COLOUR,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 10,
                          color: WHITE_COLOUR),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  RaisedButton(
                    color: SALMON_COLOUR,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 10,
                          color: WHITE_COLOUR),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ]),
          ),
        ],
      ),
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
          SizedBox(
            height: 50,
            width: 10,
          ),
          Text(
            vendor.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
