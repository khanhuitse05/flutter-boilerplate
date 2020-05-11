import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData primaryTheme = ThemeData(

  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
);
