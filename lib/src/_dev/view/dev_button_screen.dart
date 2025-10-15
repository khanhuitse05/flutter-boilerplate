import 'package:flutter/material.dart';
import 'package:myapp/src/_dev/widget/dev_screen_layout.dart';
import 'package:myapp/src/_dev/widget/dev_title.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/button/model/button_size.dart';
import 'package:myapp/widgets/button/outlined_button.dart';
import 'package:myapp/widgets/button/secondary_button.dart';
import 'package:myapp/widgets/button/text_button.dart';

enum EButtonSize { small, medium, large }

extension EButtonSizeExt on EButtonSize {
  ButtonSize toSize() {
    switch (this) {
      case EButtonSize.small:
        return ButtonSize.small();
      case EButtonSize.medium:
        return ButtonSize.medium();
      case EButtonSize.large:
        return ButtonSize.large();
    }
  }
}

class DevButtonScreen extends StatefulWidget {
  const DevButtonScreen({super.key});

  @override
  State<DevButtonScreen> createState() => _DevButtonScreenState();
}

class _DevButtonScreenState extends State<DevButtonScreen> {
  bool busy = false;
  bool enabled = true;
  EButtonSize size = EButtonSize.medium;

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 16);
    return DevScreenLayout(
      'Button',
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
      children: [
        _title('Button State'),
        CheckboxListTile(
            title: const Text('Loading'),
            value: busy,
            onChanged: (val) {
              setState(() {
                busy = !busy;
              });
            }),
        CheckboxListTile(
            title: const Text('Enabled'),
            value: enabled,
            onChanged: (val) {
              setState(() {
                enabled = !enabled;
              });
            }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Text('Button Size'),
              const Spacer(),
              DropdownButton<EButtonSize>(
                  items: EButtonSize.values
                      .map((e) => DropdownMenuItem<EButtonSize>(
                            value: e,
                            child: Text(e.name),
                          ))
                      .toList(),
                  value: size,
                  onChanged: (e) {
                    setState(() {
                      size = e ?? size;
                    });
                  }),
            ],
          ),
        ),
        _title('1. Primary Button'),
        ...[
          XButton(
            title: 'Button',
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
          XButton(
            title: 'Button',
            icon: const Icon(Icons.add),
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
          XSecondaryButton(
            title: 'SecondaryButton',
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
          XSecondaryButton(
            title: 'SecondaryButton',
            icon: const Icon(Icons.add),
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
          XOutlinedButton(
            title: 'OutlinedButton',
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
          XOutlinedButton(
            title: 'OutlinedButton',
            icon: const Icon(Icons.add),
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
          XTextButton(
            title: 'Text Button',
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
          XTextButton(
            title: 'Text Button',
            icon: const Icon(Icons.add),
            busy: busy,
            enabled: enabled,
            size: size.toSize(),
          ),
        ].map((e) => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [e, spacer],
            ))
      ],
    );
  }

  Widget _title(String title) {
    return DevTitle(title, horizontalPadding: 0);
  }
}
