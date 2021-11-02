import 'package:flutter/material.dart';
import 'package:my_app/src/router/coordinator.dart';

class DevFloatButton extends StatelessWidget {
  const DevFloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => XCoordinator.showDev(),
      child: Icon(Icons.file_upload_outlined),
    );
  }
}
