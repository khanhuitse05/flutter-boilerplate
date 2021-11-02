import 'package:auto_route/auto_route.dart';
import 'package:my_app/_dev/location/dev_view.dart';
import 'package:my_app/_dev/location/dev_wrapper_view.dart';
import 'package:my_app/_dev/view/dev_button_view.dart';
import 'package:my_app/_dev/view/dev_device_view.dart';
import 'package:my_app/_dev/view/dev_dialog_view.dart';
import 'package:my_app/_dev/view/dev_input_view.dart';
import 'package:my_app/_dev/view/dev_other_view.dart';
import 'package:my_app/_dev/view/dev_text_view.dart';
import 'package:my_app/_dev/view/dev_theme_view.dart';
import 'package:my_app/src/router/router_name.dart';

class DevRouters {
  static const String device = 'device';
  static const String button = 'button';
  static const String theme = 'theme';
  static const String textTheme = 'textTheme';
  static const String dialog = 'dialog';
  static const String input = 'input';
  static const String other = 'other';
}

class DevCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dev,
    name: "DevRouter",
    page: DevWrapperView,
    children: [
      AutoRoute(path: '', page: DevView),
      AutoRoute(path: DevRouters.device, page: DevDeviceView),
      AutoRoute(path: DevRouters.button, page: DevButtonView),
      AutoRoute(path: DevRouters.theme, page: DevThemeView),
      AutoRoute(path: DevRouters.textTheme, page: DevTextView),
      AutoRoute(path: DevRouters.dialog, page: DevDialogView),
      AutoRoute(path: DevRouters.input, page: DevInputView),
      AutoRoute(path: DevRouters.other, page: DevOtherView),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
