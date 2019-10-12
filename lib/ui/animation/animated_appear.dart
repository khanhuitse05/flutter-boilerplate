import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vector_math/vector_math_64.dart';

class AnimatedAppear extends StatefulWidget {
  AnimatedAppear({@required this.child, this.duration = _defaultDuration});

  @override
  _AnimatedAppearState createState() => _AnimatedAppearState();

  final Widget child;
  final Duration duration;

  static const _defaultDuration = Duration(seconds: 1);
}

class _AnimatedAppearState extends State<AnimatedAppear>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() => setState(() {}));

    final Animation curve = CurvedAnimation(
        parent: animationController, curve: Curves.bounceOut);

    animation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(curve);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double value = animation.value;
    return Transform(
      origin: Offset(0.5, 0.5),
      alignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
          value, value, 1),
      child: widget.child,
    );
  }
}
