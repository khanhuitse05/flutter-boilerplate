import 'package:flutter/material.dart';
import 'package:my_app/models/action.dart';
import 'package:ping9/ping9.dart';

/// [name]/[value]?message=[message]&title=[title]
class ActionService {
  ActionService() {
    alreadySpam = false;
  }

  bool alreadySpam;

  void onHandleActionInit(BuildContext context, AppAction action) {
    if (alreadySpam == false) {
      alreadySpam = true;
      onHandleAction(context, action);
    }
  }

  void onHandleAction(BuildContext context, AppAction action) {
    switch (action.type) {
      case ActionType.screen:
        linkToScreen(context, action);
        break;
      case ActionType.webView:
        linkToWebView(context, action);
        break;
      case ActionType.browser:
        linkToBrowser(context, action);
        break;
      default:
        printTrace("Type don't exist: $action");
        break;
    }
  }

  void linkToBrowser(BuildContext context, AppAction action) {
    printTrace('link to web page: $action');
  }

  void linkToWebView(BuildContext context, AppAction action) {
    printTrace('link to web page: $action');
    Navigator.pushNamed(context, '/web-view',
        arguments: {'url': action.value, 'title': action.name});
  }

  void linkToScreen(BuildContext context, AppAction action) {}
}
