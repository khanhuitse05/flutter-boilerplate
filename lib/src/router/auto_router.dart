import 'package:auto_route/auto_route.dart';
import 'package:my_app/_dev/router/dev_router.dart';
import 'package:my_app/src/features/account/profile/view/profile_view.dart';
import 'package:my_app/src/features/account/view/account_view.dart';
import 'package:my_app/src/features/dashboard/view/dashboard_view.dart';
import 'package:my_app/src/features/home/view/home_view.dart';
import 'package:my_app/src/features/order/router/order_router.dart';
import 'package:my_app/src/features/sample/router/sample_router.dart';
import 'package:my_app/src/features/settings/settings_view.dart';
import 'package:my_app/src/router/router_name.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: DashBoardView,
      initial: true,
      children: [
        AutoRoute(path: "home", name: 'HomeRouter', page: HomeView),
        AutoRoute(
          path: "account",
          name: 'AccountRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: AccountView),
            AutoRoute(path: 'profile', page: ProfileView),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
    AutoRoute(path: XRoutes.setting, page: SettingsView),
    SampleCoordinator.autoRoute,
    DevCoordinator.autoRoute,
    OrderCoordinator.autoRoute,
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
