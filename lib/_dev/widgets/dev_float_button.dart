import 'package:flutter/material.dart';
import 'package:my_app/_dev/location/dev_location.dart';

class DevFloatButton extends StatelessWidget {
  const DevFloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => showDevScreen(context),
      child: Icon(Icons.file_upload_outlined),
    );
  }
}
