import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlContent extends StatelessWidget {

  const HtmlContent(this.text,{this.textAlign = TextAlign.left});
  final String text;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Html(
      customTextAlign: (node) {
        return textAlign;
      },
      useRichText: true,
      data: text,
    );
  }
}
