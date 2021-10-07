import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/order/logic/order_bloc.dart';

class OrderExitButton extends StatelessWidget {
  const OrderExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<OrderBloc>().onExit(context),
      icon: Icon(Icons.close),
    );
  }
}
