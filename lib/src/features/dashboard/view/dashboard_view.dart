import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/dashboard/logic/navigation_bar_item.dart';
import 'package:myapp/src/features/common/logic/lifecycle_mixin.dart';
import 'package:myapp/src/features/dashboard/widget/bottom_navigation_bar.dart';
import 'package:myapp/src/features/dashboard/logic/dashboard_bloc.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({
    super.key,
    required this.currentItem,
    required this.body,
  });

  final XNavigationBarItems currentItem;
  final Widget body;

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(widget.currentItem),
      child: BlocBuilder<DashboardBloc, XNavigationBarItems>(
        builder: (context, state) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, _) async {
              context.read<DashboardBloc>().goHome();
            },
            child: Scaffold(
              body: widget.body,
              bottomNavigationBar: const XBottomNavigationBar(),
            ),
          );
        },
      ),
    );
  }

  @override
  void onPause() {}

  @override
  void onResume() {}

  @override
  void didChangeViewFocus(ViewFocusEvent event) {}

  @override
  void handleCancelBackGesture() {}

  @override
  void handleCommitBackGesture() {}

  @override
  bool handleStartBackGesture(PredictiveBackEvent backEvent) => false;

  @override
  void handleUpdateBackGestureProgress(PredictiveBackEvent backEvent) {}
}
