import 'package:flutter/material.dart';
import 'package:my_app/_devmode/view/dev_popup_demo_screen.dart';

import 'dev_info_screen.dart';

class DevScreen extends StatefulWidget {
  @override
  _DevScreenState createState() => _DevScreenState();
}

class _DevScreenState extends State<DevScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dev Only"),
      ),
      body: ListView(
        children: [
          _buildItem(
            "Information",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DevInfoScreen()),
            ),
          ),
          _buildItem(
            "Demo Popup",
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DevPopupDemoScreen()),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor))),
        child: Row(
          children: [
            Expanded(child: Text(title)),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),
    );
  }
}
