import 'package:flutter/material.dart';

class DevInfoScreen extends StatefulWidget {
  @override
  _DevInfoScreenState createState() => _DevInfoScreenState();
}

class _DevInfoScreenState extends State<DevInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dev Only"),
      ),
      body: ListView(
        children: [
          _buildItem(
            "Token",
            "Missing token",
            onTap: () {
              // copy
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem(String title, String value, {VoidCallback? onTap}) {
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
