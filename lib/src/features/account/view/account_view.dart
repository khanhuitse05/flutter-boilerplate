import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/dashboard/logic/dashboard_bloc.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<DashBoardBloc>().setActiveIndex(TapIndex.home.index);
            },
            icon: Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {
              context.router.pushNamed('profile');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
