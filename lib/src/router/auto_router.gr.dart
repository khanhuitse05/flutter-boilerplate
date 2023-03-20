// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i28;
import 'package:flutter/material.dart' as _i29;
import 'package:my_app/_dev/location/dev_home_view.dart' as _i25;
import 'package:my_app/_dev/location/dev_wrapper_view.dart' as _i1;
import 'package:my_app/_dev/view/dev_button_view.dart' as _i8;
import 'package:my_app/_dev/view/dev_device_view.dart' as _i7;
import 'package:my_app/_dev/view/dev_dialog_view.dart' as _i4;
import 'package:my_app/_dev/view/dev_input_view.dart' as _i6;
import 'package:my_app/_dev/view/dev_other_view.dart' as _i5;
import 'package:my_app/_dev/view/dev_text_view.dart' as _i3;
import 'package:my_app/_dev/view/dev_theme_view.dart' as _i2;
import 'package:my_app/src/features/account/profile/view/profile_view.dart'
    as _i23;
import 'package:my_app/src/features/account/view/account_view.dart' as _i24;
import 'package:my_app/src/features/account/view/account_wrapper_view.dart'
    as _i27;
import 'package:my_app/src/features/common/view/not_found_view.dart' as _i20;
import 'package:my_app/src/features/dashboard/view/dashboard_view.dart' as _i19;
import 'package:my_app/src/features/home/view/home_view.dart' as _i18;
import 'package:my_app/src/features/order/router/order_wrapper_view.dart'
    as _i16;
import 'package:my_app/src/features/order/view/order_address_shop_view.dart'
    as _i10;
import 'package:my_app/src/features/order/view/order_address_user_view.dart'
    as _i12;
import 'package:my_app/src/features/order/view/order_confirm_view.dart' as _i14;
import 'package:my_app/src/features/order/view/order_payment_type_view.dart'
    as _i13;
import 'package:my_app/src/features/order/view/order_payment_view.dart' as _i9;
import 'package:my_app/src/features/order/view/order_receive_type_view.dart'
    as _i11;
import 'package:my_app/src/features/order/view/order_success_view.dart' as _i15;
import 'package:my_app/src/features/sample/router/sample_wrapper_view.dart'
    as _i26;
import 'package:my_app/src/features/sample/view/sample_detail_view.dart'
    as _i22;
import 'package:my_app/src/features/sample/view/sample_list_view.dart' as _i21;
import 'package:my_app/src/features/settings/settings_view.dart' as _i17;

abstract class $XRouter extends _i28.RootStackRouter {
  $XRouter([_i29.GlobalKey<_i29.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    DevRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DevWrapperView(),
      );
    },
    DevThemeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DevThemeView(),
      );
    },
    DevTextRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DevTextView(),
      );
    },
    DevDialogRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DevDialogView(),
      );
    },
    DevOtherRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DevOtherView(),
      );
    },
    DevInputRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.DevInputView(),
      );
    },
    DevDeviceRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.DevDeviceView(),
      );
    },
    DevButtonRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.DevButtonView(),
      );
    },
    OrderPaymentRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OrderPaymentView(),
      );
    },
    OrderAddressShopRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OrderAddressShopView(),
      );
    },
    OrderReceiveTypeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OrderReceiveTypeView(),
      );
    },
    OrderAddressUserRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OrderAddressUserView(),
      );
    },
    OrderPaymentTypeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.OrderPaymentTypeView(),
      );
    },
    OrderConfirmRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.OrderConfirmView(),
      );
    },
    OrderSuccessRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OrderSuccessView(),
      );
    },
    OrderRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.OrderWrapperView(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SettingsView(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.HomeView(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.DashBoardView(),
      );
    },
    NotFoundRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.NotFoundView(),
      );
    },
    SampleItemListRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.SampleItemListView(),
      );
    },
    SampleItemDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SampleItemDetailsRouteArgs>(
          orElse: () =>
              SampleItemDetailsRouteArgs(id: pathParams.getString('id')));
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.SampleItemDetailsView(
          id: args.id,
          key: args.key,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.ProfileView(),
      );
    },
    AccountHomeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.AccountHomeView(),
      );
    },
    DevHomeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.DevHomeView(),
      );
    },
    SampleRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SampleWrapperView(),
      );
    },
    AccountRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.AccountWrapperView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DevWrapperView]
class DevRoute extends _i28.PageRouteInfo<void> {
  const DevRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DevThemeView]
class DevThemeRoute extends _i28.PageRouteInfo<void> {
  const DevThemeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevThemeRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevThemeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DevTextView]
