import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/src/_dev/dev_screen.dart';
import 'package:myapp/src/features/common/view/not_found_view.dart';
import 'package:myapp/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:myapp/src/features/account/profile/view/profile_view.dart';
import 'package:myapp/src/features/account/view/account_view.dart';
import 'package:myapp/src/features/authentication/view/forgot_view.dart';
import 'package:myapp/src/features/authentication/view/signin_view.dart';
import 'package:myapp/src/features/authentication/view/signup_view.dart';
import 'package:myapp/src/features/dashboard/view/dashboard_view.dart';
import 'package:myapp/src/features/home/view/home_view.dart';
import 'package:myapp/src/features/photo_view/photo_view_page.dart';
import 'package:myapp/src/features/sample/view/sample_detail_view.dart';
import 'package:myapp/src/features/sample/view/sample_list_view.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/router/extras/photo_view_extra.dart';
import 'package:myapp/src/router/route_name.dart';

class AppRouter {
  late final router = GoRouter(
    navigatorKey: AppCoordinator.navigatorKey,
    initialLocation: AppRouteNames.home.path,
    debugLogDiagnostics: kDebugMode,
    observers: [BotToastNavigatorObserver()],
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.signIn.path,
        name: AppRouteNames.signIn.name,
        builder: (_, __) => const SigninView(),
        routes: <RouteBase>[
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.signUp.subPath,
            name: AppRouteNames.signUp.name,
            builder: (_, __) => const SignupView(),
          ),
          GoRoute(
            parentNavigatorKey: AppCoordinator.navigatorKey,
            path: AppRouteNames.forgotPassword.subPath,
            name: AppRouteNames.forgotPassword.name,
            builder: (_, __) => const ForgotPasswordView(),
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: AppCoordinator.shellKey,
        builder: (context, state, child) => DashBoardScreen(
          currentItem: XNavigationBarItems.fromLocation(state.uri.toString()),
          body: child,
        ),
        routes: <RouteBase>[
          GoRoute(
            path: AppRouteNames.home.path,
            name: AppRouteNames.home.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeView(),
            ),
            routes: <RouteBase>[
              GoRoute(
                parentNavigatorKey: AppCoordinator.navigatorKey,
                path: AppRouteNames.sample.subPath,
                name: AppRouteNames.sample.name,
                builder: (_, __) => const SampleItemListView(),
                routes: <RouteBase>[
                  GoRoute(
                    parentNavigatorKey: AppCoordinator.navigatorKey,
                    path: AppRouteNames.sampleDetails.buildSubPathParam,
                    name: AppRouteNames.sampleDetails.name,
                    builder: (_, state) {
                      final id = state.pathParameters[
                          AppRouteNames.sampleDetails.paramName]!;
                      return SampleItemDetailsView(id: id);
                    },
                  )
                ],
              )
            ],
          ),
          GoRoute(
            path: AppRouteNames.account.path,
            name: AppRouteNames.account.name,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AccountHomeView(),
            ),
            routes: <RouteBase>[
              GoRoute(
                path: AppRouteNames.profile.subPath,
                name: AppRouteNames.profile.name,
                builder: (_, __) => const ProfileView(),
              )
            ],
          ),
          GoRoute(
            path: AppRouteNames.dev.path,
            name: AppRouteNames.dev.name,
            builder: (_, __) => const DevScreen(),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: AppCoordinator.navigatorKey,
        path: AppRouteNames.photoView.path,
        name: AppRouteNames.photoView.name,
        builder: (_, state) {
          PhotoViewExtra extra = state.extra as PhotoViewExtra;
          return PhotoViewPage(
            galleryItems: extra.galleryItems,
            initialIndex: extra.initialIndex,
          );
        },
      ),
    ],
    errorBuilder: (_, __) => const NotFoundView(),
  );
}
