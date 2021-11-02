import 'package:auto_route/auto_route.dart';
import 'package:my_app/src/features/order/view/order_address_shop_view.dart';
import 'package:my_app/src/features/order/view/order_address_user_view.dart';
import 'package:my_app/src/features/order/view/order_confirm_view.dart';
import 'package:my_app/src/features/order/view/order_payment_type_view.dart';
import 'package:my_app/src/features/order/view/order_payment_view.dart';
import 'package:my_app/src/features/order/view/order_receive_type_view.dart';
import 'package:my_app/src/features/order/view/order_success_view.dart';
import 'package:my_app/src/router/router_name.dart';

import 'order_wrapper_view.dart';

class OrderRouters {
  static const String receiveType = '';
  static const String userAddress = 'userAddress';
  static const String shopAddress = 'shopAddress';
  static const String paymentType = 'paymentType';
  static const String confirm = 'confirm';
  static const String payment = 'payment';
  static const String success = 'success';
}

class OrderCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.order,
    name: "OrderRouter",
    page: OrderWrapperView,
    children: [
      AutoRoute(path: '', page: OrderReceiveTypeView),
      AutoRoute(path: OrderRouters.userAddress, page: OrderAddressUserView),
      AutoRoute(path: OrderRouters.shopAddress, page: OrderAddressShopView),
      AutoRoute(path: OrderRouters.paymentType, page: OrderPaymentTypeView),
      AutoRoute(path: OrderRouters.confirm, page: OrderConfirmView),
      AutoRoute(path: OrderRouters.payment, page: OrderPaymentView),
      AutoRoute(path: OrderRouters.success, page: OrderSuccessView),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
