import 'package:myapp/src/network/model/common/handle.dart';
import 'package:myapp/src/network/model/common/pagination/pagination_response.dart';
import 'package:myapp/src/network/model/common/result.dart';

class MPagination<T> {
  MPagination({
    this.pageLimit = defaultPageLimit,
    this.page = 0,
    this.data = const [],
    this.totalPage = -1,
    this.countData = -1,
    this.status = MStatus.initial,
  });

  static const int defaultPageLimit = 10;

  final int totalPage;
  final int countData;
  final int pageLimit;
  final int page;
  List<T> data;
  final MStatus status;
  bool get hasMore =>
      (totalPage < 0 || page < totalPage) ||
      (countData < 0 || data.length < countData);
  bool get canNext => hasMore && status == MStatus.initial;
  bool get canLoad => hasMore && status != MStatus.loading;
  T? get lastDoc => data.isNotEmpty ? data.last : null;

  bool get isLoading => status.isLoading;
  bool get isFirstLoading => status.isLoading && data.isEmpty;
  bool get isFirstError => status.isFailure && data.isEmpty;
  bool get isEmpty => status == MStatus.initial && data.isEmpty && page == 1;
  bool get isPure => status == MStatus.initial && page == 0;
  MPagination<T> addAll(
    List<T> items, {
    int? totalPage,
    int? countData,
  }) {
    final data = [...this.data, ...items];
    return copyWith(
      data: data,
      page: page + 1,
      totalPage: totalPage ?? this.totalPage,
      countData: countData ?? this.countData,
      status: MStatus.initial,
    );
  }

  MPagination<T> addAllFromModel(MPaginationResponse<T> model) {
    final data = [...this.data, ...model.data];
    return copyWith(
      data: data,
      page: page + 1,
      totalPage: model.meta.pageNumber,
      countData: model.meta.totalCount,
      status: MStatus.initial,
    );
  }

  MPagination<T> addAllFromResult(MResult<MPaginationResponse<T>> result) {
    if (result.isSuccess && result.data != null) {
      return addAllFromModel(result.data!);
    } else {
      return copyWith(status: MStatus.failure);
    }
  }

  MPagination<T> toLoading() {
    return copyWith(status: MStatus.loading);
  }

  MPagination<T> copyWith({
    int? page,
    List<T>? data,
    int? totalPage,
    int? countData,
    int? pageLimit,
    MStatus? status,
  }) {
    return MPagination<T>(
      page: page ?? this.page,
      data: data ?? this.data,
      totalPage: totalPage ?? this.totalPage,
      countData: countData ?? this.countData,
      pageLimit: pageLimit ?? this.pageLimit,
      status: status ?? this.status,
    );
  }
}
