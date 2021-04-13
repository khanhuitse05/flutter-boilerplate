import 'package:flutter/material.dart';

class ThemeBlocks extends StatelessWidget {
  const ThemeBlocks(
      {this.child, this.level = ElevationLevel.dp_2, this.borderRadius = 5});

  final Widget? child;
  final ElevationLevel level;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: !isDark
              ? Colors.white
              : Colors.white.withAlpha(getAlphaByLevel()),
          boxShadow: isDark
              ? null
              : [
                  BoxShadow(
                    color: Colors.black38,
                    offset: const Offset(1, 3),
                    blurRadius: (level.index.toDouble()) / 2,
                  ),
                ],
          border: isDark && level == ElevationLevel.dp_0
              ? Border.all(color: Colors.white.withAlpha(41))
              : null),
      child: child,
    );
  }

  int getAlphaByLevel() {
    switch (level) {
      case ElevationLevel.dp_1:
        return 13;
      case ElevationLevel.dp_2:
        return 18;
      case ElevationLevel.dp_3:
        return 20;
      case ElevationLevel.dp_4:
        return 23;
      case ElevationLevel.dp_6:
        return 28;
      case ElevationLevel.dp_8:
        return 31;
      case ElevationLevel.dp_12:
        return 36;
      case ElevationLevel.dp_16:
        return 38;
      case ElevationLevel.dp_24:
        return 40;
      default:
        return 0;
    }
  }
}

enum ElevationLevel {
  dp_0,
  dp_1,
  dp_2,
  dp_3,
  dp_4,
  dp_6,
  dp_8,
  dp_12,
  dp_16,
  dp_24,
}
