import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping9/src/core/utils.dart';
import 'package:ping9/src/dialog/dialog_model.dart';
import 'dialog_service.dart';

class DialogWidget extends StatefulWidget {
  final Widget child;

  const DialogWidget({Key key, this.child}) : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final DialogService _dialogService = Get.find();

  @override
  void initState() {
    super.initState();
    _dialogService.showDialogListener = _showDialog;
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(DialogModel request) {
    showDialog(
        context: context,
        builder: (context) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: request.titleWidget ?? isNullOrEmpty(request.title)
                  ? null
                  : Text(request.title),
              content: request.bodyWidget ?? isNullOrEmpty(request.body)
                  ? null
                  : Text(request.body),
              actions: <Widget>[
                for (final item in request.actions ?? [])
                  CupertinoDialogAction(
                    child: Text(item.title),
                    onPressed: () {
                      _dialogService.pop();
                      item.onPressed?.call();
                    },
                  ),
              ],
            );
          }
          return AlertDialog(
            title: request.titleWidget ?? isNullOrEmpty(request.title)
                ? null
                : Text(request.title),
            content: request.bodyWidget ?? isNullOrEmpty(request.body)
                ? null
                : Text(request.body),
            actions: <Widget>[
              for (final item in request.actions ?? [])
                FlatButton(
                  child: Text(item.title),
                  onPressed: () {
                    _dialogService.pop();
                    item.onPressed?.call();
                  },
                ),
            ],
          );
        });
  }
}
