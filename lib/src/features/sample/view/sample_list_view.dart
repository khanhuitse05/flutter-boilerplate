import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/config/constants/images.dart';
import 'package:my_app/src/router/auto_router.gr.dart';
import 'package:my_app/src/router/coordinator.dart';
import 'package:my_app/src/router/router_name.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        leading: CloseButton(
          onPressed: () {
            XCoordinator.pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              GetIt.I<XRouter>().pushNamed(XRoutes.setting);
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
              foregroundImage: AssetImage(XImagePath.logo),
            ),
            onTap: () {
              context.router.pushNamed('$index');
            },
          );
        },
      ),
    );
  }
}
