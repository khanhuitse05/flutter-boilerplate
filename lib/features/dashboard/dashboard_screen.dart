import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_app/features/home/home_page.dart';
import 'package:my_app/src/widget/helper/lifecycle_mixin.dart';
import 'controller/tabbar_provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarProvider>(
      init: TabBarProvider(),
      builder: (controller) {
        final index = controller.index;
        return WillPopScope(
            onWillPop: () async {
              controller.switchTo(0);
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
              bottomNavigationBar: Theme(
                data: ThemeData(
                  splashColor: Theme.of(context).accentColor.withOpacity(0.1),
                  highlightColor:
                      Theme.of(context).accentColor.withOpacity(0.1),
                ),
                child: BottomNavigationBar(
                  currentIndex: index,
                  onTap: (index) {
                    controller.switchTo(index);
                  },
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Theme.of(context).accentColor,
                  unselectedItemColor: Colors.black,
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
            ));
      },
    );
  }

  @override
  void onPause() {}

  @override
  void onResume() {
    debugPrint('App resume call back');
  }
}
