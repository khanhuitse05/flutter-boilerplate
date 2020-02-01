import 'package:flutter/material.dart';

class CustomFadeRoute<T> extends MaterialPageRoute<T> {
  CustomFadeRoute({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    if (settings.isInitialRoute)
      return child;
    return new FadeTransition(opacity: animation, child: child);
  }
}