import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UIManager {
  BoxDecoration get _testDecoration => BoxDecoration(
        color: Colors.white,
        image: const DecorationImage(
          image: NetworkImage(
              'https:///flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: Color(0xFFEDEDED),
          width: 1,
          style: BorderStyle.solid,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha(70),
            offset: Offset(1.0, 4.0),
            blurRadius: 5.0,
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Colors.white10,
            Color(0xfff4f4f4),
            Color(0xffeaeaea),
            Color(0xfff4f4f4)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
      );
}
