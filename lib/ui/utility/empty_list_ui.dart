import 'package:my_app/core/utility.dart';
import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            child: image ??
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/ui/recycle_bin_empty.png'),
                ),
          ),
          if (Utility.isNullOrEmpty(title) == false)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
            ),
          if (Utility.isNullOrEmpty(body) == false)
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
