// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i26;

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

class XRouter extends _i3.RootStackRouter {
  XRouter([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashBoardRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashBoardView());
    },
    SettingsRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SettingsView());
    },
    SampleRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    DevRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.DevWrapperView());
    },
    OrderRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.OrderWrapperView());
    },
    HomeRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeView());
    },
    AccountRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    AccountRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AccountView());
    },
    ProfileRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfileView());
    },
    SampleItemListRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SampleItemListView());
    },
    SampleItemDetailsRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<SampleItemDetailsRouteArgs>(
          orElse: () =>
              SampleItemDetailsRouteArgs(id: pathParams.getString('id')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.SampleItemDetailsView(id: args.id, key: args.key));
    },
    DevRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.DevView());
    },
    DevDeviceRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.DevDeviceView());
    },
    DevButtonRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.DevButtonView());
    },
    DevThemeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.DevThemeView());
    },
    DevTextRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.DevTextView());
    },
    DevDialogRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.DevDialogView());
    },
    DevInputRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.DevInputView());
    },
    DevOtherRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.DevOtherView());
    },
    OrderReceiveTypeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.OrderReceiveTypeView());
    },
    OrderAddressUserRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.OrderAddressUserView());
    },
    OrderAddressShopRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.OrderAddressShopView());
    },
    OrderPaymentTypeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.OrderPaymentTypeView());
    },
    OrderConfirmRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.OrderConfirmView());
    },
    OrderPaymentRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.OrderPaymentView());
    },
    OrderSuccessRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.OrderSuccessView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DashBoardRoute.name, path: '/', children: [
          _i3.RouteConfig(HomeRouter.name, path: 'home'),
          _i3.RouteConfig(AccountRouter.name, path: 'account', children: [
            _i3.RouteConfig(AccountRoute.name, path: ''),
            _i3.RouteConfig(ProfileRoute.name, path: 'profile'),
            _i3.RouteConfig('*#redirect',
                path: '*', redirectTo: '', fullMatch: true)
          ])
        ]),
        _i3.RouteConfig(SettingsRoute.name, path: '/setting'),
        _i3.RouteConfig(SampleRouter.name, path: '/sample', children: [
          _i3.RouteConfig(SampleItemListRoute.name, path: ''),
          _i3.RouteConfig(SampleItemDetailsRoute.name, path: ':id'),
          _i3.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i3.RouteConfig(DevRouter.name, path: '/dev', children: [
          _i3.RouteConfig(DevRoute.name, path: ''),
          _i3.RouteConfig(DevDeviceRoute.name, path: 'device'),
          _i3.RouteConfig(DevButtonRoute.name, path: 'button'),
          _i3.RouteConfig(DevThemeRoute.name, path: 'theme'),
          _i3.RouteConfig(DevTextRoute.name, path: 'textTheme'),
          _i3.RouteConfig(DevDialogRoute.name, path: 'dialog'),
          _i3.RouteConfig(DevInputRoute.name, path: 'input'),
          _i3.RouteConfig(DevOtherRoute.name, path: 'other'),
          _i3.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i3.RouteConfig(OrderRouter.name, path: '/order', children: [
          _i3.RouteConfig(OrderReceiveTypeRoute.name, path: ''),
          _i3.RouteConfig(OrderAddressUserRoute.name, path: 'userAddress'),
          _i3.RouteConfig(OrderAddressShopRoute.name, path: 'shopAddress'),
          _i3.RouteConfig(OrderPaymentTypeRoute.name, path: 'paymentType'),
          _i3.RouteConfig(OrderConfirmRoute.name, path: 'confirm'),
          _i3.RouteConfig(OrderPaymentRoute.name, path: 'payment'),
          _i3.RouteConfig(OrderSuccessRoute.name, path: 'success'),
          _i3.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for [_i1.DashBoardView]
class DashBoardRoute extends _i3.PageRouteInfo<void> {
  const DashBoardRoute({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'DashBoardRoute';
}

/// generated route for [_i2.SettingsView]
class SettingsRoute extends _i3.PageRouteInfo<void> {
  const SettingsRoute() : super(name, path: '/setting');

  static const String name = 'SettingsRoute';
}

/// generated route for [_i3.EmptyRouterPage]
class SampleRouter extends _i3.PageRouteInfo<void> {
  const SampleRouter({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/sample', initialChildren: children);

  static const String name = 'SampleRouter';
}

/// generated route for [_i4.DevWrapperView]
class DevRouter extends _i3.PageRouteInfo<void> {
  const DevRouter({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/dev', initialChildren: children);

  static const String name = 'DevRouter';
}

/// generated route for [_i5.OrderWrapperView]
class OrderRouter extends _i3.PageRouteInfo<void> {
  const OrderRouter({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/order', initialChildren: children);

  static const String name = 'OrderRouter';
}

/// generated route for [_i6.HomeView]
class HomeRouter extends _i3.PageRouteInfo<void> {
  const HomeRouter() : super(name, path: 'home');

  static const String name = 'HomeRouter';
}

/// generated route for [_i3.EmptyRouterPage]
class AccountRouter extends _i3.PageRouteInfo<void> {
  const AccountRouter({List<_i3.PageRouteInfo>? children})
      : super(name, path: 'account', initialChildren: children);

  static const String name = 'AccountRouter';
}

/// generated route for [_i7.AccountView]
class AccountRoute extends _i3.PageRouteInfo<void> {
  const AccountRoute() : super(name, path: '');

  static const String name = 'AccountRoute';
}

/// generated route for [_i8.ProfileView]
class ProfileRoute extends _i3.PageRouteInfo<void> {
  const ProfileRoute() : super(name, path: 'profile');

  static const String name = 'ProfileRoute';
}

/// generated route for [_i9.SampleItemListView]
class SampleItemListRoute extends _i3.PageRouteInfo<void> {
  const SampleItemListRoute() : super(name, path: '');

  static const String name = 'SampleItemListRoute';
}

/// generated route for [_i10.SampleItemDetailsView]
class SampleItemDetailsRoute
    extends _i3.PageRouteInfo<SampleItemDetailsRouteArgs> {
  SampleItemDetailsRoute({required String id, _i26.Key? key})
      : super(name,
            path: ':id',
            args: SampleItemDetailsRouteArgs(id: id, key: key),
            rawPathParams: {'id': id});

  static const String name = 'SampleItemDetailsRoute';
}

class SampleItemDetailsRouteArgs {
  const SampleItemDetailsRouteArgs({required this.id, this.key});

  final String id;

  final _i26.Key? key;
}

/// generated route for [_i11.DevView]
class DevRoute extends _i3.PageRouteInfo<void> {
  const DevRoute() : super(name, path: '');

  static const String name = 'DevRoute';
}

/// generated route for [_i12.DevDeviceView]
class DevDeviceRoute extends _i3.PageRouteInfo<void> {
  const DevDeviceRoute() : super(name, path: 'device');

  static const String name = 'DevDeviceRoute';
}

/// generated route for [_i13.DevButtonView]
class DevButtonRoute extends _i3.PageRouteInfo<void> {
  const DevButtonRoute() : super(name, path: 'button');

  static const String name = 'DevButtonRoute';
}

/// generated route for [_i14.DevThemeView]
class DevThemeRoute extends _i3.PageRouteInfo<void> {
  const DevThemeRoute() : super(name, path: 'theme');

  static const String name = 'DevThemeRoute';
}

/// generated route for [_i15.DevTextView]
class DevTextRoute extends _i3.PageRouteInfo<void> {
  const DevTextRoute() : super(name, path: 'textTheme');

  static const String name = 'DevTextRoute';
}

/// generated route for [_i16.DevDialogView]
class DevDialogRoute extends _i3.PageRouteInfo<void> {
  const DevDialogRoute() : super(name, path: 'dialog');

  static const String name = 'DevDialogRoute';
}

/// generated route for [_i17.DevInputView]
class DevInputRoute extends _i3.PageRouteInfo<void> {
  const DevInputRoute() : super(name, path: 'input');

  static const String name = 'DevInputRoute';
}

/// generated route for [_i18.DevOtherView]
class DevOtherRoute extends _i3.PageRouteInfo<void> {
  const DevOtherRoute() : super(name, path: 'other');

  static const String name = 'DevOtherRoute';
}

/// generated route for [_i19.OrderReceiveTypeView]
class OrderReceiveTypeRoute extends _i3.PageRouteInfo<void> {
  const OrderReceiveTypeRoute() : super(name, path: '');

  static const String name = 'OrderReceiveTypeRoute';
}

/// generated route for [_i20.OrderAddressUserView]
class OrderAddressUserRoute extends _i3.PageRouteInfo<void> {
  const OrderAddressUserRoute() : super(name, path: 'userAddress');

  static const String name = 'OrderAddressUserRoute';
}

/// generated route for [_i21.OrderAddressShopView]
class OrderAddressShopRoute extends _i3.PageRouteInfo<void> {
  const OrderAddressShopRoute() : super(name, path: 'shopAddress');

  static const String name = 'OrderAddressShopRoute';
}

/// generated route for [_i22.OrderPaymentTypeView]
class OrderPaymentTypeRoute extends _i3.PageRouteInfo<void> {
  const OrderPaymentTypeRoute() : super(name, path: 'paymentType');

  static const String name = 'OrderPaymentTypeRoute';
}

/// generated route for [_i23.OrderConfirmView]
class OrderConfirmRoute extends _i3.PageRouteInfo<void> {
  const OrderConfirmRoute() : super(name, path: 'confirm');

  static const String name = 'OrderConfirmRoute';
}

/// generated route for [_i24.OrderPaymentView]
class OrderPaymentRoute extends _i3.PageRouteInfo<void> {
  const OrderPaymentRoute() : super(name, path: 'payment');

  static const String name = 'OrderPaymentRoute';
}

/// generated route for [_i25.OrderSuccessView]
class OrderSuccessRoute extends _i3.PageRouteInfo<void> {
  const OrderSuccessRoute() : super(name, path: 'success');

  static const String name = 'OrderSuccessRoute';
}
