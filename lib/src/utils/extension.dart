extension StringUrl on String {
  String urlTrim() {
    String text = trim().toLowerCase();
    for (final e in ['https://www.', 'http://www.', 'https://', 'http://']) {
      if (text.indexOf(e) == 0) {
        text = text.substring(e.length);
      }
    }
    if (text.isNotEmpty && text[text.length - 1] == '/') {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }
}
