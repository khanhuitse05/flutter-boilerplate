import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/common/logic/lifecycle_mixin.dart';
import 'package:my_app/src/features/dashboard/logic/dashboard_bloc.dart';
import 'package:my_app/src/features/dashboard/widget/bottom_navigation_bar.dart';
import 'package:my_app/src/router/auto_router.gr.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> with LifecycleMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DashBoardBloc()),
      ],
      child: BlocBuilder<DashBoardBloc, DashBoardState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async {
              context.read<DashBoardBloc>().setActiveIndex(TapIndex.home.index);
              return false;
            },
            child: AutoTabsScaffold(
              routes: [
                HomeRouter(),
                AccountRouter(),
              ],
              bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
                context.read<DashBoardBloc>().tabsRouter = tabsRouter;
                return XBottomNavigationBar(tabsRouter);
              },
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
}
