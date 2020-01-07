import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  SomethingWentWrong({this.onReload});
  final onReload;

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
            Icon(Icons.error, size: 25),
            Text('Có lỗi xảy ra, chạm để thử lại...')
          ],
        ),
      ),
    );
  }
}
