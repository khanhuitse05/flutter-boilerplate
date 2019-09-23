import 'package:chat_app/ui/progress_dialog.dart';
import 'package:chat_app/ui/snackbar.dart';
import 'package:flutter/material.dart';
import 'app_translations.dart';
import 'application.dart';

class LanguageButton extends StatefulWidget {
  @override
  _LanguageButtonState createState() => _LanguageButtonState();
}

class _LanguageButtonState extends State<LanguageButton> {
  final flags = {
    'vi': 'assets/images/locale/vi.png',
    'en': 'assets/images/locale/en.png',
  };

  @override
  Widget build(BuildContext context) {
    String languageCode = application.language;
    return InkWell(
      onTap: () {
        clickLanguage(context);
      },
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: 24,
          height: 24,
          child:
              Image.asset(flags[languageCode] ?? 'assets/images/locale/en.png'),
        ),
        Container(
          color: Colors.transparent,
          height: 40,
          width: 40,
        )
      ]),
    );
  }

  void clickLanguage(BuildContext context) async {
    String languageCode = application.language;
    String nextCode = languageCode == 'en' ? 'vi' : 'en';

    ProgressDialog pr = new ProgressDialog(context);
    pr.setMessage(
        AppTranslations.of(context).text('acc_setting_language_loading'));
    pr.show();
    bool success = await application.changeLanguage(nextCode);
    pr.hide();
    if (success) {
      setState(() {});
    } else {
      CustomSnackBar(
        AppTranslations.of(context).text('acc_setting_language_fail'),
        context: context,
      ).show();
    }
  }
}
