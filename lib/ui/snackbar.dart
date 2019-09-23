import 'package:flutter/material.dart';

class CustomSnackBar {
  CustomSnackBar(
    this.content,
      {this.context,
      this.globalKey,
      this.height = 28,
      this.duration,
      this.alignment = Alignment.center});

  GlobalKey<ScaffoldState> globalKey;
  BuildContext context;
  String content;
  double height;
  Duration duration;
  Alignment alignment;

  show() {
    (context != null ? Scaffold.of(context) : globalKey.currentState)
        .showSnackBar(
      SnackBar(
        duration: duration ?? Duration(seconds: 3),
        content: Container(
          height: height,
          alignment: alignment,
          child: Text(content),
        ),
      ),
    );
  }
}
