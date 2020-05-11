import 'package:my_app/locale/app_translations.dart';
import 'package:flutter/material.dart';
import 'application.dart';

class LanguageButton extends StatefulWidget {
  @override
  _LanguageButtonState createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {

  Map flags;

  List<String> get languageCodesList =>
      Application.instance.supportedLanguagesCodes;
  String get selectedLanguageCode => appTranslations.currentLanguage;

  @override
  void initState() {
    super.initState();

    flags = {};
    for (var i = 0; i < languageCodesList.length; i++) {
      final code = languageCodesList[i];
      flags[code]= 'assets/images/locale/$code.png';
      if(code == selectedLanguageCode){
        currentIndex = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        clickLanguage(context);
      },
      icon: Container(
        width: 24,
        height: 24,
        child:
        Image.asset(flags[selectedLanguageCode] ?? flags['en']),
      ),
    );
  }

  int currentIndex;
  void clickLanguage(BuildContext context) {
    currentIndex++;
    if(currentIndex >= languageCodesList.length){
      currentIndex = 0;
    }
    Application.instance.changeLanguage(languageCodesList[currentIndex]);
    setState(() {});

  }
}
