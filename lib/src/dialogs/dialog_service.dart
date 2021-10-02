import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
part 'dialog_manager.dart';
part 'dialog_model.dart';

class DialogService {
  static final GlobalKey<NavigatorState> _dialogNavigationKey =
      GlobalKey<NavigatorState>();
  static late Function showDialogListener;

  static GlobalKey<NavigatorState> get dialogNavigationKey =>
      _dialogNavigationKey;
  static Future pop() async {
    return _dialogNavigationKey.currentState?.pop();
  }

  static Widget initBuilder(BuildContext context, Widget? child) {
    final dialog = DialogWidget(child: child);
    return Navigator(
      key: DialogService.dialogNavigationKey,
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (context) => dialog,
      ),
    );
  }
}

/// show the dialog
Future showAlert(
    {String? title, String? body, List<DialogButton>? actions}) async {
  return DialogService.showDialogListener(DialogModel(
    title: title,
    body: body,
    actions: actions ?? [DialogButton.close()],
  ));
}

/// Shows a confirmation dialog
Future showCustomAlert(
    {Widget? title, Widget? body, List<DialogButton>? actions}) async {
  return DialogService.showDialogListener(
      DialogModel(titleWidget: title, bodyWidget: body, actions: actions));
}

Future showLoading({String? message}) async {
  return DialogService.showDialogListener(DialogModel.loading(body: message));
}

Future hideLoading() => DialogService.pop();
