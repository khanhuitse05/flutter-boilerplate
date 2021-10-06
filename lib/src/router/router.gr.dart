// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i18;

import '../../_dev/location/dev_view.dart' as _i10;
import '../../_dev/location/dev_wrapper_view.dart' as _i4;
import '../../_dev/view/dev_button_view.dart' as _i12;
import '../../_dev/view/dev_device_view.dart' as _i11;
import '../../_dev/view/dev_dialog_view.dart' as _i15;
import '../../_dev/view/dev_input_view.dart' as _i16;
import '../../_dev/view/dev_other_view.dart' as _i17;
import '../../_dev/view/dev_text_view.dart' as _i14;
import '../../_dev/view/dev_theme_view.dart' as _i13;
import '../features/account/profile/view/profile_view.dart' as _i7;
import '../features/account/view/account_view.dart' as _i6;
import '../features/dashboard/view/dashboard_view.dart' as _i1;
import '../features/home/view/home_view.dart' as _i5;
import '../features/sample/view/sample_detail_view.dart' as _i9;
import '../features/sample/view/sample_list_view.dart' as _i8;
import '../features/settings/settings_view.dart' as _i2;

class XRouter extends _i3.RootStackRouter {
  XRouter([_i18.GlobalKey<_i18.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    DashBoardView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.DashBoardView());
    },
    SettingsView.name: (routeData) {
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
    HomeRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomeView());
    },
    AccountRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    AccountView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AccountView());
    },
    ProfileView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfileView());
    },
    SampleItemListView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SampleItemListView());
    },
    SampleItemDetailsView.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<SampleItemDetailsViewArgs>(
          orElse: () =>
              SampleItemDetailsViewArgs(id: pathParams.getString('id')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.SampleItemDetailsView(id: args.id, key: args.key));
    },
    DevView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.DevView());
    },
    DevDeviceView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.DevDeviceView());
    },
    DevButtonView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.DevButtonView());
    },
    DevThemeView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.DevThemeView());
    },
    DevTextView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.DevTextView());
    },
    DevDialogView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.DevDialogView());
    },
    DevInputView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i16.DevInputView());
    },
    DevOtherView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.DevOtherView());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(DashBoardView.name, path: '/', children: [
          _i3.RouteConfig(HomeRouter.name, path: 'home'),
          _i3.RouteConfig(AccountRouter.name, path: 'account', children: [
            _i3.RouteConfig(AccountView.name, path: ''),
            _i3.RouteConfig(ProfileView.name, path: 'profile'),
            _i3.RouteConfig('*#redirect',
                path: '*', redirectTo: '', fullMatch: true)
          ])
        ]),
        _i3.RouteConfig(SettingsView.name, path: '/setting'),
        _i3.RouteConfig(SampleRouter.name, path: '/sample', children: [
          _i3.RouteConfig(SampleItemListView.name, path: ''),
          _i3.RouteConfig(SampleItemDetailsView.name, path: ':id'),
          _i3.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i3.RouteConfig(DevRouter.name, path: '/dev', children: [
          _i3.RouteConfig(DevView.name, path: ''),
          _i3.RouteConfig(DevDeviceView.name, path: 'device'),
          _i3.RouteConfig(DevButtonView.name, path: 'button'),
          _i3.RouteConfig(DevThemeView.name, path: 'theme'),
          _i3.RouteConfig(DevTextView.name, path: 'textTheme'),
          _i3.RouteConfig(DevDialogView.name, path: 'dialog'),
          _i3.RouteConfig(DevInputView.name, path: 'input'),
          _i3.RouteConfig(DevOtherView.name, path: 'other'),
          _i3.RouteConfig('*#redirect',
              path: '*', redirectTo: '', fullMatch: true)
        ]),
        _i3.RouteConfig('*#redirect',
            path: '*', redirectTo: '', fullMatch: true)
      ];
}

/// generated route for [_i1.DashBoardView]
class DashBoardView extends _i3.PageRouteInfo<void> {
  const DashBoardView({List<_i3.PageRouteInfo>? children})
      : super(name, path: '/', initialChildren: children);

  static const String name = 'DashBoardView';
}

/// generated route for [_i2.SettingsView]
class SettingsView extends _i3.PageRouteInfo<void> {
  const SettingsView() : super(name, path: '/setting');

  static const String name = 'SettingsView';
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

/// generated route for [_i5.HomeView]
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

/// generated route for [_i6.AccountView]
class AccountView extends _i3.PageRouteInfo<void> {
  const AccountView() : super(name, path: '');

  static const String name = 'AccountView';
}

/// generated route for [_i7.ProfileView]
class ProfileView extends _i3.PageRouteInfo<void> {
  const ProfileView() : super(name, path: 'profile');

  static const String name = 'ProfileView';
}

/// generated route for [_i8.SampleItemListView]
class SampleItemListView extends _i3.PageRouteInfo<void> {
  const SampleItemListView() : super(name, path: '');

  static const String name = 'SampleItemListView';
}

/// generated route for [_i9.SampleItemDetailsView]
class SampleItemDetailsView
    extends _i3.PageRouteInfo<SampleItemDetailsViewArgs> {
  SampleItemDetailsView({required String id, _i18.Key? key})
      : super(name,
            path: ':id',
            args: SampleItemDetailsViewArgs(id: id, key: key),
            rawPathParams: {'id': id});

  static const String name = 'SampleItemDetailsView';
}

class SampleItemDetailsViewArgs {
  const SampleItemDetailsViewArgs({required this.id, this.key});

  final String id;

  final _i18.Key? key;
}

/// generated route for [_i10.DevView]
class DevView extends _i3.PageRouteInfo<void> {
  const DevView() : super(name, path: '');

  static const String name = 'DevView';
}

/// generated route for [_i11.DevDeviceView]
class DevDeviceView extends _i3.PageRouteInfo<void> {
  const DevDeviceView() : super(name, path: 'device');

  static const String name = 'DevDeviceView';
}

/// generated route for [_i12.DevButtonView]
class DevButtonView extends _i3.PageRouteInfo<void> {
  const DevButtonView() : super(name, path: 'button');

  static const String name = 'DevButtonView';
}

/// generated route for [_i13.DevThemeView]
class DevThemeView extends _i3.PageRouteInfo<void> {
  const DevThemeView() : super(name, path: 'theme');

  static const String name = 'DevThemeView';
}

/// generated route for [_i14.DevTextView]
class DevTextView extends _i3.PageRouteInfo<void> {
  const DevTextView() : super(name, path: 'textTheme');

  static const String name = 'DevTextView';
}

/// generated route for [_i15.DevDialogView]
class DevDialogView extends _i3.PageRouteInfo<void> {
  const DevDialogView() : super(name, path: 'dialog');

  static const String name = 'DevDialogView';
}

/// generated route for [_i16.DevInputView]
class DevInputView extends _i3.PageRouteInfo<void> {
  const DevInputView() : super(name, path: 'input');

  static const String name = 'DevInputView';
}

/// generated route for [_i17.DevOtherView]
class DevOtherView extends _i3.PageRouteInfo<void> {
  const DevOtherView() : super(name, path: 'other');

  static const String name = 'DevOtherView';
}
