import 'package:flutter/material.dart';

class DevScreenLayout extends StatelessWidget {
  const DevScreenLayout(
    this.title, {
    this.children = const <Widget>[],
    this.padding,
    this.backgroundColor,
    this.floatingActionButton,
    this.actions,
    this.bottomNavigationBar,
    this.controller,
    this.reverse = false,
    super.key,
  });
  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final bool reverse;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: ListView(
        controller: controller,
        reverse: reverse,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 16),
        children: children,
      ),
    );
  }
}
