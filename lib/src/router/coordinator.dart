import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class NavCoordinator {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BuildContext get context => navigatorKey.currentState!.context;
  String get initialRoute;
  NavigatorObserver? get navigatorObserver;

  Route<dynamic>? onGenerateRoute(RouteSettings settings);

  Future? onExit(BuildContext context) {
    // todo
  }

  void onBack([Object? result]) {
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
