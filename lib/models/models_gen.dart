
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';


part 'models_gen.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id', includeIfNull: true)
  String id;
  @JsonKey(name: 'email', includeIfNull: true)
  String email;
  @JsonKey(name: 'userName', includeIfNull: true)
  String userName;

  @JsonKey(name: 'gender', includeIfNull: true)
  String gender;
  @JsonKey(name: 'avatar', includeIfNull: true)
  String avatar;

  User({this.id, this.email, this.userName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
