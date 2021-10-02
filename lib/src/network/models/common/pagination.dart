import 'handle.dart';

abstract class XPagination<T> {
  XPagination({this.pageCount = 15});
  final int pageCount;
  List<T> data = const [];
  bool hasMore = true;
  Status status = Status.none;
  bool get canNext => hasMore && status == Status.none;
  T? get lastDoc => data.isNotEmpty ? data.last : null;

  bool get isLoading => status == Status.loading;

  void addAll(List<T>? items) {
    status = Status.none;
    if ((items?.length ?? 0) < pageCount) {
      hasMore = false;
    }
    data.addAll(items ?? []);
  }

  Future load();
}
