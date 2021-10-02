import 'package:flutter/material.dart';

class XStateErrorWidget extends StatelessWidget {
  const XStateErrorWidget({this.onReload, Key? key}) : super(key: key);

  final VoidCallback? onReload;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onReload,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.error_outline),
            Text('Something went wrong, try again...')
          ],
        ),
      ),
    );
  }
}
