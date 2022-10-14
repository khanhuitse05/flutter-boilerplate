// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i26;
import 'package:auto_route/empty_router_widgets.dart' as _i3;
import 'package:flutter/material.dart' as _i27;

import '../../_dev/location/dev_view.dart' as _i11;
import '../../_dev/location/dev_wrapper_view.dart' as _i4;
import '../../_dev/view/dev_button_view.dart' as _i13;
import '../../_dev/view/dev_device_view.dart' as _i12;
import '../../_dev/view/dev_dialog_view.dart' as _i16;
import '../../_dev/view/dev_input_view.dart' as _i17;
import '../../_dev/view/dev_other_view.dart' as _i18;
import '../../_dev/view/dev_text_view.dart' as _i15;
import '../../_dev/view/dev_theme_view.dart' as _i14;
import '../features/account/profile/view/profile_view.dart' as _i8;
import '../features/account/view/account_view.dart' as _i7;
import '../features/dashboard/view/dashboard_view.dart' as _i1;
import '../features/home/view/home_view.dart' as _i6;
import '../features/order/router/order_wrapper_view.dart' as _i5;
import '../features/order/view/order_address_shop_view.dart' as _i21;
import '../features/order/view/order_address_user_view.dart' as _i20;
import '../features/order/view/order_confirm_view.dart' as _i23;
import '../features/order/view/order_payment_type_view.dart' as _i22;
import '../features/order/view/order_payment_view.dart' as _i24;
import '../features/order/view/order_receive_type_view.dart' as _i19;
import '../features/order/view/order_success_view.dart' as _i25;
import '../features/sample/view/sample_detail_view.dart' as _i10;
import '../features/sample/view/sample_list_view.dart' as _i9;
import '../features/settings/settings_view.dart' as _i2;

