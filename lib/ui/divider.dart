import 'package:flutter/material.dart';

class DividerBlock extends StatelessWidget {
  final double height;
  final Color color;
  DividerBlock(this.height, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: color
      ),
    );
  }
}
