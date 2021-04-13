import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/src/core/app_delegate.dart';
import 'package:my_app/src/widget/common/indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AppDelegate.instance.setupFuture.then(onSetup);
  }

  FutureOr onSetup(_) {
    Get.toNamed(Routes.dev);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Indicator(),
    );
  }
}