class XRouter extends _i26.RootStackRouter {
  XRouter([_i27.GlobalKey<_i27.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    DashBoardRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashBoardView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SettingsView(),
      );
    },
    SampleRouter.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    DevRouter.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.DevWrapperView(),
      );
    },
    OrderRouter.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.OrderWrapperView(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomeView(),
      );
    },
    AccountRouter.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.EmptyRouterPage(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AccountView(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileView(),
      );
    },
    SampleItemListRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.SampleItemListView(),
      );
    },
    SampleItemDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SampleItemDetailsRouteArgs>(
          orElse: () =>
              SampleItemDetailsRouteArgs(id: pathParams.getString('id')));
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.SampleItemDetailsView(
          id: args.id,
          key: args.key,
        ),
      );
    },
    DevRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.DevView(),
      );
    },
    DevDeviceRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DevDeviceView(),
      );
    },
    DevButtonRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.DevButtonView(),
      );
    },
    DevThemeRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.DevThemeView(),
      );
    },
    DevTextRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.DevTextView(),
      );
    },
    DevDialogRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.DevDialogView(),
      );
    },
    DevInputRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i17.DevInputView(),
      );
    },
    DevOtherRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.DevOtherView(),
      );
    },
    OrderReceiveTypeRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.OrderReceiveTypeView(),
      );
    },
    OrderAddressUserRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.OrderAddressUserView(),
      );
    },
    OrderAddressShopRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.OrderAddressShopView(),
      );
    },
    OrderPaymentTypeRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.OrderPaymentTypeView(),
      );
    },
    OrderConfirmRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.OrderConfirmView(),
      );
    },
    OrderPaymentRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.OrderPaymentView(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.OrderSuccessView(),
      );
    },
  };

  @override
  List<_i26.RouteConfig> get routes => [
        _i26.RouteConfig(
          DashBoardRoute.name,
          path: '/',
          children: [
            _i26.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: DashBoardRoute.name,
            ),
            _i26.RouteConfig(
              AccountRouter.name,
              path: 'account',
              parent: DashBoardRoute.name,
              children: [
                _i26.RouteConfig(
                  AccountRoute.name,
                  path: '',
                  parent: AccountRouter.name,
                ),
                _i26.RouteConfig(
                  ProfileRoute.name,
                  path: 'profile',
                  parent: AccountRouter.name,
                ),
                _i26.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: AccountRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
          ],
        ),
        _i26.RouteConfig(
          SettingsRoute.name,
          path: '/setting',
        ),
        _i26.RouteConfig(
          SampleRouter.name,
          path: '/sample',
          children: [
            _i26.RouteConfig(
              SampleItemListRoute.name,
              path: '',
              parent: SampleRouter.name,
            ),
            _i26.RouteConfig(
              SampleItemDetailsRoute.name,
              path: ':id',
              parent: SampleRouter.name,
            ),
            _i26.RouteConfig(
              '*#redirect',
              path: '*',
              parent: SampleRouter.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i26.RouteConfig(
          DevRouter.name,
          path: '/dev',
          children: [
            _i26.RouteConfig(
              DevRoute.name,
              path: '',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              DevDeviceRoute.name,
              path: 'device',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              DevButtonRoute.name,
              path: 'button',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              DevThemeRoute.name,
              path: 'theme',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              DevTextRoute.name,
              path: 'textTheme',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              DevDialogRoute.name,
              path: 'dialog',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              DevInputRoute.name,
              path: 'input',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              DevOtherRoute.name,
              path: 'other',
              parent: DevRouter.name,
            ),
            _i26.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DevRouter.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i26.RouteConfig(
          OrderRouter.name,
          path: '/order',
          children: [
            _i26.RouteConfig(
              OrderReceiveTypeRoute.name,
              path: '',
              parent: OrderRouter.name,
            ),
            _i26.RouteConfig(
              OrderAddressUserRoute.name,
              path: 'userAddress',
              parent: OrderRouter.name,
            ),
            _i26.RouteConfig(
              OrderAddressShopRoute.name,
              path: 'shopAddress',
              parent: OrderRouter.name,
            ),
            _i26.RouteConfig(
              OrderPaymentTypeRoute.name,
              path: 'paymentType',
              parent: OrderRouter.name,
            ),
            _i26.RouteConfig(
              OrderConfirmRoute.name,
              path: 'confirm',
              parent: OrderRouter.name,
            ),
            _i26.RouteConfig(
              OrderPaymentRoute.name,
              path: 'payment',
              parent: OrderRouter.name,
            ),
            _i26.RouteConfig(
              OrderSuccessRoute.name,
              path: 'success',
              parent: OrderRouter.name,
            ),
            _i26.RouteConfig(
              '*#redirect',
              path: '*',
              parent: OrderRouter.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i26.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashBoardView]
class DashBoardRoute extends _i26.PageRouteInfo<void> {
  const DashBoardRoute({List<_i26.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';
}

/// generated route for
/// [_i2.SettingsView]
class SettingsRoute extends _i26.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: '/setting',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class SampleRouter extends _i26.PageRouteInfo<void> {
  const SampleRouter({List<_i26.PageRouteInfo>? children})
      : super(
          SampleRouter.name,
          path: '/sample',
          initialChildren: children,
        );

  static const String name = 'SampleRouter';
}

/// generated route for
/// [_i4.DevWrapperView]
class DevRouter extends _i26.PageRouteInfo<void> {
  const DevRouter({List<_i26.PageRouteInfo>? children})
      : super(
          DevRouter.name,
          path: '/dev',
          initialChildren: children,
        );

  static const String name = 'DevRouter';
}

/// generated route for
/// [_i5.OrderWrapperView]
class OrderRouter extends _i26.PageRouteInfo<void> {
  const OrderRouter({List<_i26.PageRouteInfo>? children})
      : super(
          OrderRouter.name,
          path: '/order',
          initialChildren: children,
        );

  static const String name = 'OrderRouter';
}

/// generated route for
/// [_i6.HomeView]
class HomeRouter extends _i26.PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: 'home',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class AccountRouter extends _i26.PageRouteInfo<void> {
  const AccountRouter({List<_i26.PageRouteInfo>? children})
      : super(
          AccountRouter.name,
          path: 'account',
          initialChildren: children,
        );

  static const String name = 'AccountRouter';
}

/// generated route for
/// [_i7.AccountView]
class AccountRoute extends _i26.PageRouteInfo<void> {
  const AccountRoute()
      : super(
          AccountRoute.name,
          path: '',
        );

  static const String name = 'AccountRoute';
}

/// generated route for
/// [_i8.ProfileView]
class ProfileRoute extends _i26.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.SampleItemListView]
class SampleItemListRoute extends _i26.PageRouteInfo<void> {
  const SampleItemListRoute()
      : super(
          SampleItemListRoute.name,
          path: '',
        );

  static const String name = 'SampleItemListRoute';
}

/// generated route for
/// [_i10.SampleItemDetailsView]
class SampleItemDetailsRoute
    extends _i26.PageRouteInfo<SampleItemDetailsRouteArgs> {
  SampleItemDetailsRoute({
    required String id,
    _i27.Key? key,
  }) : super(
          SampleItemDetailsRoute.name,
          path: ':id',
          args: SampleItemDetailsRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'SampleItemDetailsRoute';
}

class SampleItemDetailsRouteArgs {
  const SampleItemDetailsRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i27.Key? key;

  @override
  String toString() {
    return 'SampleItemDetailsRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i11.DevView]
class DevRoute extends _i26.PageRouteInfo<void> {
  const DevRoute()
      : super(
          DevRoute.name,
          path: '',
        );

  static const String name = 'DevRoute';
}

/// generated route for
/// [_i12.DevDeviceView]
class DevDeviceRoute extends _i26.PageRouteInfo<void> {
  const DevDeviceRoute()
      : super(
          DevDeviceRoute.name,
          path: 'device',
        );

  static const String name = 'DevDeviceRoute';
}

/// generated route for
/// [_i13.DevButtonView]
class DevButtonRoute extends _i26.PageRouteInfo<void> {
  const DevButtonRoute()
      : super(
          DevButtonRoute.name,
          path: 'button',
        );

  static const String name = 'DevButtonRoute';
}

/// generated route for
/// [_i14.DevThemeView]
class DevThemeRoute extends _i26.PageRouteInfo<void> {
  const DevThemeRoute()
      : super(
          DevThemeRoute.name,
          path: 'theme',
        );

  static const String name = 'DevThemeRoute';
}

/// generated route for
/// [_i15.DevTextView]
class DevTextRoute extends _i26.PageRouteInfo<void> {
  const DevTextRoute()
      : super(
          DevTextRoute.name,
          path: 'textTheme',
        );

  static const String name = 'DevTextRoute';
}

/// generated route for
/// [_i16.DevDialogView]
class DevDialogRoute extends _i26.PageRouteInfo<void> {
  const DevDialogRoute()
      : super(
          DevDialogRoute.name,
          path: 'dialog',
        );

  static const String name = 'DevDialogRoute';
}

/// generated route for
/// [_i17.DevInputView]
class DevInputRoute extends _i26.PageRouteInfo<void> {
  const DevInputRoute()
      : super(
          DevInputRoute.name,
          path: 'input',
        );

  static const String name = 'DevInputRoute';
}

/// generated route for
/// [_i18.DevOtherView]
class DevOtherRoute extends _i26.PageRouteInfo<void> {
  const DevOtherRoute()
      : super(
          DevOtherRoute.name,
          path: 'other',
        );

  static const String name = 'DevOtherRoute';
}

/// generated route for
/// [_i19.OrderReceiveTypeView]
class OrderReceiveTypeRoute extends _i26.PageRouteInfo<void> {
  const OrderReceiveTypeRoute()
      : super(
          OrderReceiveTypeRoute.name,
          path: '',
        );

  static const String name = 'OrderReceiveTypeRoute';
}

/// generated route for
/// [_i20.OrderAddressUserView]
class OrderAddressUserRoute extends _i26.PageRouteInfo<void> {
  const OrderAddressUserRoute()
      : super(
          OrderAddressUserRoute.name,
          path: 'userAddress',
        );

  static const String name = 'OrderAddressUserRoute';
}

/// generated route for
/// [_i21.OrderAddressShopView]
class OrderAddressShopRoute extends _i26.PageRouteInfo<void> {
  const OrderAddressShopRoute()
      : super(
          OrderAddressShopRoute.name,
          path: 'shopAddress',
        );

  static const String name = 'OrderAddressShopRoute';
}

/// generated route for
/// [_i22.OrderPaymentTypeView]
class OrderPaymentTypeRoute extends _i26.PageRouteInfo<void> {
  const OrderPaymentTypeRoute()
      : super(
          OrderPaymentTypeRoute.name,
          path: 'paymentType',
        );

  static const String name = 'OrderPaymentTypeRoute';
}

/// generated route for
/// [_i23.OrderConfirmView]
class OrderConfirmRoute extends _i26.PageRouteInfo<void> {
  const OrderConfirmRoute()
      : super(
          OrderConfirmRoute.name,
          path: 'confirm',
        );

  static const String name = 'OrderConfirmRoute';
}

/// generated route for
/// [_i24.OrderPaymentView]
class OrderPaymentRoute extends _i26.PageRouteInfo<void> {
  const OrderPaymentRoute()
      : super(
          OrderPaymentRoute.name,
          path: 'payment',
        );

  static const String name = 'OrderPaymentRoute';
}

/// generated route for
/// [_i25.OrderSuccessView]
class OrderSuccessRoute extends _i26.PageRouteInfo<void> {
  const OrderSuccessRoute()
      : super(
          OrderSuccessRoute.name,
          path: 'success',
        );

  static const String name = 'OrderSuccessRoute';
}
