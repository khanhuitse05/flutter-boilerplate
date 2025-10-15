import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DevTitle extends StatelessWidget {
  const DevTitle(this.title,
      {this.body, this.horizontalPadding = 16, super.key});
  final String title;
  final String? body;
  final double horizontalPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.fromLTRB(horizontalPadding, 24, horizontalPadding, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (body != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Text(body!),
            ),
        ],
      ),
    );
  }
}
