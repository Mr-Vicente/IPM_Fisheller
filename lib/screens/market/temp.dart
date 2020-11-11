import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

class Temp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body()
      );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
        height: size.height,
        width: double.infinity,
        color: WHITE_COLOUR,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  for ( var sell in fixeFixe_market.items )
                    Selling_Card(
                      sell: sell,
                      press: (){return null;},
                    ),
                ]
            )
        )
    );
  }
}

/*
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
        height: size.height,
        width: double.infinity,
        color: WHITE_COLOUR,
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  carousel()
                ]
            )
        )
    );
  }
}


class carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 300.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: Colors.amber
                    ),
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),),
                  )
                )
            );
          },
        );
      }).toList(),
    );
  }
}*/