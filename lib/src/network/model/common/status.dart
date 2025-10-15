part of 'handle.dart';

enum MStatus { initial, loading, success, failure }

extension XHandleStatusExt on MStatus {
  bool get isLoading => this == MStatus.loading;
  bool get isFailure => this == MStatus.failure;
  bool get isSuccess => this == MStatus.success;
}
