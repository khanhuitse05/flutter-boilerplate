import 'package:flutter/material.dart';
import 'package:my_app/features/home/home_page.dart';
import 'package:my_app/src/widget/helper/lifecycle_mixin.dart';
import 'package:provider/provider.dart';

import 'controller/tabbar_provider.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with LifecycleMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TabBarProvider(),
      builder: (context, index) {
        return WillPopScope(
            onWillPop: () async {
              context.read<TabBarProvider>().switchTo(0);
              return Future.value(false);
            },
            child: Scaffold(
              body: IndexedStack(
                index: context.watch<TabBarProvider>().index,
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
                  currentIndex: context.watch<TabBarProvider>().index,
                  onTap: (index) {
                    context.read<TabBarProvider>().switchTo(index);
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
