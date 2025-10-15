import 'package:flutter/material.dart';

class SignTitle extends StatelessWidget {
  const SignTitle(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 100, 32, 0),
      alignment: Alignment.topCenter,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
