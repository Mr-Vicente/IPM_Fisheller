import 'package:fisheller_app/models/seafood.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/models/seafood_type.dart';

import '../../constants.dart';
import 'components/select_quantity.dart';



class BookFish extends StatelessWidget {
  final Seafood seafood;
  final String market;
  const BookFish(this.seafood, this.market);

  void _back(){

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: size.width,
            leading:
            FlatButton.icon(
              icon: Icon(Icons.arrow_back_ios_rounded, size: 25),
              label: new Text('back', style: TextStyle(fontSize:20, fontWeight: FontWeight.w600)),
              onPressed: _back,
            )
        ),
        body: Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(seafood.type.name, style: TextStyle(fontSize: 55, fontWeight: FontWeight.w900)),
                      Text(market, style: TextStyle(fontSize: 15)),
                      SizedBox(height:30),
                      BookBox(seafood)

                    ]
                )
            )
        )
    );
  }
}

class BookBox extends StatelessWidget{
  final Seafood seafood;
  const BookBox(this.seafood);

  void _book(){

  }

  void _paymentOptions(){

  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return
      Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          height: size.height*0.75,
          width: size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 11,
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
                    padding: EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: size.width * 0.5,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(seafood.media.first),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 5,
                            ),
                          ]
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Quantity(seafood)
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 70,
                      width: size.width * 0.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 1,
                            ),
                          ]
                      ),
                      child:
                        FlatButton(
                          color: PRIMARY_COLOUR,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Text('Book', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: Colors.white)),
                          onPressed: _book,
                        )
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Select payment method:', style: TextStyle(fontSize: 15)),
                      FlatButton(
                        child: Text('PayPal', style: TextStyle(fontSize: 15, color: PRIMARY_COLOUR)),
                        onPressed: _paymentOptions,
                      )
                    ]
                  ),

                )
              ],
            ),
          )
  );
  }
}




