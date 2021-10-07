import 'package:flutter/material.dart';
import 'package:my_app/widgets/button/bottom_bar_button.dart';

class OrderNextButton extends StatelessWidget {
  const OrderNextButton({required this.onPressed, Key? key}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return XBottomAppBar(
      child: ElevatedButton(
        child: Text('Next'),
        onPressed: onPressed,
      ),
    );
  }
}
