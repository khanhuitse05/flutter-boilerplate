import 'package:auto_route/auto_route.dart';
import 'package:my_app/src/router/auto_router.gr.dart';
import 'package:my_app/src/router/router_name.dart';

class SampleCoordinator {
  static var autoRouter = AutoRoute(
    path: XRoutes.sample,
    page: SampleRoute.page,
    children: [
      AutoRoute(path: '', page: SampleItemListRoute.page),
      AutoRoute(path: ':id', page: SampleItemDetailsRoute.page),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
