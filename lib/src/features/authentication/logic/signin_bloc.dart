import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/src/dialogs/alert_wrapper.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/features/authentication/model/model_input.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/network/model/social_type.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/network/model/social_user/social_user.dart';
import 'package:myapp/src/network/model/user/user.dart';
import 'package:myapp/src/router/coordinator.dart';

part 'signin_state.dart';

class SigninBloc extends Cubit<SigninState> {
  SigninBloc() : super(const SigninState());

  DomainManager get domain => DomainManager();

  Future loginWithEmail() async {
    if (state.status.isInProgress) return;
    if (state.isValidated == false) {
      return;
    }
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.email,
    ));
    final email = state.email.value;
    final password = state.password.value;
    final result =
        await domain.sign.loginWithEmail(email: email, password: password);
    return loginDecision(result);
  }

  Future loginWithGoogle() async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.google,
    ));
    final result = await domain.sign.loginWithGoogle();
    return loginSocialDecision(result, MSocialType.google);
  }

  Future loginWithApple() async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.apple,
    ));
    final result = await domain.sign.loginWithApple();
    return loginSocialDecision(result, MSocialType.apple);
  }

  Future loginWithFacebook() async {
    if (state.status.isInProgress) return;
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.facebook,
    ));
    final result = await domain.sign.loginWithFacebook();
    return loginSocialDecision(result, MSocialType.facebook);
  }

  Future loginSocialDecision(
      MResult<MSocialUser> result, MSocialType socialType) async {
    if (result.isSuccess) {
      final data = result.data!;
      if (socialType == MSocialType.google) {
        connectBEWithGoogle(data);
      } else if (socialType == MSocialType.facebook) {
        connectBEWithFacebook(data);
      } else if (socialType == MSocialType.apple) {
        connectBEWithApple(data);
      }
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: "Error", body: result.error);
    }
  }

  Future connectBEWithGoogle(MSocialUser user) async {
    final result = await domain.sign.connectBEWithGoogle(user);
    return loginDecision(result, socialType: user.type);
  }

  Future connectBEWithFacebook(MSocialUser user) async {
    final result = await domain.sign.connectBEWithFacebook(user);
    return loginDecision(result, socialType: user.type);
  }

  Future connectBEWithApple(MSocialUser user) async {
    final result = await domain.sign.connectBEWithApple(user);
    return loginDecision(result, socialType: user.type);
  }

  Future loginDecision(MResult<MUser> result, {MSocialType? socialType}) async {
    if (result.isSuccess) {
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      GetIt.I<AccountBloc>().onLoginSuccess(result.data!);
      AppCoordinator.pop(true);
    } else {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
      XAlert.show(title: 'Login Error', body: result.error);
    }
  }

  void onEmailChanged(String value) {
    final formz = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: formz));
  }

  void onPasswordChanged(String value) {
    final formz = PasswordFormzInput.dirty(value);
    emit(state.copyWith(password: formz));
  }
}
