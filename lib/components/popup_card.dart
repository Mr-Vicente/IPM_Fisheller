import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:flutter/material.dart';

class PopUpCard extends StatelessWidget {
  final Sell sell;
  final Function press;
  final Color color, textColor;
  final double percentage_width;
  final String textQuestion;
  final String textNote;
  const PopUpCard({
    Key key,
    this.sell,
    this.press,
    this.textNote,
    this.textQuestion,
    this.color = PRIMARY_COLOUR,
    this.textColor = Colors.white,
    this.percentage_width = 0.9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 200,
      width: size.width * percentage_width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          color: WHITE_COLOUR,
          onPressed: press,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                textQuestion,
                style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
              ),
              Text(
                textNote,
                style: TextStyle(fontSize: 12, color: SALMON_COLOUR, fontWeight: FontWeight.bold),
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    RaisedButton(
                        color: PRIMARY_COLOUR,
                        elevation: 0.1,
                        child: Text(
                          "Confirm",
                          style: TextStyle(fontFamily: 'Raleway', fontSize: 10, color: WHITE_COLOUR),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                    ),
                    RaisedButton(
                        elevation: 0.1,
                        color: SALMON_COLOUR,
                        child: Text(
                          "Back",
                          style: TextStyle(fontFamily: 'Raleway', fontSize: 10, color: WHITE_COLOUR),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                        ),
                    ),
                  ],
              ),
              //Image_Box(seafood: sell.seafood),
              //Info_Box(sell: sell,type: type),
            ],
          ),
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
    );
  }
}
