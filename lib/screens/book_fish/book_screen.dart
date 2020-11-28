import 'package:fisheller_app/components/back.dart';
import 'package:fisheller_app/components/home.dart';
import 'package:fisheller_app/components/popup_card.dart';
import 'package:fisheller_app/components/preferences.dart';
import 'package:fisheller_app/models/order.dart';
import 'package:fisheller_app/models/seafood.dart';
import 'package:fisheller_app/models/sell.dart';
import 'package:flutter/material.dart';
import 'package:fisheller_app/models/seafood_type.dart';

import '../../constants.dart';
import 'components/payment_selection.dart';
import 'components/select_quantity.dart';



class BookFish extends StatelessWidget {
  final Sell sell;
  const BookFish(this.sell);

  Widget _screen(Size size) {
    return Container(
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(sell.seafood.type.name, style: TextStyle(fontSize: 55, fontWeight: FontWeight.w900)),
                  Text(sell.marketName, style: TextStyle(fontSize: 15)),
                  SizedBox(height:30),
                  BookBox(sell: sell),
                  SizedBox(height:10),
                ]
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Back(body: _screen(size));
  }
}

class BookBox extends StatelessWidget{
  final Sell sell;

  BookBox({
    this.sell,
  });

  void _book(BuildContext context, Order order){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopUpCard(order:order,percentage_width: 0.8,popupType:0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // This size provide us total height and width of our screen
    return
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
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
                            image: AssetImage(sell.seafood.media.first),
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
                  child: Quantity(sell.seafood)
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
                          onPressed: (){
                             getCurrentUserObject().then((currentUser) {
                               _book(context,
                                   new Order(
                                       sell: sell,
                                       consumer: currentUser,
                                       vendor: sell.vendor,
                                       deposit: 5,
                                       quantity: 10.0,
                                       isUnits: false)
                               );
                             });
                            },
                        )
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25 , top: 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Selected payment method:', style: TextStyle(fontSize: 13)),
                      PaymentMethodButton('PayPal')

                    ]
                  ),

                )
              ],
            ),
          )
  );
  }
}




