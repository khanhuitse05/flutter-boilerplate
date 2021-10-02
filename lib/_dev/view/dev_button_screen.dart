import 'package:flutter/material.dart';
import 'package:my_app/_dev/widgets/dev_screen_layout.dart';
import 'package:my_app/_dev/widgets/dev_title.dart';

class DevButtonScreen extends StatefulWidget {
  const DevButtonScreen({Key? key}) : super(key: key);

  @override
  State<DevButtonScreen> createState() => _DevButtonScreenState();
}

class _DevButtonScreenState extends State<DevButtonScreen> {
  bool busy = false;
  bool enabled = true;
  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Button',
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      children: [
        _title('Button State'),
        CheckboxListTile(
            title: Text('Loading'),
            value: busy,
            onChanged: (val) {
              setState(() {
                busy = !busy;
              });
            }),
        CheckboxListTile(
            title: Text('Enabled'),
            value: enabled,
            onChanged: (val) {
              setState(() {
                enabled = !enabled;
              });
            }),
        _title('1. IconButton'),
        IconButton(
          onPressed: enabled ? () {} : null,
          icon: Icon(Icons.add_circle),
        ),
        _title('2. ElevatedButton'),
        ElevatedButton(
          child: Text('ElevatedButton'),
          onPressed: enabled ? () {} : null,
        ),
      ],
    );
  }

  Widget _title(String title) {
    return DevTitle(
      title,
      horizontalPadding: 0,
    );
  }
}
