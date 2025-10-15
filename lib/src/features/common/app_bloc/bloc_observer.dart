import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class XBlocObserver extends BlocObserver {
  final Logger log = Logger();
  @override
  void onEvent(Bloc bloc, Object? event) {
    log.i('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log.i('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log.f('onChange ${bloc.runtimeType}\n'
        'From: ${change.currentState}\n'
        'To: ${change.nextState}');
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    log.i('Close ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log.i('Create ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log.e('Error in : ${bloc.runtimeType}', error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
