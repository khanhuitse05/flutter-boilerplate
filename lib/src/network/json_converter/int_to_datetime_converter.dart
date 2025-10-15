import 'package:freezed_annotation/freezed_annotation.dart';

class IntToDateTimeConverter implements JsonConverter<DateTime, int> {
  const IntToDateTimeConverter();

  @override
  DateTime fromJson(int json) {
    return DateTime.fromMillisecondsSinceEpoch(json * 1000);
  }

  @override
  int toJson(DateTime object) {
    return (object.millisecondsSinceEpoch / 1000).ceil();
  }
}
