import 'dart:async';

import 'package:flutter/material.dart';

import 'dialog_model.dart';
export 'dialog_model.dart';
export 'dialog_widget.dart';

class DialogService {
  final GlobalKey<NavigatorState> _dialogNavigationKey = GlobalKey<NavigatorState>();
  Function(DialogModel) _showDialogListener;

  set showDialogListener(Function(DialogModel) showDialogListener) {
    _showDialogListener = showDialogListener;
  }
  Completer<DialogResponse> _dialogCompleter;

  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;


  /// Calls the dialog listener and returns a Future that will wait for dialogComplete.
  Future<DialogResponse> showDialog({
    String title,
    String description,
    String buttonTitle = 'Ok',
  }) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener(DialogModel(
      title: title,
      description: description,
      buttonTitle: buttonTitle,
    ));
    return _dialogCompleter.future;
  }

  /// Shows a confirmation dialog
  Future<DialogResponse> showConfirmationDialog(
      {String title,
        String description,
        String confirmationTitle = 'Ok',
        String cancelTitle = 'Cancel'}) {
    _dialogCompleter = Completer<DialogResponse>();
    _showDialogListener(DialogModel(
        title: title,
        description: description,
        buttonTitle: confirmationTitle,
        cancelTitle: cancelTitle));
    return _dialogCompleter.future;
  }

  /// Completes the _dialogCompleter to resume the Future's execution call
  void dialogComplete(DialogResponse response) {
    _dialogNavigationKey.currentState.pop();
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
