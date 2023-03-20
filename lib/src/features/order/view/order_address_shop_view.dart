import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/order/logic/order_bloc.dart';
import 'package:my_app/src/features/order/widget/order_exit_button.dart';
import 'package:my_app/src/features/order/widget/order_next_button.dart';
import 'package:my_app/src/features/order/widget/order_select_item.dart';

@RoutePage()
class OrderAddressShopView extends StatelessWidget {
  const OrderAddressShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Address'),
        actions: [
          OrderExitButton(),
        ],
      ),
      bottomNavigationBar: OrderNextButton(
        onPressed: () => context.read<OrderBloc>().nextFromAddress(context),
      ),
      body: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return ListView(
            children: [
              _buildItem(
                  context, state, '3 Kaki Bukit Road3, #01-05 Techink 322342'),
              _buildItem(context, state,
                  '180 Kitchener RD, #01 City Square Mall 4324r'),
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem(BuildContext context, OrderState state, String value) {
    return OrderSelectItem(
      title: value,
      onTap: () {
        context.read<OrderBloc>().onSelectAddress(value);
      },
      value: state.address == value,
    );
  }
}
