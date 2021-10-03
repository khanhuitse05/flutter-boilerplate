import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/sample/router/sample_coordinator.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SampleRoutes.setting);
            },
          ),
        ],
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('SampleItem ${index}'),
            leading: const CircleAvatar(
              foregroundImage: AssetImage('assets/images/images/logo.png'),
            ),
            onTap: () {
              context.read<SampleCoordinator>().pushNamed(SampleRoutes.detail);
            },
          );
        },
      ),
    );
  }
}
