import 'package:auto_route/auto_route.dart';
import 'package:my_app/src/router/auto_router.gr.dart';
import 'package:my_app/src/router/router_name.dart';

class OrderRoutes {
  static const String receiveType = '';
  static const String userAddress = 'userAddress';
  static const String shopAddress = 'shopAddress';
  static const String paymentType = 'paymentType';
  static const String confirm = 'confirm';
  static const String payment = 'payment';
  static const String success = 'success';
}

class OrderCoordinator {
  static var autoRouter = AutoRoute(
    path: XRoutes.order,
    page: OrderRoute.page,
    children: [
      AutoRoute(path: '', page: OrderReceiveTypeRoute.page),
      AutoRoute(
          path: OrderRoutes.userAddress, page: OrderAddressUserRoute.page),
      AutoRoute(
          path: OrderRoutes.shopAddress, page: OrderAddressShopRoute.page),
      AutoRoute(
          path: OrderRoutes.paymentType, page: OrderPaymentTypeRoute.page),
      AutoRoute(path: OrderRoutes.confirm, page: OrderConfirmRoute.page),
      AutoRoute(path: OrderRoutes.payment, page: OrderPaymentRoute.page),
      AutoRoute(path: OrderRoutes.success, page: OrderSuccessRoute.page),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
