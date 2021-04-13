extension StringExtensions on String {
  String toUpperCaseFirst() {
    return split(' ').map((word) {
      final String leftText =
          (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  String getCharacterAvatar() {
    final re = RegExp(r'\b(\w)');
    var nameLabel = '';
    final Iterable<Match> matches = re.allMatches(this);
    if (matches.isNotEmpty) {
      final firstCharacter = matches.first.group(0)?.toUpperCase() ?? '';
      final lastCharacter = matches.last.group(0)?.toUpperCase() ?? '';
      nameLabel = matches.length > 1
          ? '$firstCharacter$lastCharacter'
          : '$firstCharacter';
    }
    return nameLabel.toString();
  }
}
