import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String newText = newValue.text;
    newText = newText.replaceAll(',', '');

    int value = int.parse(newValue.text);
    final formatter = new NumberFormat("###,###", "en_US");
    newText = formatter.format(value);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}

class OTPInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String newText = newValue.text;

    if (oldValue.text.contains('_') && newText.length == 5) {
      newText = newText.replaceAll('_', '');
      if (newText.length > 0) {
        newText = newText.substring(0, newText.length - 1);
      }
    }

    newText = newText.replaceAll('_', '');
    for (int i = newText.length; i < 6; i++) {
      newText += '_';
    }
    newText = newText.substring(0, 6);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
