import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping9/src/dialog/dialog_model.dart';
import 'package:ping9/src/utility/utility.dart';

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
              title: isNullOrEmpty(request.title) ? null : Text(request.title),
              content: isNullOrEmpty(request.description)
                  ? null
                  : Text(request.description),
              actions: <Widget>[
                if (isNullOrEmpty(request.cancelTitle) == false)
                  CupertinoDialogAction(
                    child: Text(request.cancelTitle),
                    onPressed: () {
                      _dialogService
                          .dialogComplete(DialogResponse(confirmed: false));
                    },
                  ),
                if (isNullOrEmpty(request.buttonTitle) == false)
                  CupertinoDialogAction(
                    child: Text(request.buttonTitle),
                    onPressed: () {
                      _dialogService
                          .dialogComplete(DialogResponse(confirmed: true));
                    },
                  ),
              ],
            );
          }
          return AlertDialog(
            title: isNullOrEmpty(request.title) ? null : Text(request.title),
            content: isNullOrEmpty(request.description)
                ? null
                : Text(request.description),
            actions: <Widget>[
              if (isNullOrEmpty(request.cancelTitle) == false)
                FlatButton(
                  child: Text(request.cancelTitle),
                  onPressed: () {
                    _dialogService
                        .dialogComplete(DialogResponse(confirmed: false));
                  },
                ),
              if (isNullOrEmpty(request.buttonTitle) == false)
                FlatButton(
                  child: Text(request.buttonTitle),
                  onPressed: () {
                    _dialogService
                        .dialogComplete(DialogResponse(confirmed: true));
                  },
                ),
            ],
          );
        });
  }
}
