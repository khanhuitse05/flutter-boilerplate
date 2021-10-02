import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_app/_dev/location/dev_view.dart';
import 'package:my_app/_dev/router/dev_routers.dart';
import 'package:my_app/_dev/view/dev_button_screen.dart';
import 'package:my_app/_dev/view/dev_theme_screen.dart';
import 'package:my_app/_dev/view/dev_device_screen.dart';
import 'package:my_app/_dev/view/dev_dialog_screen.dart';
import 'package:my_app/_dev/view/dev_input_screen.dart';
import 'package:my_app/_dev/view/dev_other_screen.dart';
import 'package:my_app/_dev/view/dev_text_screen.dart';
import 'package:my_app/src/features/common/view/not_found_view.dart';
import 'package:my_app/src/router/coordinator.dart';

class DevCoordinator extends NavCoordinator {
  @override
  String get initialRoute => '/';

  @override
  NavigatorObserver? get navigatorObserver => null;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevScreen(), settings: settings);
      case DevRouters.device:
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevDeviceScreen(), settings: settings);
      case DevRouters.button:
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevButtonScreen(), settings: settings);
      case DevRouters.theme:
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevThemeScreen(), settings: settings);
      case DevRouters.textTheme:
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevTextScreen(), settings: settings);
      case DevRouters.dialog:
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevDialogScreen(), settings: settings);
      case DevRouters.input:
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevInputScreen(), settings: settings);
      case DevRouters.other:
        return MaterialPageRoute<dynamic>(
            builder: (context) => DevOtherScreen(), settings: settings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (context) => NotFoundView(), settings: settings);
    }
  }
}
