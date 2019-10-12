import 'package:chat_app/core/router.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/app_analytics.dart';
import 'locale/app_translations_delegate.dart';
import 'locale/application.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
      .copyWith(statusBarIconBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

//  ErrorWidget.builder = (FlutterErrorDetails details) => Container(
//    alignment: Alignment.center,
//    child: Icon(Icons.error),
//  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final navKey = new GlobalKey<NavigatorState>();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
      analytics: AppAnalytics.instance.firebase,
      nameExtractor: Router.getNameExtractor);

  AppTranslationsDelegate _newLocaleDelegate;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: ThemeManager()),
        StreamProvider<ThemeData>(
            builder: (context) =>
                Provider.of<ThemeManager>(context, listen: false).theme)
      ],
      child: Consumer<ThemeData>(builder: (context, theme, child) {
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
          supportedLocales: Application.instance.supportedLocales(),
          navigatorKey: MyApp.navKey,
          title: 'My Flutter App',
          theme: theme,
          initialRoute: '/',
          onGenerateRoute: Router.generateRoute,
          navigatorObservers: [observer],
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    Application.instance.onLocaleChanged.stream.listen(onLocaleChange);
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}
