import 'meta/pagination_meta.dart';

class MPaginationResponse<T> {
  factory MPaginationResponse.fromJson(Map<String, Object?> json,
      T Function(Map<String, Object?> json) jsonToObject) {
    return MPaginationResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => jsonToObject(e as Map<String, dynamic>))
          .toList(),
      meta: MPaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }
  MPaginationResponse({
    required this.data,
    required this.meta,
  });
  final List<T> data;
  final MPaginationMeta meta;
}
