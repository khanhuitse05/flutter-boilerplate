import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/config/devices/app_Info.dart';
import 'package:my_app/src/network/domain_manager.dart';
import 'package:my_app/src/router/auto_router.dart';
import 'package:my_app/src/services/user_prefs.dart';
import 'features/common/app_bloc/bloc_observer.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  _locator();
  await Future.wait([
    // Firebase.initializeApp(),
    // AnalyticsService.instance.init(),
    AppInfo.initialize(),
    UserPrefs.instance.initialize(),
  ]);

  Bloc.observer = XBlocObserver();
  // Bloc.transformer = XEventTransformer(),
}

void _locator() {
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => XRouter());
}
