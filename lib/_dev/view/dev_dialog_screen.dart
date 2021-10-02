import 'package:flutter/material.dart';
import 'package:my_app/_dev/widgets/dev_button_title.dart';
import 'package:my_app/src/dialogs/dialog_service.dart';
import '../widgets/dev_screen_layout.dart';

class DevDialogScreen extends StatelessWidget {
  const DevDialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Dialog',
      children: [
        DevButtonTitle('1. Show Dialog', onTap: () {
          showAlert(title: 'title', body: 'dialog content');
        }),
        DevButtonTitle('2. Show full screen loading', onTap: () async {
          showLoading();
          await Future.delayed(Duration(seconds: 1));
          hideLoading();
        }),
        DevButtonTitle('3. Show Toast', onTap: () {
          // Toast.show('Default Toast');
        }),
        DevButtonTitle(
          '4. Show Default Bottom Sheet',
          onTap: () => _DemoBottomSheet.show(context),
        ),
      ],
    );
  }
}

class _DemoBottomSheet extends StatelessWidget {
  const _DemoBottomSheet({Key? key}) : super(key: key);
  static show(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => _DemoBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modal Page'),
      ),
      body: ListView.builder(itemBuilder: (_, i) {
        return ListTile(
          title: Text('Item ${i + 1}'),
          onTap: () => _DemoBottomSheet.show(context),
        );
      }),
    );
  }
}
