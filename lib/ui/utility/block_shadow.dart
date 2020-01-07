import 'package:flutter/material.dart';

class BlockShadow extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;

  const BlockShadow({@required this.child, this.padding, this.margin});

  @override
  _BlockShadowState createState() =>
      _BlockShadowState(padding: this.padding, margin: this.margin);
}

class _BlockShadowState extends State<BlockShadow> {
  final EdgeInsets margin;
  final EdgeInsets padding;

  _BlockShadowState({this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin ?? EdgeInsets.only(left: 15, right: 15, top: 15),
      padding: this.padding ?? EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
                color: Colors.black12,
                offset: new Offset(3.0, 5),
                blurRadius: 10)
          ]),
      child: widget.child,
    );
  }
}
