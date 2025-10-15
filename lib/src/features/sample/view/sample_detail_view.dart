import 'package:flutter/material.dart';

class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
