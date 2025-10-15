// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MSocialUser _$MSocialUserFromJson(Map<String, dynamic> json) => _MSocialUser(
      type: $enumDecode(_$MSocialTypeEnumMap, json['type']),
      userID: json['user_i_d'] as String?,
      accessToken: json['access_token'] as String?,
      idToken: json['id_token'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      birthDate: json['birth_date'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$MSocialUserToJson(_MSocialUser instance) =>
    <String, dynamic>{
      'type': _$MSocialTypeEnumMap[instance.type]!,
      'user_i_d': instance.userID,
      'access_token': instance.accessToken,
      'id_token': instance.idToken,
      'full_name': instance.fullName,
      'email': instance.email,
      'avatar': instance.avatar,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'phone': instance.phone,
    };

const _$MSocialTypeEnumMap = {
  MSocialType.facebook: 'facebook',
  MSocialType.google: 'google',
  MSocialType.email: 'email',
  MSocialType.apple: 'apple',
};
