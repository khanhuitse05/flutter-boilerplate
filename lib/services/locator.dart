import 'package:get/get.dart';
import 'package:my_app/services/action_service.dart';
import 'package:ping9/ping9.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void setupLocator() {
  Get
    ..lazyPut(() => DialogService())
    ..lazyPut(() => ActionService())
    ..lazyPut(() => ThemeService());
}

List<SingleChildWidget> get setupProvider => [
      ChangeNotifierProvider(create: (_) => Get.find<ThemeService>()),
    ];
