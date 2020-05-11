import 'package:flutter/material.dart';

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute(
      {@required this.type, WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  final PageRouteType type;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    switch (type) {
      case PageRouteType.fade:
        return FadeTransition(opacity: animation, child: child);
      case PageRouteType.fadeUpwards:
        return const FadeUpwardsPageTransitionsBuilder().buildTransitions<T>(
            this, context, animation, secondaryAnimation, child);
      case PageRouteType.openUpwards:
        return const FadeUpwardsPageTransitionsBuilder().buildTransitions<T>(
            this, context, animation, secondaryAnimation, child);
      case PageRouteType.zoomPage:
        return const FadeUpwardsPageTransitionsBuilder().buildTransitions<T>(
            this, context, animation, secondaryAnimation, child);
      case PageRouteType.cupertino:
        return const FadeUpwardsPageTransitionsBuilder().buildTransitions<T>(
            this, context, animation, secondaryAnimation, child);
      default:
        final PageTransitionsTheme theme =
            Theme.of(context).pageTransitionsTheme;
        return theme.buildTransitions<T>(
            this, context, animation, secondaryAnimation, child);
    }
  }
}

enum PageRouteType {
  fade,
  fadeUpwards,
  openUpwards,
  zoomPage,
  cupertino,
}
