import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({this.title = 'Empty view'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '404',
              style: Theme.of(context).textTheme.display2,
            ),
            Text(
              'OOPS! TRANG KHÔNG TỒN TẠI',
              style: Theme.of(context).textTheme.title,
            ),
            const SizedBox(height: 10),
            RaisedButton(
              child: Text(
                'TRỞ VỀ TRANG CHỦ',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .merge(TextStyle(color: Colors.white)),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
