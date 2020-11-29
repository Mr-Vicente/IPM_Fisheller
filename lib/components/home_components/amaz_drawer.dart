import 'package:fisheller_app/screens/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class AmazDrawerItem {
  AmazDrawerItem(
      {this.iconData,
      this.imageName,
      this.iconSize,
      this.title,
      this.text: 'default',
      this.textSize: 30.0});
  IconData iconData;
  String imageName;
  double iconSize;
  String title;
  String text;
  double textSize;
}

class AmazDrawer extends StatefulWidget {
  AmazDrawer({
    this.items,
    this.topPosition: 50.0,
    this.rightPosition: 0,
    this.height: 100.0,
    this.width: 200.0,
    this.distance: 10.0,
    //this.icon,
    //this.imageName,
    //this.iconSize,
    //this.text,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.elevation: 16.0,
  }) {}
  final List<AmazDrawerItem> items;
  double topPosition;
  double rightPosition;
  double height;
  double width;
  double distance;
  //final IconData icon;
  //final double iconSize;
  //final String imageName;
  //final String text;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  double elevation;

  @override
  State<StatefulWidget> createState() => AmazDrawerState();
}

class AmazDrawerState extends State<AmazDrawer> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildDrawerItem(
        item: widget.items[index],
        index: index,
      );
    });

    return Stack(children: items);
  }

  Widget _buildDrawerItem({
    AmazDrawerItem item,
    int index,
  }) {
    var header;
    if (item.title != null) {
      header = DrawerHeader(
        child: Text(item.title),
        decoration: BoxDecoration(
          color: Colors.teal,
        ),
      );
    }
    var icon;
    if (item.iconData != null) {
      icon = Icon(
        item.iconData,
        size: item.iconSize,
      );
    } else
      icon = Image.asset(item.imageName, height: item.iconSize);

    return Positioned(
        top: widget.topPosition + index * (widget.height + widget.distance),
        right: widget.rightPosition,
        child: Row(
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              color: widget.backgroundColor,
              child: ClipRRect(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20.0), right: Radius.circular(20.0)),
                child: Drawer(
                  elevation: widget.elevation,
                  child: Row(children: [
                    Expanded(
                      child: ListTile(
                        title: Text(
                          item.text,
                          style: TextStyle(
                            fontSize: item.textSize,
                            color: widget.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {
                          redirectScreen(index);
                        },
                      ),
                    ),
                    SizedBox(width: item.iconSize + 20, child: icon),
                  ]),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ));
  }

  void redirectScreen(int index) {
    if (index == 0) {
      Navigator.pop(context);
    }
    if (index == 1) {
      Navigator.pop(context);
    }
    if (index == 2) {
      Navigator.pop(context);
    }
    if (index == 3) {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    }
  }
}
