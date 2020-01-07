import 'package:flutter/material.dart';

import 'app_translations.dart';
import 'application.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  List<String> get languagesList => Application.instance.supportedLanguages;

  List<String> get languageCodesList =>
      Application.instance.supportedLanguagesCodes;

  String get selectedLanguageCode => appTranslations.currentLanguage;

  String get selectedLanguage => languagesMap[selectedLanguageCode];

  Map<dynamic, dynamic> languagesMap;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languagesMap = new Map();
    for (var i = 0; i < languageCodesList.length; i++) {
      languagesMap[languageCodesList[i]] = languagesList[i];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppTranslations.of(context).text("setting_language"),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              AppTranslations.of(context).text("setting_language_title"),
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: languageCodesList
                    .map((item) => buildButtonLanguage(context, item))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButtonLanguage(context, String code) {
    return Row(
      children: <Widget>[
        new Radio(
          activeColor: Theme.of(context).primaryColor,
          value: code,
          groupValue: selectedLanguageCode,
          onChanged: onChangeMyLanguage,
        ),
        new InkWell(
          onTap: () {
            onChangeMyLanguage(code);
          },
          child: Text(
            languagesMap[code],
            style: Theme.of(context).textTheme.title,
          ),
        ),
      ],
    );
  }

  void onChangeMyLanguage(Object value) {
    Application.instance.changeLanguage(value);

    setState(() {
    });
  }
}
