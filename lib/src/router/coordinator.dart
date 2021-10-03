import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/src/router/routing.dart';

abstract class NavCoordinator {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentState!.context;
  String get initialRoute;
  NavigatorObserver? get navigatorObserver => null;

  Route<dynamic>? onGenerateRoute(RouteSettings settings);

  Future? onExit(BuildContext context) {
    XRouting.pop();
  }

  void pop([Object? result]) {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.pop(result);
    }
  }

  Navigator getNavigator({String? initialRoute}) => Navigator(
        observers: [if (navigatorObserver != null) navigatorObserver!],
        key: navigatorKey,
        initialRoute: initialRoute ?? this.initialRoute,
        onGenerateRoute: onGenerateRoute,
      );

  Future? pushNamed(String route) {
    return navigatorKey.currentState!.pushNamed(route);
  }

  Future? push(Route route) {
    return navigatorKey.currentState!.push(route);
  }
}
