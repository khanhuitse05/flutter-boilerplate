import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_translations.dart';
import 'application.dart';

class AppTranslationsDelegate extends LocalizationsDelegate<AppTranslations> {

  static AppTranslationsDelegate delegate  = AppTranslationsDelegate._();
  AppTranslationsDelegate._();

  @override
  bool isSupported(Locale locale) {
    return Application.instance.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) async {
    final SharedPreferences prefInstance =
    await SharedPreferences.getInstance();
    Locale cacheLocale = locale;
    if (prefInstance.containsKey("language_code")) {
      cacheLocale = Locale(prefInstance.get("language_code"));
    }
    debugPrint('Load new language: ${cacheLocale.languageCode}');
    return AppTranslations.load(cacheLocale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}
