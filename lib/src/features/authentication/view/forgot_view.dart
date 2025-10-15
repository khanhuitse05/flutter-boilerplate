import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/features/authentication/logic/forgot_bloc.dart';
import 'package:myapp/src/features/authentication/widget/sign_title.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/forms/input.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotBloc(),
      child: BlocBuilder<ForgotBloc, ForgotState>(
        builder: (context, ForgotState state) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SignTitle('Reset password'),
                    const SizedBox(height: 8.0),
                    XInput(
                      value: state.email.value,
                      key: const Key('forgot_passwordConfirmInput_textField'),
                      onChanged: context.read<ForgotBloc>().onEmailChanged,
                      decoration: InputDecoration(
                          labelText: 'Email', errorText: state.error),
                      autofocus: true,
                    ),
                    const SizedBox(height: 32.0),
                    XButton(
                      busy: state.status.isInProgress,
                      enabled: state.email.isValid,
                      title: S.of(context).common_next,
                      onPressed: () => context
                          .read<ForgotBloc>()
                          .onEnteredConfirmPassword(context),
                    ),
                    const SizedBox(height: 16.0),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
