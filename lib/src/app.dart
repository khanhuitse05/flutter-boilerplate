import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_app/src/features/common/setting/setting_bloc.dart';
import 'package:my_app/src/router/routing.dart';
import 'package:my_app/src/theme/themes.dart';
import 'package:my_app/src/utils/localization_utils.dart';

import 'dialogs/dialog_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static BuildContext get context => navigatorKey.currentState!.context;

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
          builder: DialogService.initBuilder,
          navigatorKey: MyApp.navigatorKey,
          onGenerateTitle: (BuildContext context) =>
              S.of(context).common_appTitle,
          theme: XTheme.light(),
          darkTheme: XTheme.dark(),
          themeMode: ThemeMode.system,
          onGenerateRoute: XRouting.onGenerateRoute,
        );
      }),
    );
  }
}
