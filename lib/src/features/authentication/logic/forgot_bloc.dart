import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/dialogs/alert_wrapper.dart';
import 'package:myapp/src/features/authentication/model/email_fromz.dart';
import 'package:myapp/src/network/domain_manager.dart';
import 'package:myapp/src/network/model/common/result.dart';
import 'package:myapp/src/router/coordinator.dart';

part 'forgot_state.dart';

class ForgotBloc extends Cubit<ForgotState> {
  ForgotBloc() : super(const ForgotState());
  DomainManager get domain => DomainManager();

  /// Step 3 (Register)
  Future onEnteredConfirmPassword(BuildContext context) async {
    if (state.email.isValid == false || state.status.isInProgress) {
      return;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    final MResult<String> result =
        await domain.sign.forgotPassword(state.email.value);
    if (result.isSuccess) {
      await XAlert.show(
        body:
            'Your request success! Please check your email to reset your password',
      );
      AppCoordinator.pop(true);
    } else {
      emit(
        state.copyWith(
            status: FormzSubmissionStatus.failure, error: result.error),
      );
    }
  }

  void onEmailChanged(String value) {
    final email = state.email.isPure
        ? EmailFormzInput.pure(value)
        : EmailFormzInput.dirty(value);
    emit(state.copyWith(email: email));
  }
}
