import 'package:auto_route/auto_route.dart';
import 'package:my_app/src/router/auto_router.gr.dart';
import 'package:my_app/src/router/router_name.dart';

class DevRoutes {
  static const String device = 'device';
  static const String button = 'button';
  static const String theme = 'theme';
  static const String textTheme = 'textTheme';
  static const String dialog = 'dialog';
  static const String input = 'input';
  static const String other = 'other';
}

class DevCoordinator {
  static var autoRouter = AutoRoute(
    path: XRoutes.dev,
    page: DevRoute.page,
    children: [
      AutoRoute(path: '', page: DevHomeRoute.page),
      AutoRoute(path: DevRoutes.device, page: DevDeviceRoute.page),
      AutoRoute(path: DevRoutes.button, page: DevButtonRoute.page),
      AutoRoute(path: DevRoutes.theme, page: DevThemeRoute.page),
      AutoRoute(path: DevRoutes.textTheme, page: DevTextRoute.page),
      AutoRoute(path: DevRoutes.dialog, page: DevDialogRoute.page),
      AutoRoute(path: DevRoutes.input, page: DevInputRoute.page),
      AutoRoute(path: DevRoutes.other, page: DevOtherRoute.page),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
