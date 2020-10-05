import 'package:flutter/material.dart';
import 'package:ping9/ping9.dart';

class AppAction {
  static final AppAction instance = AppAction._internal();

  factory AppAction() => instance;

  AppAction._internal() {
    alreadySpam = false;
  }

  bool alreadySpam;

  void onHandleActionInit(
      BuildContext context, String action, String value, String message) {
    if (alreadySpam == false) {
      alreadySpam = true;
      onHandleAction(context, action, value, message);
    }
  }

  void onHandleAction(BuildContext context, String actionName,
      String actionValue, String message) {
    final action = actionName.trim().toLowerCase();
    final value = actionValue.trim();
    switch (action) {
      case ActionType.linkToScreen:
        linkToScreen(context, value, message);
        break;
      case ActionType.linkToWebView:
        linkToWebView(context, value, message);
        break;
      case ActionType.linkToBrowser:
        linkToBrowser(context, value);
        break;
      default:
        printTrace("Type don't exist: $action");
        break;
    }
  }

  void linkToBrowser(BuildContext context, String value) {
    printTrace('link to web page: $value');
  }

  void linkToWebView(BuildContext context, String value, String message) {
    printTrace('link to web page: $value');
    Navigator.pushNamed(context, '/web-view',
        arguments: {'url': value, 'title': message});
  }

  void linkToScreen(BuildContext context, String value, String message) {

  }
}

class ActionType {
  static const String linkToBrowser = "linkToBrowser";
  static const String linkToWebView = "linkToWebView";
  static const String linkToScreen = "linkToScreen";
}
