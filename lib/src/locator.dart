import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/config/devices/app_info.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/router/router.dart';
import 'package:myapp/src/services/remote_config/remote_config_service.dart';
import 'package:myapp/src/services/user_prefs.dart';

import 'features/common/app_bloc/bloc_observer.dart';
import 'services/firebase_message.dart';

Future initializeApp({String? name, FirebaseOptions? firebaseOptions}) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  _locator();
  await Firebase.initializeApp(name: name, options: firebaseOptions);
  await Future.wait([
    AppInfo.initialize(),
    UserPrefs.instance.initialize(),
    XFirebaseMessage.instance.initialize(),
    dotenv.load(fileName: '.env.$name'),
  ]);
  await RemoteConfigService.getRemoteConfig();

  Bloc.observer = XBlocObserver();
  // Bloc.transformer = XEventTransformer(),
}

void _locator() {
  GetIt.I.registerLazySingleton(() => DomainManager());
  GetIt.I.registerLazySingleton(() => AppRouter());
  GetIt.I.registerLazySingleton(() => AccountBloc());
}
