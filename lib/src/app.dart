import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_app/src/features/common/setting/setting_bloc.dart';
import 'package:my_app/src/router/route_observer.dart';
import 'package:my_app/src/router/routing.dart';
import 'package:my_app/src/theme/themes.dart';
import 'package:my_app/src/utils/localization_utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (BuildContext context) =>
              S.of(context).common_appTitle,
          theme: XTheme.light(),
          darkTheme: XTheme.dark(),
          themeMode: state.themeMode,
          navigatorKey: XRouting.navigatorKey,
          navigatorObservers: [XRouteObserver()],
          onGenerateRoute: XRouting.onGenerateRoute,
        );
      }),
    );
  }
}
