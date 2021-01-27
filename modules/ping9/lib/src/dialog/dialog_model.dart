import 'package:flutter/material.dart';

class DialogModel {
  final String title;
  final String body;
  final Widget titleWidget;
  final Widget bodyWidget;
  final List<DialogButton> actions;

  DialogModel({
    this.title,
    this.body,
    this.titleWidget,
    this.bodyWidget,
    this.actions,
  });
}

class DialogButton {
  final String title;
  final Function onPressed;
  DialogButton({this.title, this.onPressed});
}
