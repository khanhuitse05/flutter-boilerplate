import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class XAlertButton {
  final String title;
  final String? key;
  XAlertButton(this.title, {this.key});
  XAlertButton.close({this.title = 'Close', this.key});
}

class XAlertDialog extends StatelessWidget {
  const XAlertDialog({
    this.title,
    this.content,
    this.titleWidget,
    this.contentWidget,
    this.actions = const [],
    Key? key,
  }) : super(key: key);
  final String? title;
  final String? content;
  final Widget? titleWidget;
  final Widget? contentWidget;
  final List<XAlertButton> actions;

  @override
  Widget build(BuildContext context) {
    final _actions = actions.isEmpty ? [XAlertButton.close()] : actions;
    if (kIsWeb || Platform.isAndroid) {
      return AlertDialog(
        title: titleWidget ?? (title == null ? null : Text(title!)),
        content: contentWidget ?? (content == null ? null : Text(content!)),
        actions: <Widget>[
          for (int i = 0; i < _actions.length; i++)
            _buildButton(context, _actions[i], i)
        ],
      );
    }
    return CupertinoAlertDialog(
      title: titleWidget ?? (title == null ? null : Text(title!)),
      content: contentWidget ?? (content == null ? null : Text(content!)),
      actions: <Widget>[
        for (int i = 0; i < _actions.length; i++)
          _buildButton(context, _actions[i], i)
      ],
    );
  }

  Widget _buildButton(BuildContext context, XAlertButton item, int index) {
    if (kIsWeb || Platform.isAndroid) {
      return TextButton(
        key: Key('XAlertButton-$index-${item.key}'),
        onPressed: () {
          Navigator.of(context).pop(item.key);
        },
        child: Text(item.title),
      );
    }
    return CupertinoDialogAction(
      key: Key('XAlertButton-$index-${item.key}'),
      onPressed: () {
        Navigator.of(context).pop(item.key);
      },
      child: Text(item.title),
    );
  }
}
