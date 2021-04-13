import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/utils/index.dart';
import 'package:my_app/src/widget/common/indicator.dart';

class StateLoadingUI extends StatelessWidget {
  const StateLoadingUI({this.title = "Loading..."});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Indicator(),
          if (isNullOrEmpty(title) == false)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(title),
            ),
        ],
      ),
    );
  }
}
