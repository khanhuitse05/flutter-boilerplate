import 'package:flutter/material.dart';

class AppStyles {
  ///
  static TextStyle h1({Color color}) {
    return TextStyle(color: color, fontSize: 24, fontWeight: FontWeight.w700);
  }

  ///
  static TextStyle h2({Color color}) {
    return TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.w600);
  }

  ///
  static TextStyle h3({Color color}) {
    return TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500);
  }

  ///
  static TextStyle h4({Color color}) {
    return TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400);
  }

  ///
  static TextStyle title({Color color = Colors.black87}) {
    return TextStyle(color: color, fontSize: 16, );
  }
  ///
  static TextStyle paragraph({Color color = Colors.black87}) {
    return TextStyle(color: color, fontSize: 14, );
  }

}

class AppFonts{
  static const regular= '';
}