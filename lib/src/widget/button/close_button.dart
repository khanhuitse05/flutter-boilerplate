import 'package:flutter/material.dart';

class CloseButton extends StatelessWidget {
  const CloseButton({this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withAlpha(70),
              offset: const Offset(1.0, 4.0),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: const Icon(
          Icons.close,
          color: Colors.black45,
        ),
      ),
    );
  }
}
