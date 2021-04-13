import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/services/locator.dart';
import 'package:my_app/src/theme/app_theme.dart';
import 'package:my_app/src/theme/theme_service.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: setupProvider,
      child: MyAppState(),
    );
  }
}

class MyAppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = context.watch();
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('en', '')],
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeService.themeMode,
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
    );
  }
}
