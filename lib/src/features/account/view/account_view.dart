import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/account/router/account_router.dart';
import 'package:my_app/src/features/dashboard/logic/dashboard_bloc.dart';

@RoutePage()
class AccountHomeView extends StatelessWidget {
  const AccountHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          IconButton(
            onPressed: () {
              AccountCoordinator.showProfile(context);
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: const Text('Switch to Home'),
                onPressed: () {
                  context
                      .read<DashBoardBloc>()
                      .setActiveIndex(TapIndex.home.index);
                },
              ),
            ]),
      ),
    );
  }
}
