import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/features/common/setting/setting_bloc.dart';
import 'package:my_app/src/router/auto_router.gr.dart';
import 'package:my_app/src/theme/themes.dart';
import 'package:my_app/src/localization/localization_utils.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final appRouter = GetIt.I<XRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: [
            S.delegate,
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
          routeInformationParser:
              appRouter.defaultRouteParser(includePrefixMatches: true),
          routerDelegate: AutoRouterDelegate(
            appRouter,
          ),
        );
      }),
    );
  }
}
