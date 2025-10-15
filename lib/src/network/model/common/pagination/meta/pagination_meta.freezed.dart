// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination_meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MPaginationMeta implements DiagnosticableTreeMixin {
  @JsonKey(name: 'page_size')
  int get pageSize;
  @JsonKey(name: 'total_count')
  int get totalCount;
  @JsonKey(name: 'page_number')
  int get pageNumber;
  @JsonKey(name: 'prev_page')
  int? get prevPage;
  @JsonKey(name: 'next_page')
  int? get nextPage;
  @JsonKey(name: 'last_page')
  int get lastPage;

  /// Create a copy of MPaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MPaginationMetaCopyWith<MPaginationMeta> get copyWith =>
      _$MPaginationMetaCopyWithImpl<MPaginationMeta>(
          this as MPaginationMeta, _$identity);

  /// Serializes this MPaginationMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MPaginationMeta'))
      ..add(DiagnosticsProperty('pageSize', pageSize))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty('pageNumber', pageNumber))
      ..add(DiagnosticsProperty('prevPage', prevPage))
      ..add(DiagnosticsProperty('nextPage', nextPage))
      ..add(DiagnosticsProperty('lastPage', lastPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MPaginationMeta &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageSize, totalCount, pageNumber,
      prevPage, nextPage, lastPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MPaginationMeta(pageSize: $pageSize, totalCount: $totalCount, pageNumber: $pageNumber, prevPage: $prevPage, nextPage: $nextPage, lastPage: $lastPage)';
  }
}

/// @nodoc
abstract mixin class $MPaginationMetaCopyWith<$Res> {
  factory $MPaginationMetaCopyWith(
          MPaginationMeta value, $Res Function(MPaginationMeta) _then) =
      _$MPaginationMetaCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'page_size') int pageSize,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'page_number') int pageNumber,
      @JsonKey(name: 'prev_page') int? prevPage,
      @JsonKey(name: 'next_page') int? nextPage,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class _$MPaginationMetaCopyWithImpl<$Res>
    implements $MPaginationMetaCopyWith<$Res> {
  _$MPaginationMetaCopyWithImpl(this._self, this._then);

  final MPaginationMeta _self;
  final $Res Function(MPaginationMeta) _then;

  /// Create a copy of MPaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageSize = null,
    Object? totalCount = null,
    Object? pageNumber = null,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
    Object? lastPage = null,
  }) {
    return _then(_self.copyWith(
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: freezed == prevPage
          ? _self.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MPaginationMeta with DiagnosticableTreeMixin implements MPaginationMeta {
  const _MPaginationMeta(
      {@JsonKey(name: 'page_size') required this.pageSize,
      @JsonKey(name: 'total_count') required this.totalCount,
      @JsonKey(name: 'page_number') required this.pageNumber,
      @JsonKey(name: 'prev_page') this.prevPage = 0,
      @JsonKey(name: 'next_page') this.nextPage = 0,
      @JsonKey(name: 'last_page') required this.lastPage});
  factory _MPaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$MPaginationMetaFromJson(json);

  @override
  @JsonKey(name: 'page_size')
  final int pageSize;
  @override
  @JsonKey(name: 'total_count')
  final int totalCount;
  @override
  @JsonKey(name: 'page_number')
  final int pageNumber;
  @override
  @JsonKey(name: 'prev_page')
  final int? prevPage;
  @override
  @JsonKey(name: 'next_page')
  final int? nextPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;

  /// Create a copy of MPaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MPaginationMetaCopyWith<_MPaginationMeta> get copyWith =>
      __$MPaginationMetaCopyWithImpl<_MPaginationMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MPaginationMetaToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MPaginationMeta'))
      ..add(DiagnosticsProperty('pageSize', pageSize))
      ..add(DiagnosticsProperty('totalCount', totalCount))
      ..add(DiagnosticsProperty('pageNumber', pageNumber))
      ..add(DiagnosticsProperty('prevPage', prevPage))
      ..add(DiagnosticsProperty('nextPage', nextPage))
      ..add(DiagnosticsProperty('lastPage', lastPage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MPaginationMeta &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.pageNumber, pageNumber) ||
                other.pageNumber == pageNumber) &&
            (identical(other.prevPage, prevPage) ||
                other.prevPage == prevPage) &&
            (identical(other.nextPage, nextPage) ||
                other.nextPage == nextPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pageSize, totalCount, pageNumber,
      prevPage, nextPage, lastPage);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MPaginationMeta(pageSize: $pageSize, totalCount: $totalCount, pageNumber: $pageNumber, prevPage: $prevPage, nextPage: $nextPage, lastPage: $lastPage)';
  }
}

/// @nodoc
abstract mixin class _$MPaginationMetaCopyWith<$Res>
    implements $MPaginationMetaCopyWith<$Res> {
  factory _$MPaginationMetaCopyWith(
          _MPaginationMeta value, $Res Function(_MPaginationMeta) _then) =
      __$MPaginationMetaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page_size') int pageSize,
      @JsonKey(name: 'total_count') int totalCount,
      @JsonKey(name: 'page_number') int pageNumber,
      @JsonKey(name: 'prev_page') int? prevPage,
      @JsonKey(name: 'next_page') int? nextPage,
      @JsonKey(name: 'last_page') int lastPage});
}

/// @nodoc
class __$MPaginationMetaCopyWithImpl<$Res>
    implements _$MPaginationMetaCopyWith<$Res> {
  __$MPaginationMetaCopyWithImpl(this._self, this._then);

  final _MPaginationMeta _self;
  final $Res Function(_MPaginationMeta) _then;

  /// Create a copy of MPaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageSize = null,
    Object? totalCount = null,
    Object? pageNumber = null,
    Object? prevPage = freezed,
    Object? nextPage = freezed,
    Object? lastPage = null,
  }) {
    return _then(_MPaginationMeta(
      pageSize: null == pageSize
          ? _self.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      totalCount: null == totalCount
          ? _self.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: null == pageNumber
          ? _self.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      prevPage: freezed == prevPage
          ? _self.prevPage
          : prevPage // ignore: cast_nullable_to_non_nullable
              as int?,
      nextPage: freezed == nextPage
          ? _self.nextPage
          : nextPage // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _self.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
