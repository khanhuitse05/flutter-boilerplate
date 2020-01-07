import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  TextButton(this.title, {this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        title,
        style: TextStyle(
            color: Theme
                .of(context)
                .primaryColor,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
