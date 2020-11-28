import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/feed/components/background.dart';
import 'package:fisheller_app/screens/fish_description/stage1_description.dart';
import 'package:flutter/material.dart';

class FeedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var market in markets)
              for (var sell in market.items)
                Selling_Card(
                  sell: sell,
                  type: "feed",
                  press: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Stage1Description(sell)));
                  },
                )
          ],
        ),
      ),
    );
  }
}
