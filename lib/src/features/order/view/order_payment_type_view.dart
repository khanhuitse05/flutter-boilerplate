import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/order/logic/order_bloc.dart';
import 'package:my_app/src/features/order/model/payment_type.dart';
import 'package:my_app/src/features/order/widget/order_exit_button.dart';
import 'package:my_app/src/features/order/widget/order_next_button.dart';
import 'package:my_app/src/features/order/widget/order_select_item.dart';

@RoutePage()
class OrderPaymentTypeView extends StatelessWidget {
  const OrderPaymentTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Type'),
        actions: [
          OrderExitButton(),
        ],
      ),
      bottomNavigationBar: OrderNextButton(
        onPressed: () => context.read<OrderBloc>().nextFromPaymentType(context),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return ListView(
            children: [
              _buildItem(context, state, PaymentType.cod),
              _buildItem(context, state, PaymentType.apple),
              _buildItem(context, state, PaymentType.visa),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, OrderState state, PaymentType type) {
    return OrderSelectItem(
      title: type.name,
      onTap: () {
        context.read<OrderBloc>().onSelectPaymentType(type);
      },
      value: state.paymentType == type,
    );
  }
}
