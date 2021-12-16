import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/config/devices/app_Info.dart';
import 'package:my_app/src/network/domain_manager.dart';
import 'package:my_app/src/router/auto_router.gr.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'package:my_app/src/theme/themes.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(XTheme.barOverLayStyle);
  _locator();
  await Future.wait([
    // Firebase.initializeApp(),
    // AnalyticsService.instance.init(),
    AppInfo.initialize(),
    UserPrefs.instance.initialize(),
  ]);
}

void _locator() {
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => XRouter());
}
