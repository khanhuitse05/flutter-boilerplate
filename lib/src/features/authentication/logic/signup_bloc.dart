import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/dialogs/alert_wrapper.dart';
import 'package:myapp/src/dialogs/toast_wrapper.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/features/authentication/model/name_formz.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/network/model/user/user.dart';
import 'package:myapp/src/router/coordinator.dart';

part 'signup_state.dart';

class SignupBloc extends Cubit<SignupState> {
  SignupBloc() : super(const SignupState());

  DomainManager get domain => DomainManager();

  Future signupWithEmail(BuildContext context) async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) {
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final email = state.email.value;
    final password = state.password.value;
    final name = state.name.value;
    final result = await domain.sign
        .signUpWithEmail(email: email, password: password, name: name);
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      if (context.mounted) {
        signupDecision(context, result.data!);
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: 'Signup fail', body: result.error);
    }
  }

  Future signupDecision(BuildContext context, MUser incomingUser) async {
    GetIt.I<AccountBloc>().onLoginSuccess(incomingUser);
    AppCoordinator.pop();
    XToast.success('Signup success');
  }

  void onEmailChanged(String value) {
    final formz = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: formz));
  }

  void onNameChanged(String value) {
    final formz = NameFormzInput.dirty(value);
    emit(state.copyWith(name: formz));
  }

  void onPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(password: formz));
  }
}
