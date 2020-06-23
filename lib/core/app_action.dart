import 'package:my_app/core/utility.dart';
import 'package:my_app/repository/utility/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
        lg("Type don't exist: $action");
        break;
    }
  }

  void linkToBrowser(BuildContext context, String value) {
    lg('link to web page: $value');
    launch(value);
  }

  void linkToWebView(BuildContext context, String value, String message) {
    lg('link to web page: $value');
    Navigator.pushNamed(context, '/web-view',
        arguments: {'url': value, 'title': message});
  }

  void linkToScreen(BuildContext context, String value, String message) {
    lg('link to screen: $value');
    int index = -1;
    switch (value) {
      case 'home':
        index = 0;
        break;
      default:
        Navigator.pushNamed(context, '/$value', arguments: message);
        return;
        break;
    }
    if (index >= 0) {
      Provider.of<NavigationProvider>(context).switchTo(index);
      Navigator.popUntil(context, ModalRoute.withName('/home'));
    }
  }
}

class ActionType {
  static const String linkToBrowser = "linkToBrowser";
  static const String linkToWebView = "linkToWebView";
  static const String linkToScreen = "linkToScreen";
}
