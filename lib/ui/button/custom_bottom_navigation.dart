import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:my_app/repository/utility/navigation_provider.dart';

class CustomBottomNavigation extends StatefulWidget {
  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final bool bigScreen = MediaQuery.of(context).size.width >= 320;
    return Consumer((context, read) {
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
        ],
        currentIndex: read(navProvider).index,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      );
    });
  }

  void _onItemTapped(_index) {
    navProvider.read(context).switchTo(_index);
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
