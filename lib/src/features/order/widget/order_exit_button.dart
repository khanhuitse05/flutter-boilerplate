import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/dialogs/alert_wrapper.dart';
import 'package:my_app/src/dialogs/widget/alert_dialog.dart';
import 'package:my_app/src/features/order/logic/order_bloc.dart';

class OrderExitButton extends StatelessWidget {
  const OrderExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final key = await XAlert.show(
            body: 'Confirm Exit',
            actions: [XAlertButton.close(), XAlertButton('OK', key: '1')]);
        if (key == '1') {
          context.read<OrderBloc>().onExit(context);
        }
      },
      icon: Icon(Icons.close),
    );
  }
}
