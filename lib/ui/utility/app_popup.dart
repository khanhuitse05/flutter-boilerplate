import 'package:flutter/material.dart';

class AppPopup {
  static TextStyle _styleTitle({Color color = Colors.black87}) {
    return TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 16);
  }

  static TextStyle _styleBody({Color color = Colors.black87}) {
    return TextStyle(
        color: color, fontWeight: FontWeight.w400, fontSize: 14);
  }

  static Future<void> showCustomDialog(BuildContext context,
      {String title,
        List<Widget> content,
        List<Widget> actions,
        bool barrierDismissible = true}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: _styleTitle(),
            textAlign: TextAlign.center,
          ),
          contentTextStyle: _styleBody(),
          content: SingleChildScrollView(
            child: ListBody(
              children: content,
            ),
          ),
          actions: actions,
        );
      },
    );
  }
}

TextStyle _styleButton({Color color}) {
  return TextStyle(color: color, fontWeight: FontWeight.w500, fontSize: 14);
}

class ButtonNormal extends StatelessWidget {
  ButtonNormal({this.title, this.callback});

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: _styleButton(color: Colors.black87),
      ),
      onPressed: () {
        Navigator.pop(context);
        if (callback != null) callback();
      },
    );
  }
}

class ButtonHighLight extends StatelessWidget {
  ButtonHighLight({this.title, this.callback});

  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        title,
        style: _styleButton(color: Colors.white),
      ),
      onPressed: () {
        Navigator.pop(context);
        if (callback != null) callback();
      },
    );
  }
}
