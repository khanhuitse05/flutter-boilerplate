import 'package:flutter/material.dart';
import 'package:myapp/generated/i18n/app_localizations.dart' as al;
import 'package:myapp/src/router/coordinator.dart';

class S {
  static LocalizationsDelegate<al.AppLocalizations> get delegate =>
      al.AppLocalizations.delegate;
  static List<LocalizationsDelegate> get localizationsDelegates =>
      al.AppLocalizations.localizationsDelegates;
  static List<Locale> get supportedLocales =>
      al.AppLocalizations.supportedLocales;

  static al.AppLocalizations of(BuildContext context) {
    return al.AppLocalizations.of(context)!;
  }

  static al.AppLocalizations get text {
    return al.AppLocalizations.of(AppCoordinator.context)!;
  }
}
