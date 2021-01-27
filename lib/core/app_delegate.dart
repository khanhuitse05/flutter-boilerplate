import 'package:flutter/services.dart';
import 'package:ping9/ping9.dart';
import 'constants.dart';

class AppDelegate {
  factory AppDelegate() => instance;

  AppDelegate._internal() {
    setupFuture = _prepareKicksStartConfig();
  }

  static final AppDelegate instance = AppDelegate._internal();

  // Call on splash screen: AppDelegate.instance.setupFuture.then(onSetup);
  Future<void> setupFuture;

  Future<void> _prepareKicksStartConfig() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    await Constants.initAsync();
    await UserDefaults.instance.initAsync();
    return Future.delayed(const Duration(milliseconds: 300));
  }
}
