import 'package:flutter/material.dart';

class ViewMoreButton extends StatelessWidget {
  ViewMoreButton({this.title = 'View more', this.onPressed});

  final title;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          SizedBox(width: 5),
          Icon(Icons.navigate_next)
        ],
      ),
    );
  }
}
