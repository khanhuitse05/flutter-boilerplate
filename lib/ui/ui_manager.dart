import 'package:chat_app/locale/app_translations.dart';
import 'package:flutter/material.dart';

class UIManager {
  static get decorationBorder => BoxDecoration(
      color: Colors.white,
      border: new Border.all(
        color: Color(0xFFEDEDED),
        width: 1,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(5)));

  static Widget btnViewAll(String text, {VoidCallback onPressed}) {
    return MaterialButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        child: Row(
          children: <Widget>[
            Text(text),
            Icon(
              Icons.navigate_next,
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildErrorLoading(BuildContext context, VoidCallback onReload) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            color: Colors.grey,
            size: 40,
          ),
          Text(AppTranslations.of(context).text('load_error_message')),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            child: Text(AppTranslations.of(context).text('reload')),
            onPressed: onReload,
          )
        ],
      ),
    );
  }
}

class ButtonData {
  ButtonData({this.title, this.callback});

  String title;
  VoidCallback callback;

  Widget buildNormal(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      alignment: AlignmentDirectional.topCenter,
      child: RaisedButton(
        color: Colors.white,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .button
              .merge(TextStyle(color: Colors.black12)),
        ),
        onPressed: () {
          Navigator.pop(context);
          if (callback != null) callback();
        },
      ),
    );
  }

  Widget buildHighlight(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, right: 10),
      alignment: AlignmentDirectional.topCenter,
      child: RaisedButton(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .button
              .merge(TextStyle(color: Colors.white)),
        ),
        onPressed: () {
          Navigator.pop(context);
          if (callback != null) callback();
        },
      ),
    );
  }
}
