part of 'signin_bloc.dart';

class SigninState extends Equatable {
  const SigninState({
    this.email = const EmailFormzInput.pure(),
    this.password = const PasswordFormzInput.pure(''),
    this.status = FormzSubmissionStatus.initial,
    this.loginType = MSocialType.email,
    this.message = '',
  });

  final EmailFormzInput email;
  final PasswordFormzInput password;
  final FormzSubmissionStatus status;
  final MSocialType loginType;
  final String message;

  bool get isValidated {
    return Formz.validate([email, password]);
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        loginType,
      ];

  SigninState copyWith({
    EmailFormzInput? email,
    PasswordFormzInput? password,
    FormzSubmissionStatus? status,
    MSocialType? loginType,
    String? message,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      loginType: loginType ?? this.loginType,
      message: message ?? this.message,
    );
  }
}
