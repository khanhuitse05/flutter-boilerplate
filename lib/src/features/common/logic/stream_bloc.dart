import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StreamCubit<T> extends Cubit<T> {
  StreamCubit(T initialState) : super(initialState) {
    initialise();
  }
  Stream<T> get stream;

  StreamSubscription? get streamSubscription => _streamSubscription;

  StreamSubscription? _streamSubscription;

  void initialise() {
    _streamSubscription = stream.listen(
      (incomingData) {
        var data = transformData(incomingData);
        onStreamData(data);
      },
      onError: (error) {
        onStreamError(error);
      },
    );
  }

  /// Called before the notifyListeners is called when data has been set
  void onStreamData(T? data);

  /// Called when an error is fired in the stream
  void onStreamError(error);

  /// Called before the data is set for the ViewModel
  T transformData(T data) {
    return data;
  }

  @override
  Future<void> close() async {
    _streamSubscription!.cancel();
    super.close();
  }
}
