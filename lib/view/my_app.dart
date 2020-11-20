import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navKey.currentState.overlay.context;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: MyApp.navKey,
      title: "My APP",
      // theme: primaryTheme,
      initialRoute: '/init-view',
      // onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
