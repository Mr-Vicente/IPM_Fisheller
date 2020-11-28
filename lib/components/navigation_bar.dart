import 'package:flutter/material.dart';
import 'package:fisheller_app/constants.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.imageName, this.text});
  IconData iconData;
  String imageName;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    this.items,
    //this.centerItemText,
    this.height: 60.0,
    this.iconSize: 30.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {}
  final List<FABBottomAppBarItem> items;
  //final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 2, _buildMiddleTabItem());
    items.insert(2, _buildDivider());
    items.insert(4, _buildDivider());
    return BottomAppBar(
      clipBehavior: Clip.none,
      shape: widget.notchedShape,
      notchMargin: 6,
      elevation: 10.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return SizedBox(
      height: widget.height,
      child: VerticalDivider(
        thickness: 1,
        width: 0,
        indent: 15,
        endIndent: 15,
        color: Colors.grey[400],
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    var icon;
    if (item.iconData != null) {
      icon = Icon(
        item.iconData,
        color: color,
        size: widget.iconSize,
      );
    } else
      icon = Column(children: <Widget>[
        Image.asset(
          item.imageName,
          color: color,
          height: widget.iconSize*0.73,
        ),
        SizedBox(height: widget.iconSize*0.13)
      ]);

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                icon,
                Text(
                  item.text,
                  style: TextStyle(color: color),
                ),
                SizedBox(
                  height: widget.iconSize*0.23,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
