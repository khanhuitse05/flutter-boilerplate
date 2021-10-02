import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/features/common/logic/lifecycle_mixin.dart';
import 'package:my_app/src/features/dashboard/logic/dashboard_bloc.dart';
import 'package:my_app/src/features/home/view/home_view.dart';

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

  final DashBoardBloc bloc = DashBoardBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: BlocBuilder<DashBoardBloc, DashBoardState>(
        builder: (context, state) {
          final index = state.tapIndex;
          return WillPopScope(
            onWillPop: () async {
              bloc.onTapChanged(0);
              return false;
            },
            child: Scaffold(
              body: IndexedStack(
                index: index,
                children: [
                  HomeView(),
                  Container(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: index,
                onTap: (index) {
                  bloc.onTapChanged(index);
                },
                items: const [
                  BottomNavigationBarItem(
                    label: "Home",
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    label: "Category",
                    icon: Icon(Icons.category),
                  )
                ],
              ),
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
