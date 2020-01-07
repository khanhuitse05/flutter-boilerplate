import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class HtmlContent extends StatelessWidget {

  HtmlContent(this.text,{this.textAlign = TextAlign.left});
  final text;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Html(
      customTextAlign: (dom.Node node) {
        return textAlign;
      },
      useRichText: true,
      data: """<div><p>${text}</p> </div>""",
    );
  }
}
