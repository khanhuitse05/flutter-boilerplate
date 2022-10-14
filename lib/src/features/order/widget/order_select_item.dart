import 'package:flutter/material.dart';

class OrderSelectItem extends StatelessWidget {
  const OrderSelectItem({
    required this.title,
    required this.value,
    required this.onTap,
    super.key,
  });

  final String title;
  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style:
            TextStyle(fontWeight: value ? FontWeight.bold : FontWeight.normal),
      ),
      trailing: _buildIconSelect(),
    );
  }

  Widget _buildIconSelect() {
    if (value) {
      return Icon(Icons.radio_button_checked);
    } else {
      return Icon(Icons.radio_button_off);
    }
  }
}
