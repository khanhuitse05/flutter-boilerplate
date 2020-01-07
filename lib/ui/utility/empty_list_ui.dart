import 'package:chat_app/core/utility.dart';
import 'package:flutter/material.dart';

class EmptyListUI extends StatelessWidget {
  EmptyListUI({this.image, this.title, this.body, this.oneMoreWidget});

  final title;
  final body;
  final Widget image;
  final Widget oneMoreWidget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Icon(
              Icons.redeem,
              size: 30,
            ),
          ),
          Utility.isNullOrEmpty(title)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.title,
                    textAlign: TextAlign.center,
                  ),
                ),
          Utility.isNullOrEmpty(body)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    body,
                    textAlign: TextAlign.center,
                  ),
                ),
          oneMoreWidget == null
              ? Container()
              : Container(
                  margin: EdgeInsets.only(top: 20),
                  child: oneMoreWidget,
                )
        ],
      ),
    );
  }
}
