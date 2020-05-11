import 'package:flutter/material.dart';
import 'package:my_app/repository/utility/navigation_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final bool bigScreen = MediaQuery.of(context).size.width >= 320;
    final NavigationProvider navigationProvider = Provider.of(context);
    return BottomNavigationBar(
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
      currentIndex: navigationProvider.index,
      selectedItemColor: Theme.of(context).primaryColor,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(_index) {
    Provider.of<NavigationProvider>(context, listen: false).switchTo(_index);
  }

  Widget _buildIcon(IconData icon, {double size}) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}
