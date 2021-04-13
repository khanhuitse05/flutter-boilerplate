import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/dialog_model.dart';

class AppDialog extends StatelessWidget {
  const AppDialog(
      {this.title,
      this.content,
      this.actions,
      this.automaticallyImplyBack = true,
      Key? key})
      : super(key: key);
  final String? title, content;
  final List<DialogButton>? actions;
  final bool automaticallyImplyBack;
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return _iosAlertDialog(context);
    } else {
      return _androidAlertDialog(context);
    }
  }

  // Create the alert dialog for the IOS
  CupertinoAlertDialog _iosAlertDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: title == null ? null : Text(title!),
      content: content == null ? null : Text(content!),
      actions: getActions(context),
    );
  }

  // Create the alert dialog for the Android
  AlertDialog _androidAlertDialog(BuildContext context) {
    return AlertDialog(
      title: title == null ? null : Text(title!),
      content: content == null ? null : Text(content!),
      actions: getActions(context),
    );
  }

  List<Widget> getActions(BuildContext context) {
    return <Widget>[
      if (automaticallyImplyBack)
        TextButton(
          child: const Text("Back"),
          onPressed: () => Navigator.pop(context),
        ),
      for (final DialogButton button in actions ?? [])
        TextButton(
          child: Text(button.title),
          onPressed: () {
            Navigator.pop(context);
            button.onPressed?.call();
          },
        ),
    ];
  }

  void onPressedAccept(BuildContext context) {
    Navigator.pop(context);
  }
}
