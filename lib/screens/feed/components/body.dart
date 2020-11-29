import 'package:fisheller_app/components/Selling_Card.dart';
import 'package:fisheller_app/components/post_card.dart';
import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/screens/feed/components/background.dart';
import 'package:fisheller_app/screens/fish_description/stage1_description.dart';
import 'package:flutter/material.dart';

class FeedToggle extends StatefulWidget{
  @override
  FeedToggleState createState() => FeedToggleState();

}

class FeedToggleState extends State<FeedToggle>{
  FeedList food = FeedList(true);
  FeedList post = FeedList(false);
  List<bool> isSelected = [true,false];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black87,
              //border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ToggleButtons(
              children: <Widget>[
                Text("      Food      ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                Text("      Posts      ",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                });
              },
              isSelected: isSelected,
              borderRadius: BorderRadius.circular(10),
              fillColor: PRIMARY_COLOUR,
              selectedColor: WHITE_COLOUR,
              color: WHITE_COLOUR,
            )
        ),
        //food
        Padding(
            padding: EdgeInsets.only(top: 70),
            child: AnimatedCrossFade(
              duration: const Duration(microseconds: 1),
              firstChild: food,
              secondChild: post,
              crossFadeState: isSelected[0] ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            )
        ),
      ],
    );
  }

}


class FeedList extends StatefulWidget{
  bool isFood;

  FeedList(this.isFood);

  @override
  FeedListState createState() => FeedListState(isFood);

}

class FeedListState extends State<FeedList> {

  bool isFood;

  FeedListState(this.isFood);

  Widget _getFood() {
    return SingleChildScrollView(
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
                          builder: (context) =>
                              Stage1Description(sell, "feed")));
                },
              )
        ],
      ),
    );
  }

  Widget _getPosts() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for(var post in posts)
            PostCard(post: post,),
        ],
      ),
    );
  }


  Widget _getList() {
    if (isFood)
      return _getFood();
    else
      return _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SizedBox(
            height: size.height - 150,
            child: _getList()
    )
    );
  }
}