import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/services/locator.dart';
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

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.grey[100]));

    await Constants.initAsync();
  }
}
