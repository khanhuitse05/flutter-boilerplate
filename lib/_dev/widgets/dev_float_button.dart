import 'package:flutter/material.dart';
import 'package:my_app/_dev/router/dev_router.dart';

class DevFloatButton extends StatelessWidget {
  const DevFloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => DevRouter.onEnter(),
      child: Icon(Icons.file_upload_outlined),
    );
  }
}
