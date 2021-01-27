import 'package:auto_route/auto_route_annotations.dart';
import 'package:my_app/features/dashboard/dashboard_screen.dart';

import 'package:my_app/shared/view/splash_screen.dart';
import 'package:ping9/ping9.dart';

export 'routes.gr.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  // login
  MaterialRoute(page: DashboardScreen),

  // helper
  MaterialRoute(page: SplashScreen, initial: true),
  MaterialRoute(page: WebScreen),
  MaterialRoute(path: "*", page: EmptyScreen)

  // Custom path names
  /// MaterialRoute(path: "/users", page: UsersScreen)
  /// CupertinoRoute(page: UsersScreen, fullscreenDialog: true),
  /// CustomRoute<bool>(page: LoginScreen, transitionsBuilder: TransitionsBuilders.fadeIn),
  /**
   MaterialRoute(
      path: '/users:id',
      page: UsersScreen,
      children: <AutoRoute>[
      // path: '/' is the same as setting initial to true
      MaterialRoute(path: '/', page: ProfileScreen),
      MaterialRoute(path: '/posts', page: PostsScreen),
      ],
    ),
   */
])
class $AppRoute {}
