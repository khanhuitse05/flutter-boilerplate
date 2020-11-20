import 'package:get/get.dart';
import 'package:my_app/services/action_service.dart';
import 'package:ping9/ping9.dart';

void setupLocator() {
  Get..lazyPut(() => DialogService())..lazyPut(() => ActionService());
}
