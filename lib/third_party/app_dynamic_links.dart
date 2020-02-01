/**
import 'dart:convert';

import 'package:ann_shop_flutter/core/app_action.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class AppDynamicLinks{

  static final AppDynamicLinks instance = AppDynamicLinks._internal();

  factory AppDynamicLinks() {
    return instance;
  }

  AppDynamicLinks._internal();


  void initDynamicLinks(BuildContext context) async {
    final PendingDynamicLinkData data =
    await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;

    if (deepLink != null) {
      processDynamicLinks(context, deepLink, true);
    }

    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
          final Uri deepLink = dynamicLink?.link;

          if (deepLink != null) {
            processDynamicLinks(context, deepLink, false);
          }
        }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
  }

  void processDynamicLinks(BuildContext context, Uri deepLink, bool init) {
    print('onHandleDeepLink ${deepLink.toString()}');
    print('queryParameters ${deepLink.queryParameters}');

    // todo
    if (deepLink.queryParameters != null) {
      String type = deepLink.queryParameters['action']??'';
      String value = deepLink.queryParameters['actionValue']??'';
      String message = deepLink.queryParameters['message']??'';
      if (init) {
        AppAction.instance.onHandleActionInit(context, type, value, message);
      } else {
        AppAction.instance.onHandleAction(context, type, value, message);
      }
    }
  }
}
*/