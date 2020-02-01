import 'package:flutter/material.dart';
import 'package:chat_app/locale/app_translations.dart';
import 'package:chat_app/locale/language_button.dart';
import 'package:chat_app/provider/utility/navigation_provider.dart';
import 'package:chat_app/ui/button/text_button.dart';
import 'package:chat_app/ui/utility/app_popup.dart';
import 'package:chat_app/ui/utility/app_snackbar.dart';
import 'package:chat_app/ui/utility/progress_dialog.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppTranslations.of(context).text('welcome')),
        actions: <Widget>[
          LanguageButton(),
          IconButton(
            icon: Icon(Icons.category),
            onPressed: () {
              Provider.of<NavigationProvider>(context, listen: false)
                  .switchTo(PageName.category.index);
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Show Popup'),
              onPressed: () {
                AppPopup.showCustomDialog(
                  context,
                  title: 'Title',
                  content: [
                    FlutterLogo(),
                    Text('Message \n Message 2 \n Message 3 \n Message 4 \n Message 5 \n Message 6'),
                    Text('Message \n Message 2 \n Message 3 \n Message 4 \n Message 5 \n Message 6'),
                    Text('Message \n Message 2 \n Message 3 \n Message 4 \n Message 5 \n Message 6'),
                    Text('Message \n Message 2 \n Message 3 \n Message 4 \n Message 5 \n Message 6'),
                    Text('Message \n Message 2 \n Message 3 \n Message 4 \n Message 5 \n Message 6'),
                  ],
                  actions: [
                    ButtonNormal(title: 'Normal', callback: () {}),
                    ButtonHighLight(title: 'Highlight', callback: () {}),
                    ButtonHighLight(title: 'Yes', callback: () {}),
                    ButtonHighLight(title: 'No', callback: () {}),
                  ],
                );
              },
            ),
            TextButton('Show loading', onPressed: (){
              _showLoadingFiveSec();
            },),
          ],
        ),
      ),
    );
  }

  _showLoadingFiveSec()async{
    showLoading(context, message: 'Start\ncountdown');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 4');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 3');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 2');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('Countdown: 1');
    await Future.delayed(Duration(seconds: 1));
    updateLoading('');
    await Future.delayed(Duration(seconds: 1));
    hideLoading(context);
    await Future.delayed(Duration(seconds: 1));
    AppSnackBar.showSnackBar(context, 'Test Snack bar');
  }
}
