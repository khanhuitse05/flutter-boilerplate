import 'package:chat_app/view/empty_view.dart';
import 'package:chat_app/view/home_view.dart';
import 'package:chat_app/view/web_view.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    /// add settings on MaterialPageRoute for which route you want to tracking
    var data = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
            builder: (_) => HomeView(), settings: settings);

      case '/web-view':
        return MaterialPageRoute(
            builder: (_) => WebViewRouter(data), settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => EmptyView(title: settings.name));
    }
  }

  static String getNameExtractor(RouteSettings settings) {
    /// User for override route's name
    switch (settings.name) {
      case '/':
        return null;
      default:
        return settings.name;
    }
  }
}
