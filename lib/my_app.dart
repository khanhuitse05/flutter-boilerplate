import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/src/theme/app_theme.dart';
import 'package:my_app/src/theme/theme_service.dart';

class MyApp extends GetView<ThemeService> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('en', '')],
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: controller.themeMode,
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
    );
  }
}
