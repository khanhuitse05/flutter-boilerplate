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
  String get selectedLanguageCode => Application.instance.language;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    flags = new Map();
    for (var i = 0; i < languageCodesList.length; i++) {
      var code = languageCodesList[i];
      flags[code]= 'assets/images/locale/$code.png';
      if(code == selectedLanguageCode){
        currentIndex = i;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        clickLanguage(context);
      },
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: 24,
          height: 24,
          child:
              Image.asset(flags[selectedLanguageCode] ?? flags['en']),
        ),
        Container(
          color: Colors.transparent,
          height: 40,
          width: 40,
        )
      ]),
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
