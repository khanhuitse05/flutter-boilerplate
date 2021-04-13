import 'package:flutter/material.dart';
import 'package:my_app/src/utils/index.dart';

class TextChip extends StatelessWidget {
  const TextChip(this.text, {this.style, this.isHighLight = false});

  final String text;
  final TextStyle? style;
  final bool isHighLight;

  @override
  Widget build(BuildContext context) {
    if (isNullOrEmpty(text)) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: isHighLight ? const Color(0xFF1A8CFF) : const Color(0xFF636478),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Text(text),
      ),
    );
  }
}
