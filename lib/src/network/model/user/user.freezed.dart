// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MUser {
  String get id;
  String? get name;
  String? get avatar;
  String? get email;

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MUserCopyWith<MUser> get copyWith =>
      _$MUserCopyWithImpl<MUser>(this as MUser, _$identity);

  /// Serializes this MUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar, email);

  @override
  String toString() {
    return 'MUser(id: $id, name: $name, avatar: $avatar, email: $email)';
  }
}

/// @nodoc
abstract mixin class $MUserCopyWith<$Res> {
  factory $MUserCopyWith(MUser value, $Res Function(MUser) _then) =
      _$MUserCopyWithImpl;
  @useResult
  $Res call({String id, String? name, String? avatar, String? email});
}

/// @nodoc
class _$MUserCopyWithImpl<$Res> implements $MUserCopyWith<$Res> {
  _$MUserCopyWithImpl(this._self, this._then);

  final MUser _self;
  final $Res Function(MUser) _then;

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MUser extends MUser {
  const _MUser({required this.id, this.name, this.avatar, this.email})
      : super._();
  factory _MUser.fromJson(Map<String, dynamic> json) => _$MUserFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String? avatar;
  @override
  final String? email;

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MUserCopyWith<_MUser> get copyWith =>
      __$MUserCopyWithImpl<_MUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, avatar, email);

  @override
  String toString() {
    return 'MUser(id: $id, name: $name, avatar: $avatar, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$MUserCopyWith<$Res> implements $MUserCopyWith<$Res> {
  factory _$MUserCopyWith(_MUser value, $Res Function(_MUser) _then) =
      __$MUserCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String? name, String? avatar, String? email});
}

/// @nodoc
class __$MUserCopyWithImpl<$Res> implements _$MUserCopyWith<$Res> {
  __$MUserCopyWithImpl(this._self, this._then);

  final _MUser _self;
  final $Res Function(_MUser) _then;

  /// Create a copy of MUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? avatar = freezed,
    Object? email = freezed,
  }) {
    return _then(_MUser(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
