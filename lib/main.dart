import 'package:chat_app/core/router.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'locale/app_translations_delegate.dart';
import 'locale/application.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
      .copyWith(statusBarIconBrightness: Brightness.light));

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
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeManager()),
      ],
      child: Consumer<ThemeManager>(builder: (context, theme, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            _newLocaleDelegate,
            const AppTranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: Application.instance.supportedLocales(),
          navigatorKey: MyApp.navKey,
          title: 'My Flutter App',
          theme: theme.currentTheme,
          initialRoute: '/home',
          onGenerateRoute: Router.generateRoute,
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    Application.instance.onLocaleChanged.stream.listen(onLocaleChange);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}
