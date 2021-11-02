import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/dashboard/logic/dashboard_bloc.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<DashBoardBloc>().setActiveIndex(TapIndex.home.index);
            },
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}
