import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:my_app/core/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

import 'application.dart';

class AppTranslations {
  Map<dynamic, dynamic> localisedValues = new Map();

  AppTranslations(Locale newLocale) {
    locale = newLocale;
  }

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    appTranslations = AppTranslations(locale);
    Map<dynamic, dynamic> _tmpLocale;
    String _localeCode = locale.languageCode;
    // Load multiple language file
    for (int i = 0; i < Application.instance.locale[_localeCode].length; i++) {
      String jsonContent = await rootBundle.loadString(
          "assets/locale/$_localeCode/${Application.instance.locale[_localeCode][i]}.json");
      _tmpLocale = json.decode(jsonContent);
      appTranslations.localisedValues.addAll(_tmpLocale);
    }
    // Load Remote
    try {
      final response = await http
          .get(Application.instance.remoteUrl + 'remote_${locale.languageCode}.json')
          .timeout(Duration(seconds: 5));
      if (response.statusCode == HttpStatus.ok) {
        if (Utility.isNullOrEmpty(response.body) == false) {
          _tmpLocale = json.decode(utf8.decode(response.bodyBytes));
          appTranslations.localisedValues.addAll(_tmpLocale);
        }
      }
    } catch (e) {
      print("Decode locale remote fail");
    }
    // return
    return appTranslations;
  }


  Locale locale;
  get currentLanguage => locale.languageCode;
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