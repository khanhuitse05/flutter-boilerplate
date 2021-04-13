import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({this.title = 'Empty view'});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '404',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'OOPS! PAGE NOT FOUND',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: Text(
                'BACH TO HOME',
                style: Theme.of(context)
                    .textTheme
                    .button
                    ?.merge(const TextStyle(color: Colors.white)),
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
