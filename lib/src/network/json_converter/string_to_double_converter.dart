import 'package:freezed_annotation/freezed_annotation.dart';

class StringToDoubleConverter implements JsonConverter<double, String> {
  const StringToDoubleConverter();

  @override
  double fromJson(String json) {
    return double.tryParse(json) ?? 0.0;
  }

  @override
  String toJson(double object) {
    return object.toString();
  }
}
