import 'package:my_app/repository/utility/navigation_provider.dart';
import 'package:my_app/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    bool bigScreen = MediaQuery.of(context).size.width >= 320;
    return WillPopScope(
      onWillPop: () async {
        _onItemTapped(0);
        return Future.value(false);
      },
      child: Consumer<NavigationProvider>(
          builder: (context, navigationProvider, _) {
            return Scaffold(
              body: homeTap.elementAt(navigationProvider.index),
              bottomNavigationBar: BottomNavigationBar(
                showUnselectedLabels: bigScreen,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                type: bigScreen
                    ? BottomNavigationBarType.fixed
                    : BottomNavigationBarType.shifting,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.category),
                    title: Text('Danh mục'),
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.search),
                    title: Text('Tìm kiếm'),
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.notifications_none),
                    activeIcon: _buildIcon(Icons.notifications),
                    title: Text('Thông báo'),
                  ),
                  BottomNavigationBarItem(
                    icon: _buildIcon(Icons.perm_identity),
                    activeIcon: _buildIcon(Icons.person),
                    title: Text('Cá nhân'),
                  ),
                ],
                currentIndex: navigation.index,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor: AppStyles.dartIcon,
                onTap: _onItemTapped,
              ),
            );
          }),
    );
  }

  Widget _buildIcon(IconData icon, {double size}) {
    return Container(
        height: 30,
        alignment: Alignment.center,
        child: Icon(
          icon,
          size: size,
        ));
  }

  _onItemTapped(_index) {
    Provider.of<NavigationProvider>(context, listen: false).switchTo(_index);
//      tabController.animateTo(_index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    AppDynamicLinks.instance.initDynamicLinks(context);
//    AppOneSignal.instance.initOneSignalOpenedHandler(context);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<Null> didChangeAppLifecycleState(AppLifecycleState _state) async {
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

  resumeCallBack() {
    print('App resume call back');
  }
}
