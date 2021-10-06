import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/dialogs/widget/x_alert_dialog.dart';
import 'package:my_app/src/router/router.gr.dart';

class XAlert {
  static get context => GetIt.I<XRouter>().navigatorKey.currentState!.context;

  /// show the dialog
  static Future<String?> show({
    String? title,
    String? body,
    List<XAlertButton> actions = const [],
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return XAlertDialog(
          title: title,
          content: body,
          actions: actions,
        );
      },
    );
  }

  /// Shows a confirmation dialog
  Future showCustomAlert({
    Widget? title,
    Widget? body,
    List<XAlertButton> actions = const [],
  }) async {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return XAlertDialog(
          titleWidget: title,
          contentWidget: body,
          actions: actions,
        );
      },
    );
  }
}
