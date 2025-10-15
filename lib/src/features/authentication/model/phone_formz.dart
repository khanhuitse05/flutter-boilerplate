import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'form_error.dart';

class PhoneFormzInput extends FormzInput<String, FormError> {
  const PhoneFormzInput.pure([super.value = '']) : super.pure();
  const PhoneFormzInput.dirty([super.value = '']) : super.dirty();

  static final RegExp phoneRegExp = RegExp(
    r'0([3|5|7|8|9])+([0-9]{8})\b',
  );

  @override
  FormError? validator(String? value) {
    if ((value ?? '').isEmpty) {
      return FormError.empty;
    }
    return phoneRegExp.hasMatch(value ?? '') ? null : FormError.invalid;
  }

  String? errorOf(BuildContext context) {
    if (isPure) {
      return null;
    }

    switch (error) {
      case FormError.empty:
        return S.of(context).error_fieldRequired;
      case FormError.invalid:
        return "Phone Invalid";
      default:
        return null;
    }
  }
}
