import 'dart:async';

import 'package:flutter/material.dart';

import 'dialog_model.dart';
export 'dialog_model.dart';
export 'dialog_widget.dart';

class DialogService {
  final GlobalKey<NavigatorState> _dialogNavigationKey =
      GlobalKey<NavigatorState>();
  Function(DialogModel) _showDialogListener;

  // ignore: avoid_setters_without_getters
  set showDialogListener(Function(DialogModel) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;

  /// show the dialog
  Future showDialog({
    String title,
    String body,
    String cancelTitle = 'Close',
  }) {
    return _showDialogListener(DialogModel(
      title: title,
      body: body,
      actions: [DialogButton(title: cancelTitle)],
    ));
  }

  /// Shows a confirm dialog
  Future showConfirmDialog(
      {String title, String description, List<DialogButton> actions}) {
    return _showDialogListener(DialogModel(
      title: title,
      body: description,
      actions: actions,
    ));
  }

  /// Shows a confirmation dialog
  Future showCustomDialog(
      {Widget title, Widget description, List<DialogButton> actions}) {
    return _showDialogListener(DialogModel(
      titleWidget: title,
      bodyWidget: description,
      actions: actions,
    ));
  }

  void pop() {
    _dialogNavigationKey.currentState.pop();
  }
}
