import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';

import 'constans.dart';

class Application {
  factory Application() => instance;

  Application._internal() {
    setupFuture = _prepareKicksStartConfig();
  }

  static final Application instance = Application._internal();

  Future<void> setupFuture;

  Future<void> _prepareKicksStartConfig() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.grey[100]));

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    kPackageInfo = await PackageInfo.fromPlatform();

    return Future.delayed(const Duration(milliseconds: 300));
  }
}
