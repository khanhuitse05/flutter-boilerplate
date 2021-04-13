import 'package:get/get.dart';
import 'package:my_app/_devmode/view/dev_screen.dart';
import 'package:my_app/features/dashboard/dashboard_screen.dart';
import 'package:my_app/features/splash/splash_screen.dart';

// https://github.com/jonataslaw/getx/blob/master/documentation/en_US/route_management.md
class Routes {
  Routes._();
  static const String splash = '/';
  static const String dashboard = '/dashboard';
  static const String dev = '/dev';

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: dashboard, page: () => DashboardScreen()),
    GetPage(name: dev, page: () => DevScreen()),
  ];
}
