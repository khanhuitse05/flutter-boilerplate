import 'dart:async';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class Application {

  static final Application instance = Application._internal();

  factory Application() => instance;

  Application._internal() {
    /// init
  }

  final List<String> supportedLanguages = [
    "English",
    "Tiếng việt",
  ];

  final List<String> supportedLanguagesCodes = [
    "en",
    "vi",
  ];

  final locale = {
    'en': [
      "main",
      "common",
    ],
    'vi': [
      "main",
      "common",
    ]
  };

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  var onLocaleChanged = StreamController<Locale>.broadcast();
  String language;

  changeLanguage(String languageCode) async {
    /// save to locale
    final prefInstance = await SharedPreferences.getInstance();
    prefInstance.setString("language_code", languageCode);

    /// set language
    language = languageCode;
    onLocaleChanged.add(Locale(languageCode));
  }
}