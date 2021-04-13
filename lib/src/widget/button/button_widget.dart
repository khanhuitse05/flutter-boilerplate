import 'package:flutter/material.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({required this.title, this.onPressed, Key? key})
      : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class AppDestructiveButton extends StatelessWidget {
  const AppDestructiveButton({required this.title, this.onPressed, Key? key})
      : super(key: key);

  final VoidCallback? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
