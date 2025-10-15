import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/settings/logic/setting_bloc.dart';
import 'package:myapp/src/router/router.dart';
import 'package:myapp/src/theme/screen.dart';
import 'package:myapp/src/theme/themes.dart';
import 'package:myapp/src/localization/localization_utils.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppScreens.mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingBloc()),
        BlocProvider(create: (_) => GetIt.I<AccountBloc>()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          onGenerateTitle: (context) => S.of(context).common_appTitle,
          builder: BotToastInit(),
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: state.themeMode,
          routerConfig: GetIt.I<AppRouter>().router,
        );
      }),
    );
  }
}
