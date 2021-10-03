import 'package:flutter/material.dart';
import 'package:my_app/src/features/common/view/not_found_view.dart';
import 'package:my_app/src/features/dashboard/view/dashboard_view.dart';
import 'package:my_app/src/features/sample/view/sample_view.dart';
import 'package:my_app/src/features/settings/settings_view.dart';
import 'package:my_app/src/router/routes.dart';

class XRouting {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final uri = Uri(path: settings.name);
    // ignore: unused_local_variable
    // final path = '/${uri.pathSegments.first}';

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) {
        switch (settings.name) {
          case XRoutes.dashBoard:
            return DashBoardView();
          case XRoutes.sample:
            return SampleView();
          case XRoutes.setting:
            return SettingsView();
          default:
            return NotFoundView();
        }
      },
    );
  }

  static Future? pushNamed(String route) {
    return navigatorKey.currentState!.pushNamed(route);
  }

  static void pop([Object? result]) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }
}
