import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'models_gen.g.dart';

@JsonSerializable()
class User {
  String id;
  String email;
  @JsonKey(name: 'user_name', includeIfNull: true)
  String userName;
  String gender;
  String avatar;

  User({this.id, this.email, this.userName, this.gender, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
