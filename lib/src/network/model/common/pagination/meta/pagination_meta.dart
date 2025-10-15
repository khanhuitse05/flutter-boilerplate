import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta.freezed.dart';
part 'pagination_meta.g.dart';

@freezed
abstract class MPaginationMeta with _$MPaginationMeta {
  const factory MPaginationMeta({
    @JsonKey(name: 'page_size') required int pageSize,
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'page_number') required int pageNumber,
    @Default(0) @JsonKey(name: 'prev_page') int? prevPage,
    @Default(0) @JsonKey(name: 'next_page') int? nextPage,
    @JsonKey(name: 'last_page') required int lastPage,
  }) = _MPaginationMeta;

  factory MPaginationMeta.fromJson(Map<String, Object?> json) =>
      _$MPaginationMetaFromJson(json);
}
