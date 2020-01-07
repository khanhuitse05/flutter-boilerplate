import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton(this.title, {this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
      child: FlatButton(
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .button
              .merge(TextStyle(color: Colors.white)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
