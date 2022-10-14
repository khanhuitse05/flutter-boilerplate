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
          _buildItem(
            'Edit Receive Type',
            onTap: () {
              context.read<OrderBloc>().backToReceiveType(context);
            },
          ),
          _buildItem(
            'Edit Address',
            onTap: () {
              context.read<OrderBloc>().backToAddress(context);
            },
          ),
          _buildItem(
            'Edit Payment Type',
            onTap: () {
              context.read<OrderBloc>().backToPaymentType(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title, {VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      title: Text(title),
    );
  }
}
