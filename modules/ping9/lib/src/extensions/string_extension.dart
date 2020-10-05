
extension StringExtensions on String{

  String toUpperCaseFirst() {
    return split(' ').map((word) {
      final String leftText =
      (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

  static bool isNullOrEmpty(String value){
    return value?.trim()?.isEmpty ?? true;
  }
}