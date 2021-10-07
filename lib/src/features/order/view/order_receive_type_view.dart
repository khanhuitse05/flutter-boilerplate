import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/order/logic/order_bloc.dart';
import 'package:my_app/src/features/order/widget/order_exit_button.dart';
import 'package:my_app/src/features/order/widget/order_next_button.dart';

class OrderReceiveTypeView extends StatelessWidget {
  const OrderReceiveTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Receive Type'),
        actions: [
          OrderExitButton(),
        ],
      ),
      bottomNavigationBar: OrderNextButton(
        onPressed: () => context.read<OrderBloc>().nextFromReceiveType(context),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return ListView(
            children: [
              _buildItem(context, state, ReceiveType.user),
              _buildItem(context, state, ReceiveType.shop),
            ],
          );
        },
      ),
    );
  }

  ListTile _buildItem(
      BuildContext context, OrderState state, ReceiveType type) {
    return ListTile(
      onTap: () {
        context.read<OrderBloc>().onSelectReceiveType(type);
      },
      title: Text(type.toString()),
      trailing: _buildIconSelect(state.receiveType == type),
    );
  }

  Widget _buildIconSelect(bool value) {
    if (value) {
      return Icon(Icons.radio_button_checked);
    } else {
      return Icon(Icons.radio_button_off);
    }
  }
}
