import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedContainerLoop extends StatefulWidget {
  AnimatedContainerLoop(this.width, this.height, {Key key, Duration duration})
      : duration = duration ?? Duration(milliseconds: 1500),
        super(key: key);

  final Duration duration;
  final double width;
  final double height;

  @override
  _AnimatedContainerLoopState createState() => _AnimatedContainerLoopState();
}

class _AnimatedContainerLoopState extends State<AnimatedContainerLoop>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animationCurves;

  final Color fadeLoading = Colors.grey.withAlpha(100);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
        setState(() {});
      });

    final Animation curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutQuint);
    _animationCurves = new Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(curve);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width * _animationCurves.value,
      height: widget.height * _animationCurves.value,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: fadeLoading,
        ),
      ),
    );
  }
}
