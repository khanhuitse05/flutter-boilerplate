import 'dart:io';
import 'package:chat_app/locale/app_translations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIManager {

  static get decorationBorder => BoxDecoration(
    color: Colors.white,
    border: new Border.all(
      color: Color(0xFFEDEDED),
      width: 1,
      style: BorderStyle.solid,
    ),
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withAlpha(70),
        offset: Offset(1.0, 4.0),
        blurRadius: 5.0,
      ),
    ],
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  );

  static Widget btnClose({VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withAlpha(70),
              offset: Offset(1.0, 4.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Icon(
          Icons.close,
          color: Colors.black45,
        ),
      ),
    );
  }

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

  static defaultIndicator() {
    if (Platform.isIOS) {
      return CupertinoActivityIndicator(radius: 15,);
    } else {
      return SizedBox(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          strokeWidth: 3,
        ),
      );
    }
  }
}

