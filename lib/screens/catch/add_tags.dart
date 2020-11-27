import 'package:fisheller_app/constants.dart';
import 'package:fisheller_app/models/Tag.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TagSelectionPopUp extends StatefulWidget{
  List<String> currentSelected;
  TagSelectionPopUpState state;

  TagSelectionPopUp(this.currentSelected);

  @override
  TagSelectionPopUpState createState() => (state= TagSelectionPopUpState(currentSelected));

  TagSelectionPopUpState getState(){
    return state;
  }
}

class TagSelectionPopUpState extends State<TagSelectionPopUp>{
  List<String> currentSelected;

  List<TagOption> tags = [];

  TagSelectionPopUpState(this.currentSelected);



  Widget _getListItemTile(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(!tags[index].isSelected){
            tags[index].isSelected = true;
            currentSelected.add(tags[index].data);
          }
          else{
            tags[index].isSelected = false;
            currentSelected.remove(tags[index].data);
          }
        });
      },

      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    tags[index].isSelected ?
                    Icons.check_box_outlined : Icons.check_box_outline_blank,
                    color: tags[index].isSelected ?
                    PRIMARY_COLOUR : Colors.black12,
                  ),
                  SizedBox(width: 5),
                  Text(
                      tags[index].data,
                      style: TextStyle(
                          color: tags[index].isSelected ?
                          PRIMARY_COLOUR : Colors.black26,
                          fontWeight: tags[index].isSelected ?
                          FontWeight.w600: FontWeight.normal
                      )
                  ),

                ]
            )
        ),
      ),
    );
  }

  void _addOptions(){
    Tag.values.forEach((t) {
      tags.add(TagOption(t.name));
    });
  }


  @override
  void initState() {
    super.initState();
    _addOptions();
    for(TagOption t in tags){
      if(currentSelected.contains(t.data)){
        t.isSelected = true;
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return AlertDialog(
        content: Container(
            height:380,
            width: 600,
            child:Stack(
                children: <Widget>[
                  Scaffold(
                      backgroundColor: Colors.white,
                      body: Stack(
                          children: <Widget>[
                            Text('Select Tags:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
                            Padding(
                                padding: EdgeInsets.only(top: 30.0),
                                child:
                                ListView.builder(
                                  itemCount: tags.length,
                                  itemBuilder: _getListItemTile,
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 170, top: 340.0),
                                child:
                                FlatButton(
                                  color: PRIMARY_COLOUR,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text('Done', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Colors.white)),
                                  onPressed: ((){
                                    Navigator.pop(context);
                                  }),
                                ))
                          ]
                      )
                  )
                ]
            )
        )
    );
  }
}

class TagOption{
  bool isSelected = false; //Selection property to highlight or not
  String data;
  TagOption(this.data);
}

class TagsButtons extends StatefulWidget{

  List<String> currentTags;

  TagsButtons({this.currentTags});



  @override
  State<StatefulWidget> createState() =>
      TagsButtonsState(currentTags: currentTags);

}

class TagsButtonsState extends State<TagsButtons>{
  List<String> currentTags;
  TagSelectionPopUp tag;

  TagsButtonsState({this.currentTags});


  List<Widget> _getTags(){
    List<Widget> temp = [];
    for(String t in currentTags){
      temp.add(
          FlatButton(
              child:
              Container(
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOUR,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 1,
                        ),
                      ]
                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                      child: Text(t, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12))
                  )
              )
          )
      );
    }
    temp.add(_getAdd());

    return temp;
  }


  Widget _getAdd(){
    return FlatButton(
      child: Container(
          decoration: BoxDecoration(
              color: PRIMARY_COLOUR,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 1,
                ),
              ]
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text('+', style: TextStyle(color: Colors.white, fontSize: 30))
          )
      ),
      onPressed: ((){
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return tag;
            }).whenComplete((){
          setState(() {
            currentTags = tag.getState().currentSelected;
            tag = TagSelectionPopUp(currentTags);
          });
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    if(currentTags == null)
      currentTags = [];
    tag = TagSelectionPopUp(currentTags);
    return
      Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        alignment: WrapAlignment.start,
        children: _getTags()
      );

  }

}