import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/order/logic/order_bloc.dart';
import 'package:my_app/src/features/order/widget/order_exit_button.dart';
import 'package:my_app/src/features/order/widget/order_next_button.dart';

class OrderConfirmView extends StatelessWidget {
  const OrderConfirmView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm'),
        actions: [
          OrderExitButton(),
        ],
      ),
      bottomNavigationBar: OrderNextButton(
        onPressed: () => context.read<OrderBloc>().nextFromConfrim(context),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              context.read<OrderBloc>().backToReceiveType(context);
            },
            title: Text('Edit Receive Type'),
          ),
          ListTile(
            onTap: () {
              context.read<OrderBloc>().backToAddress(context);
            },
            title: Text('Edit Address'),
          ),
          ListTile(
            onTap: () {
              context.read<OrderBloc>().backToPaymentType(context);
            },
            title: Text('Edit Payment Type'),
          ),
        ],
      ),
    );
  }
}
