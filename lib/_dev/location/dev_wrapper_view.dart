import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevExampleBloc {}

class DevWrapperView extends StatelessWidget {
  const DevWrapperView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DevExampleBloc(),
      child: Scaffold(
        body: AutoRouter(),
      ),
    );
  }
}
