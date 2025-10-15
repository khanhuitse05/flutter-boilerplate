import 'package:flutter/material.dart';
import 'package:myapp/src/router/coordinator.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/widgets/button/text_button.dart';
import 'package:myapp/widgets/card/card.dart';

class AccountNoUserCard extends StatelessWidget {
  const AccountNoUserCard({super.key});
  @override
  Widget build(BuildContext context) {
    return XCard(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Hello',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17,
              letterSpacing: 0.44,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Sign in to shop more easily and enjoy many promotions',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: XTextButton(
              title: 'Sign in / Sign up',
              onPressed: () {
                AppCoordinator.showSignInScreen();
              },
            ),
          )
        ],
      ),
    );
  }
}
