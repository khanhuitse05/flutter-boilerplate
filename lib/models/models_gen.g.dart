// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models_gen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    email: json['email'] as String,
    userName: json['userName'] as String,
  )
    ..gender = json['gender'] as String
    ..avatar = json['avatar'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'gender': instance.gender,
      'avatar': instance.avatar,
    };
