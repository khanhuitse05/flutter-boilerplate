import 'package:flutter/material.dart';
import 'package:myapp/src/theme/colors.dart';

class NotFoundView extends StatelessWidget {
  const NotFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textSecondary,
      ),
      body: Center(
        child: Text(
          'Page not found',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
