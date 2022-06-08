import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XInput extends StatefulWidget {
  const XInput({
    required this.value,
    Key? key,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.decoration,
    this.textAlign = TextAlign.left,
    this.style,
    this.maxLength,
    this.autofocus = false,
    this.inputFormatters,
  }) : super(key: key);
  final String value;
  final TextInputType? keyboardType;
  final bool obscureText;

  final ValueChanged<String>? onChanged;
  final InputDecoration? decoration;
  final int? maxLength;
  final bool autofocus;
  // style
  final TextAlign textAlign;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<XInput> createState() => _XInputState();
}

class _XInputState extends State<XInput> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool obscureText = false;
  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(XInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? _buildActions() {
      final List<Widget> actions = [];
      if (value.isNotEmpty) {
        actions.add(
          InkWell(
            onTap: () {
              widget.onChanged?.call('');
            },
            child: Icon(Icons.cancel),
          ),
        );
      }
      if (widget.obscureText) {
        actions.add(
          IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
          ),
        );
      }

      if (actions.isEmpty) {
        return null;
      }
      if (actions.length == 1) {
        return actions[0];
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: actions,
      );
    }

    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      style: widget.style,
      textAlign: widget.textAlign,
      obscureText: obscureText,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      scrollPhysics: NeverScrollableScrollPhysics(),
      inputFormatters: widget.inputFormatters,
      decoration: (widget.decoration ?? InputDecoration()).copyWith(
        prefixIcon:
            widget.textAlign == TextAlign.center ? SizedBox(width: 24) : null,
        labelStyle: TextStyle(color: Color(0xCC50555C)),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: false,
        errorStyle: TextStyle(fontSize: 14, letterSpacing: 0.25),
        suffixIcon: _buildActions(),
      ),
    );
  }
}
