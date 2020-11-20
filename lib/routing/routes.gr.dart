// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ping9/ping9.dart';

import '../view/dashboard_screen.dart';
import '../view/splash_screen.dart';

class Routes {
  static const String dashboardScreen = '/dashboard-screen';
  static const String splashScreen = '/';
  static const String webScreen = '/web-screen';
  static const String emptyScreen = '*';
  static const all = <String>{
    dashboardScreen,
    splashScreen,
    webScreen,
    emptyScreen,
  };
}

class AppRoute extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.dashboardScreen, page: DashboardScreen),
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.webScreen, page: WebScreen),
    RouteDef(Routes.emptyScreen, page: EmptyScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    DashboardScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardScreen(),
        settings: data,
      );
    },
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashScreen(),
        settings: data,
      );
    },
    WebScreen: (data) {
      final args = data.getArgs<WebScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => WebScreen(args.url),
        settings: data,
      );
    },
    EmptyScreen: (data) {
      final args = data.getArgs<EmptyScreenArguments>(
        orElse: () => EmptyScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EmptyScreen(title: args.title),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// WebScreen arguments holder class
class WebScreenArguments {
  final String url;
  WebScreenArguments({@required this.url});
}

/// EmptyScreen arguments holder class
class EmptyScreenArguments {
  final String title;
  EmptyScreenArguments({this.title = 'Empty view'});
}
