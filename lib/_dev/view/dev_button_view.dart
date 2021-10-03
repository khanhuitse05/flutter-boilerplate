import 'package:flutter/material.dart';
import 'package:my_app/_dev/widgets/dev_screen_layout.dart';
import 'package:my_app/_dev/widgets/dev_title.dart';
import 'package:my_app/widgets/button/button.dart';
import 'package:my_app/widgets/button/outlined_button.dart';

class DevButtonView extends StatefulWidget {
  const DevButtonView({Key? key}) : super(key: key);

  @override
  State<DevButtonView> createState() => _DevButtonViewState();
}

class _DevButtonViewState extends State<DevButtonView> {
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
        _title('2. XButton'),
        XButton(
          child: Text('XButton'),
          busy: busy,
          enabled: enabled,
          onPressed: () {},
        ),
        _title('2. XOutlinedButton'),
        XOutlinedButton(
          child: Text('XOutlinedButton'),
          busy: busy,
          enabled: enabled,
          onPressed: () {},
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
