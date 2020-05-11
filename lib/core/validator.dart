class Validator {

  static String phone(String value) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final RegExp regExp =  RegExp(pattern);
    if (value == null || value.length == 0) {
      return 'Please enter your phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Your phone number is invalid';
    }
    return null;
  }

  static String email(String value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập E-mail';
    }
    const Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'E-mail không chính xác';
    }
    return null;
  }
}
