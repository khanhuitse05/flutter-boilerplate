import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'application.dart';

class AppTranslations {
  Locale locale;
  Map<dynamic, dynamic> localisedValues = {};

  AppTranslations(this.locale);

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    appTranslations = AppTranslations(locale);
    Map<dynamic, dynamic> _tmpLocale;
    final String _localeCode = locale.languageCode;
    // Load multiple language file
    for (int i = 0; i < Application.instance.locale[_localeCode].length; i++) {
      final String jsonContent = await rootBundle.loadString(
          "assets/locale/$_localeCode/${Application.instance.locale[_localeCode][i]}.json");
      _tmpLocale = json.decode(jsonContent);
      appTranslations.localisedValues.addAll(_tmpLocale);
    }
    return appTranslations;
  }

  String get currentLanguage => locale.languageCode;

  /// Detects if _localisedValues has the given key
  /// for translation
  bool isKeyExist(String key) => localisedValues.containsKey(key);

  String text(String key) {
    return localisedValues[key] ?? "$key";
  }

  String textFormat(String key, List<dynamic> replace) {
    String _value = localisedValues[key] ?? "$key";
    for (int i = 0; i < replace.length; i++) {
      _value = _value.replaceAll('{$i}', replace[i].toString());
    }
    return _value;
  }
}

AppTranslations appTranslations;
