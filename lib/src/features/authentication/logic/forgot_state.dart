part of 'forgot_bloc.dart';

class ForgotState extends Equatable {
  const ForgotState({
    this.email = const EmailFormzInput.pure(''),
    this.status = FormzSubmissionStatus.initial,
    this.error = '',
  });

  final EmailFormzInput email;
  final FormzSubmissionStatus status;
  final String error;

  @override
  List<Object> get props => [email, status, error];

  ForgotState copyWith({
    EmailFormzInput? email,
    FormzSubmissionStatus? status,
    String? error,
  }) {
    return ForgotState(
      email: email ?? this.email,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
