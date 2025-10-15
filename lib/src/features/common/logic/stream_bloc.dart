import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StreamCubit<T, D> extends Cubit<T> {
  StreamCubit(super.initialState) {
    initialize();
  }
  Stream<D> get getStream;

  StreamSubscription? get streamSubscription => _streamSubscription;

  StreamSubscription? _streamSubscription;

  void initialize() {
    _streamSubscription = getStream.listen(
      (incomingData) {
        var data = transformData(incomingData);
        onStreamData(data);
      },
      onError: (error) {
        onStreamError(error);
      },
    );
  }

  void onSourceChange() {
    // Disable current stream
    _streamSubscription?.cancel();
    _streamSubscription = null;
    initialize();
  }

  /// Called before the notifyListeners is called when data has been set
  void onStreamData(D? data);

  /// Called when an error is fired in the stream
  void onStreamError(dynamic error);

  /// Called before the data is set for the ViewModel
  D transformData(D data) {
    return data;
  }

  @override
  Future<void> close() async {
    _streamSubscription?.cancel();
    super.close();
  }
}
