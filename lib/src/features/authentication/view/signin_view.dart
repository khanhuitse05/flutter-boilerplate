import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:myapp/src/features/authentication/logic/signin_bloc.dart';
import 'package:myapp/src/features/authentication/widget/sign_title.dart';
import 'package:myapp/src/features/authentication/widget/social_list_button.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/src/network/model/social_type.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/button/text_button.dart';
import 'package:myapp/widgets/forms/input.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SigninBloc(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: BlocBuilder<SigninBloc, SigninState>(builder: _builder),
          ),
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, SigninState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SignTitle('Login'),
        const SizedBox(height: 24.0),
        XInput(
          key: const Key('loginForm_emailAndPhoneInput_textField'),
          value: state.email.value,
          onChanged: context.read<SigninBloc>().onEmailChanged,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              labelText: "Email", errorText: state.email.errorOf(context)),
        ),
        const SizedBox(height: 16.0),
        XInput(
          key: const Key('loginForm_passwordInput_textField'),
          value: state.password.value,
          onChanged: context.read<SigninBloc>().onPasswordChanged,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Password',
              errorText: state.password.errorOf(context)),
        ),
        const SizedBox(height: 8.0),
        _buildForgotPassword(context),
        const SizedBox(height: 8.0),
        XButton(
          key: const Key('loginForm_continue_raisedButton'),
          busy:
              state.status.isInProgress && state.loginType == MSocialType.email,
          enabled: state.isValidated,
          title: S.of(context).common_next,
          onPressed: () async {
            context.read<SigninBloc>().loginWithEmail();
          },
        ),
        const SizedBox(height: 32.0),
        const SocialListButton(),
        const SizedBox(height: 32.0),
        _buildNoAccount(context),
      ],
    );
  }

  Widget _buildNoAccount(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Not have account?" '  ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.textSecondary,
              letterSpacing: 0.24,
            ),
          ),
          TextSpan(
            text: "Signup now",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.link,
              letterSpacing: 0.24,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = AppCoordinator.showSignUpScreen,
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: XTextButton(
        title: 'Forgot password?',
        onPressed: AppCoordinator.showForgotPasswordScreen,
      ),
    );
  }
}