class DevTextRoute extends _i28.PageRouteInfo<void> {
  const DevTextRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevTextRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevTextRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DevDialogView]
class DevDialogRoute extends _i28.PageRouteInfo<void> {
  const DevDialogRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevDialogRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevDialogRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DevOtherView]
class DevOtherRoute extends _i28.PageRouteInfo<void> {
  const DevOtherRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevOtherRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevOtherRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DevInputView]
class DevInputRoute extends _i28.PageRouteInfo<void> {
  const DevInputRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevInputRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevInputRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i7.DevDeviceView]
class DevDeviceRoute extends _i28.PageRouteInfo<void> {
  const DevDeviceRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevDeviceRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevDeviceRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i8.DevButtonView]
class DevButtonRoute extends _i28.PageRouteInfo<void> {
  const DevButtonRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevButtonRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevButtonRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OrderPaymentView]
class OrderPaymentRoute extends _i28.PageRouteInfo<void> {
  const OrderPaymentRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderPaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderPaymentRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OrderAddressShopView]
class OrderAddressShopRoute extends _i28.PageRouteInfo<void> {
  const OrderAddressShopRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderAddressShopRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderAddressShopRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OrderReceiveTypeView]
class OrderReceiveTypeRoute extends _i28.PageRouteInfo<void> {
  const OrderReceiveTypeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderReceiveTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderReceiveTypeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OrderAddressUserView]
class OrderAddressUserRoute extends _i28.PageRouteInfo<void> {
  const OrderAddressUserRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderAddressUserRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderAddressUserRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OrderPaymentTypeView]
class OrderPaymentTypeRoute extends _i28.PageRouteInfo<void> {
  const OrderPaymentTypeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderPaymentTypeRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderPaymentTypeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i14.OrderConfirmView]
class OrderConfirmRoute extends _i28.PageRouteInfo<void> {
  const OrderConfirmRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderConfirmRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OrderSuccessView]
class OrderSuccessRoute extends _i28.PageRouteInfo<void> {
  const OrderSuccessRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderSuccessRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSuccessRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i16.OrderWrapperView]
class OrderRoute extends _i28.PageRouteInfo<void> {
  const OrderRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OrderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SettingsView]
class SettingsRoute extends _i28.PageRouteInfo<void> {
  const SettingsRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i18.HomeView]
class HomeRouter extends _i28.PageRouteInfo<void> {
  const HomeRouter({List<_i28.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouter';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i19.DashBoardView]
class DashBoardRoute extends _i28.PageRouteInfo<void> {
  const DashBoardRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DashBoardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i20.NotFoundView]
class NotFoundRoute extends _i28.PageRouteInfo<void> {
  const NotFoundRoute({List<_i28.PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i21.SampleItemListView]
class SampleItemListRoute extends _i28.PageRouteInfo<void> {
  const SampleItemListRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SampleItemListRoute.name,
          initialChildren: children,
        );

  static const String name = 'SampleItemListRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i22.SampleItemDetailsView]
class SampleItemDetailsRoute
    extends _i28.PageRouteInfo<SampleItemDetailsRouteArgs> {
  SampleItemDetailsRoute({
    required String id,
    _i29.Key? key,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          SampleItemDetailsRoute.name,
          args: SampleItemDetailsRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'SampleItemDetailsRoute';

  static const _i28.PageInfo<SampleItemDetailsRouteArgs> page =
      _i28.PageInfo<SampleItemDetailsRouteArgs>(name);
}

class SampleItemDetailsRouteArgs {
  const SampleItemDetailsRouteArgs({
    required this.id,
    this.key,
  });

  final String id;

  final _i29.Key? key;

  @override
  String toString() {
    return 'SampleItemDetailsRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i23.ProfileView]
class ProfileRoute extends _i28.PageRouteInfo<void> {
  const ProfileRoute({List<_i28.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i24.AccountHomeView]
class AccountHomeRoute extends _i28.PageRouteInfo<void> {
  const AccountHomeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          AccountHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountHomeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i25.DevHomeView]
class DevHomeRoute extends _i28.PageRouteInfo<void> {
  const DevHomeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DevHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevHomeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i26.SampleWrapperView]
class SampleRoute extends _i28.PageRouteInfo<void> {
  const SampleRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SampleRoute.name,
          initialChildren: children,
        );

  static const String name = 'SampleRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i27.AccountWrapperView]
class AccountRoute extends _i28.PageRouteInfo<void> {
  const AccountRoute({List<_i28.PageRouteInfo>? children})
      : super(
          AccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}
