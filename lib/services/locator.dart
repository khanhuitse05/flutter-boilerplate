import 'package:get/get.dart';
import 'package:my_app/services/action_service.dart';
import 'package:my_app/src/theme/theme_service.dart';

void setupLocator() {
  Get
    ..lazyPut(() => ActionService(), fenix: true)
    ..lazyPut(() => ThemeService(), fenix: true);
}
