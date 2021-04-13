import 'package:get/get.dart';
import 'package:my_app/services/action_service.dart';
import 'package:my_app/src/theme/theme_service.dart';

import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void setupLocator() {
  Get
    ..lazyPut(() => ActionService(), fenix: true)
    ..lazyPut(() => ThemeService(), fenix: true);
}

List<SingleChildWidget> get setupProvider => [
      ChangeNotifierProvider(create: (_) => Get.find<ThemeService>()),
    ];
