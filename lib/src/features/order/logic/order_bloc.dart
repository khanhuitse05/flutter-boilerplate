import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/src/dialogs/toast_wrapper.dart';
import 'package:my_app/src/features/order/model/payment_type.dart';
import 'package:my_app/src/features/order/model/receive_type.dart';
import 'package:my_app/src/features/order/router/order_router.dart';
import 'package:my_app/src/router/auto_router.dart';
import 'package:my_app/src/router/auto_router.gr.dart';

part 'order_state.dart';

class OrderBloc extends Cubit<OrderState> {
  OrderBloc() : super(OrderState());
  late StackRouter router;

  // Action
  void onSelectReceiveType(ReceiveType value) {
    emit(state.copyWith(receiveType: value, address: ''));
  }

  void onSelectPaymentType(PaymentType value) {
    emit(state.copyWith(paymentType: value));
  }

  void onSelectAddress(String value) {
    emit(state.copyWith(address: value));
  }

  // navigation Event
  void onExit(BuildContext context) {
    GetIt.I<XRouter>().pop();
  }

  void onBack(BuildContext context) {
    router = context.router;
    router.pop();
  }

  // handle manully follow
  // ReceiveType -> ReceiveAndress -> PaymentType -> Confirm -> Payment > Success
  void nextFromReceiveType(BuildContext context) {
    // go to ReceiveAndress
    router = context.router;
    if (state.receiveType == ReceiveType.shop) {
      router.pushNamed(OrderRoutes.shopAddress);
    } else if (state.receiveType == ReceiveType.user) {
      router.pushNamed(OrderRoutes.userAddress);
    } else {
      //  validation
      XToast.show('Please select receive type');
    }
  }

  void nextFromAddress(BuildContext context) {
    router = context.router;
    if (state.address.isEmpty) {
      XToast.show('Please select anddress');
    } else {
      router.pushNamed(OrderRoutes.paymentType);
    }
  }

  void nextFromPaymentType(BuildContext context) {
    router = context.router;
    if (state.paymentType == PaymentType.node) {
      XToast.show('Please select payment type');
    } else {
      //  validation
      router.pushNamed(OrderRoutes.confirm);
    }
  }

  void nextFromConfrim(BuildContext context) {
    router = context.router;
    router.pushNamed(OrderRoutes.payment);
  }

  void nextFromPayment(BuildContext context) {
    router = context.router;
    router.pushNamed(OrderRoutes.success);
  }

  void nextFromSuccess(BuildContext context) {
    onExit(context);
  }

  void backToReceiveType(BuildContext context) {
    // go to ReceiveAndress
    router = context.router;
    router.popUntilRouteWithName(OrderReceiveTypeRoute.name);
  }

  void backToAddress(BuildContext context) {
    router = context.router;
    if (state.receiveType == ReceiveType.shop) {
      router.popUntilRouteWithName(OrderAddressShopRoute.name);
    } else if (state.receiveType == ReceiveType.user) {
      router.popUntilRouteWithName(OrderAddressUserRoute.name);
    } else {
      router.popUntilRouteWithName(OrderReceiveTypeRoute.name);
    }
  }

  void backToPaymentType(BuildContext context) {
    router = context.router;
    router.popUntilRouteWithName(OrderPaymentTypeRoute.name);
  }
}
