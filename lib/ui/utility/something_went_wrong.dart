import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  const SomethingWentWrong({this.onReload, this.image});

  final VoidCallback onReload;
  final Widget image;

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
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: image ??
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset('assets/images/ui/bullet_error.png'),
                  ),
            ),
            const Text('Something went wrong, tap to retry...')
          ],
        ),
      ),
    );
  }
}
