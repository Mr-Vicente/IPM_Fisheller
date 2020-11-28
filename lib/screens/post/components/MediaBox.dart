import 'dart:io';

import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:image_picker/image_picker.dart';

class MediaBox extends StatefulWidget {
  final Size mediaSize;
  final Color fillColor;
  final Color borderColor;

  File _image;
  final picker = ImagePicker();



  MediaBox({Key key, this.mediaSize, this.fillColor, this.borderColor})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MediaBoxState();
  }
}

class _MediaBoxState extends State<MediaBox> {
  
  void _getMedia() async {
    final pickedFile = await widget.picker.getImage(source: ImageSource.gallery);
    
    setState(() {
      if (pickedFile != null) {
        print('whatttt'+pickedFile.path);
        widget._image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext build) {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: widget.mediaSize.width,
            height: widget.mediaSize.height,
            child: Center(
              child: widget._image == null
                  ? Container()
                  : Image.file(widget._image),
            ),
            decoration: BoxDecoration(
              color: widget.fillColor,
              border: Border.all(
                color: widget.borderColor,
              ),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
        ),
        Positioned(
          top: widget.mediaSize.height* 0.75,
          left: widget.mediaSize.width*1.05,
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey[600],
                  blurRadius: 5,
                )
              ],
            ),
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: _getMedia,
                tooltip: 'Increment',
                child: Icon(
                  Icons.add,
                  size: 50,
                ),
                elevation: 3.0,
                backgroundColor: PRIMARY_COLOUR,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
