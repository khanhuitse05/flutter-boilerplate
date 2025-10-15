import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:myapp/generated/assets/assets.gen.dart';
import 'package:myapp/src/features/authentication/logic/signin_bloc.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/src/network/model/social_type.dart';
import 'package:myapp/widgets/common/indicator.dart';

class SocialListButton extends StatelessWidget {
  const SocialListButton({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 20);
    return BlocBuilder<SigninBloc, SigninState>(
      builder: (context, SigninState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildLineDivider(context),
            if (kIsWeb == false && Platform.isIOS) ...[
              space,
              _buildButton(
                icon: Assets.svgs.icApple.path,
                title: S.of(context).sign_signin_signinWithApple,
                busy: state.status.isInProgress &&
                    state.loginType == MSocialType.apple,
                onPressed: () => context.read<SigninBloc>().loginWithApple(),
              ),
            ],
            space,
            _buildButton(
              icon: Assets.svgs.icFacebook.path,
              title: S.of(context).sign_signin_signinWithFacebook,
              busy: state.status.isInProgress &&
                  state.loginType == MSocialType.facebook,
              onPressed: () => context.read<SigninBloc>().loginWithFacebook(),
            ),
            space,
            _buildButton(
              icon: Assets.svgs.icGoogle.path,
              title: S.of(context).sign_signin_signinWithGoogle,
              busy: state.status.isInProgress &&
                  state.loginType == MSocialType.google,
              onPressed: () => context.read<SigninBloc>().loginWithGoogle(),
            ),
          ],
        );
      },
    );
  }

  Padding _buildLineDivider(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Divider()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Or',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF797979),
              ),
            ),
          ),
          Expanded(child: Divider()),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String icon,
    required String title,
    required VoidCallback onPressed,
    bool busy = false,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        child: AnimatedCrossFade(
          crossFadeState:
              busy ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 300),
          firstChild: const XIndicator(radius: 11),
          secondChild: SvgPicture.asset(icon),
        ),
      ),
      label: Text(' $title'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF313131),
        fixedSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF313131),
          letterSpacing: 0.24,
        ),
      ),
    );
  }
}
