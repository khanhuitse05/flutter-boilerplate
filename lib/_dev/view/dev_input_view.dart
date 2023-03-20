import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DevInputView extends StatefulWidget {
  @override
  _DevInputViewState createState() => _DevInputViewState();
}

class _DevInputViewState extends State<DevInputView> {
  InputDecoration getDecoration({InputBorder? border}) {
    return InputDecoration(
        hintText: !hintText ? null : "Hint Text",
        labelText: !labelText ? null : "Label Text",
        errorText: !errorText ? null : "Error Text",
        helperText: !helpText ? null : "Help Text",
        counterText: !counterText ? null : "232",
        prefix: !prefix ? null : Text("Prefix"),
        suffix: !suffix ? null : Text("Suffix"),
        prefixIcon: !prefixIcon ? null : Icon(Icons.access_alarms),
        suffixIcon: !suffixIcon
            ? null
            : IconButton(icon: Icon(Icons.close), onPressed: () {}),
        isDense: isDense,
        alignLabelWithHint: alignLabelWithHint,
        filled: filled,
        border: border);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form view"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: getDecoration(),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: getDecoration(border: OutlineInputBorder()),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          SwitchListTile(
              title: Text("Hint Text"),
              value: hintText,
              onChanged: (value) {
                setState(() {
                  hintText = value;
                });
              }),
          SwitchListTile(
              title: Text("Label Text"),
              value: labelText,
              onChanged: (value) {
                setState(() {
                  labelText = value;
                });
              }),
          SwitchListTile(
              title: Text("Help Text"),
              value: helpText,
              onChanged: (value) {
                setState(() {
                  helpText = value;
                });
              }),
          SwitchListTile(
              title: Text("Error Text"),
              value: errorText,
              onChanged: (value) {
                setState(() {
                  errorText = value;
                });
              }),
          SwitchListTile(
              title: Text("Counter Text"),
              value: counterText,
              onChanged: (value) {
                setState(() {
                  counterText = value;
                });
              }),
          SwitchListTile(
              title: Text("Prefix"),
              value: prefix,
              onChanged: (value) {
                setState(() {
                  prefix = value;
                });
              }),
          SwitchListTile(
              title: Text("Suffix"),
              value: suffix,
              onChanged: (value) {
                setState(() {
                  suffix = value;
                });
              }),
          SwitchListTile(
              title: Text("Prefix Icon"),
              value: prefixIcon,
              onChanged: (value) {
                setState(() {
                  prefixIcon = value;
                });
              }),
          SwitchListTile(
              title: Text("Suffix Icon"),
              value: suffixIcon,
              onChanged: (value) {
                setState(() {
                  suffixIcon = value;
                });
              }),
          SwitchListTile(
              title: Text("Is Dense"),
              value: isDense,
              onChanged: (value) {
                setState(() {
                  isDense = value;
                });
              }),
          SwitchListTile(
              title: Text("Filled"),
              value: filled,
              onChanged: (value) {
                setState(() {
                  filled = value;
                });
              }),
          SwitchListTile(
              title: Text("Align Label With Hint"),
              value: alignLabelWithHint,
              onChanged: (value) {
                setState(() {
                  alignLabelWithHint = value;
                });
              }),
        ],
      ),
    );
  }

  bool hintText = true;
  bool labelText = true;
  bool helpText = false;
  bool errorText = true;
  bool prefix = false;
  bool suffix = false;
  bool prefixIcon = false;
  bool suffixIcon = false;
  bool isDense = false;
  bool counterText = false;
  bool filled = false;
  bool alignLabelWithHint = false;
}
