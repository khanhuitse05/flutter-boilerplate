import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:my_app/src/features/common/view/not_found_view.dart';
import 'package:my_app/src/features/sample/view/sample_detail_view.dart';
import 'package:my_app/src/features/sample/view/sample_list_view.dart';
import 'package:my_app/src/features/settings/settings_view.dart';
import 'package:my_app/src/router/coordinator.dart';

class SampleRoutes {
  static const String home = '/';
  static const String detail = '/detail';
  static const String setting = '/setting';
}

class SampleCoordinator extends NavCoordinator {
  @override
  String get initialRoute => SampleRoutes.home;

  @override
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) {
        switch (settings.name) {
          case SampleRoutes.home:
            return SampleItemListView();
          case SampleRoutes.detail:
            return SampleItemDetailsView();
          case SampleRoutes.setting:
            return SettingsView();
          default:
            return NotFoundView();
        }
      },
    );
  }
}
