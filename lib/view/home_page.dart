import 'package:animations/animations.dart';
import 'package:my_app/repository/utility/navigation_provider.dart';
import 'package:my_app/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ui/button/custom_bottom_navigation.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<NavigationProvider>(context, listen: false).switchTo(0);
        return Future.value(false);
      },
      child: Consumer<NavigationProvider>(
          builder: (context, navigationProvider, _) {
        return Scaffold(
          body: PageTransitionSwitcher(
            transitionBuilder: (
              child,
              animation,
              secondaryAnimation,
            ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: homeTap[navigationProvider.index],
          ),
          bottomNavigationBar: CustomBottomNavigation(),
        );
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future didChangeAppLifecycleState(AppLifecycleState _state) async {
    switch (_state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        resumeCallBack();
        break;
      case AppLifecycleState.inactive:
      default:
        break;
    }
  }

  void resumeCallBack() {
    debugPrint('App resume call back');
  }
}
