import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/src/theme/colors.dart';

class XAlertButton<T> {
  final String? title;
  final Widget? child;
  final T? key;
  final bool isDestructiveAction;

  XAlertButton(
      {this.key, this.title, this.child, this.isDestructiveAction = false})
      : assert(title != null || child != null);

  factory XAlertButton.close({String? title}) {
    return XAlertButton(title: title ?? S.text.common_close);
  }
}

class XAlertDialog extends StatelessWidget {
  const XAlertDialog({
    this.title,
    this.content,
    this.titleWidget,
    this.contentWidget,
    this.actions = const [],
    super.key,
  });
  final String? title;
  final String? content;
  final Widget? titleWidget;
  final Widget? contentWidget;
  final List<XAlertButton> actions;

  @override
  Widget build(BuildContext context) {
    final actionButtons = actions.isEmpty ? [XAlertButton.close()] : actions;
    if (kIsWeb || Platform.isAndroid) {
      return AlertDialog(
        title: titleWidget ?? (title == null ? null : Text(title!)),
        content: contentWidget ?? (content == null ? null : Text(content!)),
        actions: <Widget>[
          for (int i = 0; i < actionButtons.length; i++)
            _buildButton(context, actionButtons[i], i)
        ],
      );
    }
    return CupertinoAlertDialog(
      title: titleWidget ?? (title == null ? null : Text(title!)),
      content: contentWidget ?? (content == null ? null : Text(content!)),
      actions: <Widget>[
        for (int i = 0; i < actionButtons.length; i++)
          _buildButton(context, actionButtons[i], i)
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
        child: item.child != null
            ? item.child!
            : Text(
                item.title ?? '',
                style: TextStyle(
                  color: item.isDestructiveAction ? Colors.red : AppColors.text,
                ),
              ),
      );
    }
    return CupertinoDialogAction(
      key: Key('XAlertButton-$index-${item.key}'),
      onPressed: () {
        Navigator.of(context).pop(item.key);
      },
      isDestructiveAction: item.isDestructiveAction,
      child: item.child != null ? item.child! : Text(item.title ?? ''),
    );
  }
}
