import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/features/dashboard/controller/tabbar_provider.dart';
import 'package:my_app/services/action_service.dart';
import 'package:ping9/ping9.dart';
import 'package:provider/provider.dart';

void setupLocator() {
  Get..lazyPut(() => DialogService())..lazyPut(() => ActionService());
}

List<Widget> get setupProvider => [
      Provider(create: (_) => Get.find<ThemeService>()),
      Provider(create: (_) => TabBarProvider()),
    ];
