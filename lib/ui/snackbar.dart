import 'package:flutter/material.dart';

class CustomSnackBar {

  CustomSnackBar._();
  CustomSnackBar({this.context, this.content, this.height, this.duration, this.alignment});

  double _defaultHeight = 28;
  int _defaultDuration = 3;
  Alignment _defaultAlign = Alignment.center;

  BuildContext context;
  String content;
  double height;
  Duration duration;
  Alignment alignment;

  show(){
    Scaffold.of(context).showSnackBar(
        SnackBar(
            duration: duration?? Duration(seconds: _defaultDuration),
            content: Container(
              height: height??_defaultHeight,
              alignment: alignment?? _defaultAlign,
              child: Text(content),
            )
        )
    );
  }
}
