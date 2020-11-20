import 'package:flutter/material.dart';

class FormGroup extends ChangeNotifier {
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  /// list of formControls
  final Map<String, FormControl> controls;

  FormGroup._(this.controls);

  factory FormGroup(List<dynamic> forms) {
    final Map<String, FormControl> controlList = {};

    /// Loop through the formControl List
    /// for validation and format
    for (final item in forms) {
      assert(
      item is String || item is FormControl, "Control is incorrect type");

      /// its FormControl instance, just simply add it to the controlList
      if (item is FormControl) {
        controlList[item.key] = item;
        continue;
      }

      /// Identifier is empty
      /// add an empty FormControl instance
      if (item is String) {
        controlList[item] = FormControl(item);
        continue;
      }
    }
    return FormGroup._(controlList);
  }

  TextEditingController getController(String key) =>
      getFormControl(key).controller;

  FocusNode getNode(String key) => getFormControl(key).focusNode;

  FormControl getFormControl(String key) {
    if (controls.containsKey(key) == false) {
      controls[key] = FormControl(key);
    }
    return controls[key];
  }

  String getValue(String controlName) {
    return getFormControl(controlName).value;
  }

  /// Return a map contain all value
  Map getAllValue() {
    final result = <String, dynamic>{};
    controls.forEach((mapKey, mapValue) {
      result[mapKey] = getValue(mapKey);
    });
    return result;
  }
}

class FormControl {
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  final String key;
  factory FormControl(String key, {String initialValue}) {
    return FormControl._(key, initialValue);
  }

  /// Creates a new FormControl instance
  /// the [initialValue] can be null
  FormControl._(this.key, String initialValue) {
    if (initialValue != null) {
      controller.text = initialValue;
    }
  }

  /// Form Control value
  String get value => controller.text;
}
