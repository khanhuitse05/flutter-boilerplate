import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/account/widget/account_nouser_cart.dart';
import 'package:myapp/src/features/account/widget/account_user_card.dart';
import 'package:myapp/widgets/appbar/large_title_appbar.dart';
import 'package:myapp/widgets/card/card.dart';
import 'package:myapp/widgets/card/card_section.dart';

class AccountHomeView extends StatelessWidget {
  const AccountHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const space = SizedBox(height: 15);
    return BlocBuilder<AccountBloc, AccountState>(
        builder: (context, AccountState state) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              const LargeTitleAppBar('Account', paddingTop: 0),
              SliverPadding(
                padding: const EdgeInsets.all(8),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (state.isLogin) ...[
                        AccountUserCard(user: state.user),
                      ] else ...[
                        const AccountNoUserCard(),
                      ],
                      space,
                      XCard(
                        padding: EdgeInsets.zero,
                        child: XCardSectionButton(
                          title: 'Policy',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
