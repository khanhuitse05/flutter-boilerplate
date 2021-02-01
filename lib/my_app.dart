import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_app/routing/routes.dart';
import 'package:my_app/services/locator.dart';
import 'package:ping9/ping9.dart';
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
    final DialogService dialogService = Get.find();
    final ThemeService themeService = context.watch();
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[Locale('en', '')],
      builder: (context, child) => Navigator(
        key: dialogService.dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogWidget(child: child),
        ),
      ),
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeService.themeMode,
      title: 'MyApp',
      // home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      // navigatorKey: routing.navigator.key,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: AppRoute(),
    );
  }
}
