class Validator {
  static String phoneNumberValidator(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value == null || value.length == 0) {
      return 'Please enter your phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Your phone number is invalid';
    }
    return null;
  }
}
