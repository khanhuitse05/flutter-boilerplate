import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_app/core/constans.dart';
import 'package:my_app/core/router.dart';
import 'package:my_app/repository/utility/navigation_provider.dart';
import 'package:my_app/theme/app_theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navKey.currentState.overlay.context;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: MyApp.navKey,
        title: kAppName,
        theme: primaryTheme,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
