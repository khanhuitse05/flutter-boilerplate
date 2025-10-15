import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_model.freezed.dart';
part 'upload_model.g.dart';

@freezed
abstract class MUpload with _$MUpload {
  const factory MUpload({
    required String url,
  }) = _MUpload;

  factory MUpload.fromJson(Map<String, Object?> json) =>
      _$MUploadFromJson(json);
}
