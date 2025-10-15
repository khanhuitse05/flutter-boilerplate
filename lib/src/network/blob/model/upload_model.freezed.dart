// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MUpload implements DiagnosticableTreeMixin {
  String get url;

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MUploadCopyWith<MUpload> get copyWith =>
      _$MUploadCopyWithImpl<MUpload>(this as MUpload, _$identity);

  /// Serializes this MUpload to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MUpload'))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MUpload &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MUpload(url: $url)';
  }
}

/// @nodoc
abstract mixin class $MUploadCopyWith<$Res> {
  factory $MUploadCopyWith(MUpload value, $Res Function(MUpload) _then) =
      _$MUploadCopyWithImpl;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$MUploadCopyWithImpl<$Res> implements $MUploadCopyWith<$Res> {
  _$MUploadCopyWithImpl(this._self, this._then);

  final MUpload _self;
  final $Res Function(MUpload) _then;

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_self.copyWith(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MUpload with DiagnosticableTreeMixin implements MUpload {
  const _MUpload({required this.url});
  factory _MUpload.fromJson(Map<String, dynamic> json) =>
      _$MUploadFromJson(json);

  @override
  final String url;

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MUploadCopyWith<_MUpload> get copyWith =>
      __$MUploadCopyWithImpl<_MUpload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MUploadToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MUpload'))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MUpload &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MUpload(url: $url)';
  }
}

/// @nodoc
abstract mixin class _$MUploadCopyWith<$Res> implements $MUploadCopyWith<$Res> {
  factory _$MUploadCopyWith(_MUpload value, $Res Function(_MUpload) _then) =
      __$MUploadCopyWithImpl;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$MUploadCopyWithImpl<$Res> implements _$MUploadCopyWith<$Res> {
  __$MUploadCopyWithImpl(this._self, this._then);

  final _MUpload _self;
  final $Res Function(_MUpload) _then;

  /// Create a copy of MUpload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
  }) {
    return _then(_MUpload(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
