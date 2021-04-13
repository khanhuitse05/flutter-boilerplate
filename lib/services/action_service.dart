import 'package:flutter/material.dart';
import 'package:my_app/models/shared/action_type.dart';
import 'package:my_app/src/utils/index.dart';

class ActionService {
  void onHandleAction(BuildContext context, Map action) {
    final type = action['type'];
    switch (type) {
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

  void linkToBrowser(BuildContext context, Map action) {
    final url = action['url'];
    printTrace('link to web page: $url');
  }

  void linkToWebView(BuildContext context, Map action) {
    printTrace('link to web page: ${action['url']}');
    Navigator.pushNamed(context, '/web-view', arguments: action);
  }

  void linkToScreen(BuildContext context, Map action) {}
}
