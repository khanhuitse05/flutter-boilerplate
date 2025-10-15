import 'package:flutter/material.dart';
import 'package:myapp/src/router/route_name.dart';

enum XNavigationBarItems {
  home(
    label: 'Home',
    route: AppRouteNames.home,
    icon: Icons.home_outlined,
    selectedIcon: Icons.home,
  ),
  account(
    label: 'Account',
    route: AppRouteNames.account,
    icon: Icons.people_outline,
    selectedIcon: Icons.people,
  );

  const XNavigationBarItems({
    required this.label,
    required this.route,
    required this.icon,
    this.selectedIcon,
  });

  final String label;
  final AppRouteNames route;
  final IconData icon;
  final IconData? selectedIcon;

  static XNavigationBarItems fromLocation(String location) {
    if (location == XNavigationBarItems.home.route.name) {
      return XNavigationBarItems.home;
    }

    return XNavigationBarItems.home;
  }
}
