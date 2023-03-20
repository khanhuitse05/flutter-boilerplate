import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/router/auto_router.gr.dart';
import 'package:my_app/src/router/router_name.dart';

class AccountRoutes {
  static const String profile = 'profile';
}

class AccountCoordinator {
  static var autoRouter = AutoRoute(
    path: XRouteTaps.account,
    page: AccountRoute.page,
    children: [
      AutoRoute(path: '', page: AccountHomeRoute.page),
      AutoRoute(path: AccountRoutes.profile, page: ProfileRoute.page),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );

  static Future showProfile(BuildContext context) {
    return context.router.pushNamed(AccountRoutes.profile);
  }
}
