part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    this.email = const EmailFormzInput.pure(),
    this.password = const PasswordFormzInput.pure(''),
    this.name = const NameFormzInput.pure(''),
    this.status = FormzSubmissionStatus.initial,
    this.message = '',
  });

  final EmailFormzInput email;
  final PasswordFormzInput password;
  final NameFormzInput name;
  final FormzSubmissionStatus status;
  final String message;

  bool get isValidated {
    return Formz.validate([email, password]);
  }

  @override
  List<Object> get props => [
        email,
        password,
        status,
        name,
      ];

  SignupState copyWith({
    EmailFormzInput? email,
    PasswordFormzInput? password,
    FormzSubmissionStatus? status,
    NameFormzInput? name,
    String? message,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      name: name ?? this.name,
      message: message ?? this.message,
    );
  }
}
