import 'package:auto_route/auto_route.dart';
import 'package:my_app/src/features/sample/view/sample_detail_view.dart';
import 'package:my_app/src/features/sample/view/sample_list_view.dart';
import 'package:my_app/src/router/routes.dart';

class SampleRouter {
  static void onEnter() {
    XCoordinator.router.pushNamed(XRoutes.sample);
  }

  static const autoRoute = AutoRoute(
    path: XRoutes.sample,
    name: "SampleRouter",
    page: EmptyRouterPage,
    children: [
      AutoRoute(path: '', page: SampleItemListView),
      AutoRoute(path: ':id', page: SampleItemDetailsView),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
