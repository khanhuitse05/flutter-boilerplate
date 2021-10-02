import 'package:flutter/material.dart';
import 'package:my_app/src/features/common/view/not_found_view.dart';
import 'package:my_app/src/features/dashboard/view/dashboard_view.dart';
import 'package:my_app/src/features/sample_feature/sample_item_details_view.dart';
import 'package:my_app/src/features/sample_feature/sample_item_list_view.dart';
import 'package:my_app/src/router/routes.dart';

class XRouting {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) {
        switch (settings.name) {
          case Routes.dashBoard:
            return DashBoardView();
          case Routes.sample:
            return const SampleItemListView();
          case Routes.sample:
            return const SampleItemDetailsView();
          case Routes.setting:
            return const SampleItemDetailsView();
          default:
            return const NotFoundView();
        }
      },
    );
  }
}
