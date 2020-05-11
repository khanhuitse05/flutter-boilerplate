import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/utility.dart';

class EmptyListUI extends StatelessWidget {
  const EmptyListUI({this.image, this.title, this.body, this.oneMoreWidget});

  final String title;
  final String body;
  final Widget image;
  final Widget oneMoreWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: image ??
                Icon(
                  MaterialCommunityIcons.file_document_box_multiple_outline,
                  size: 80,
                  color: Colors.grey,
                ),
          ),
          if (isNullOrEmpty(title) == false)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
          if (isNullOrEmpty(body) == false)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                body,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          if (oneMoreWidget != null)
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: oneMoreWidget,
            )
        ],
      ),
    );
  }
}
