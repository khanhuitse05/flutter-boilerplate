import 'package:my_app/src/content/form.dart';

class Validator {
  static String? phone(String? value) {
    const String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    final RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return Form.phoneEmpty;
    } else if (!regExp.hasMatch(value)) {
      return Form.phoneInvalid;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return Form.emailEmpty;
    }
    const String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return Form.emailInvalid;
    }
    return null;
  }
}
