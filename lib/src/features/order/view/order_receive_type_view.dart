import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/order/logic/order_bloc.dart';
import 'package:my_app/src/features/order/model/receive_type.dart';
import 'package:my_app/src/features/order/widget/order_exit_button.dart';
import 'package:my_app/src/features/order/widget/order_next_button.dart';
import 'package:my_app/src/features/order/widget/order_select_item.dart';

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

  Widget _buildItem(BuildContext context, OrderState state, ReceiveType type) {
    return OrderSelectItem(
      title: type.name,
      onTap: () {
        context.read<OrderBloc>().onSelectReceiveType(type);
      },
      value: state.receiveType == type,
    );
  }
}
