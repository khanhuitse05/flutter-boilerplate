import 'package:chat_app/core/router.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:chat_app/view/home_view.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/app_analytics.dart';
import 'locale/app_translations_delegate.dart';
import 'locale/application.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
      .copyWith(statusBarIconBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
      analytics: AppAnalytics.instance.firebase, nameExtractor: Router.getNameExtractor);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        _newLocaleDelegate,
        const AppTranslationsDelegate(),
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),

      title: 'Flutter Demo',
      theme: themeData,
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
      navigatorObservers: [MyApp.observer],
      home: HomeView(title: 'Flutter Demo Home Page'),
    );
  }

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged.stream.listen(onLocaleChange);
//    AppOneSignal.instance.initOneSignal(context);
//    AppDynamicLinks.instance.initDynamicLinks(context);

  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}
