import 'package:flutter/material.dart';

class AnimatedColorLoading extends StatefulWidget {
  AnimatedColorLoading({Duration duration})
      : duration = duration ?? Duration(milliseconds: 1500);

  final Duration duration;

  @override
  _AnimatedColorLoadingState createState() => _AnimatedColorLoadingState();
}

class _AnimatedColorLoadingState extends State<AnimatedColorLoading>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animationCurves;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final Animation curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart);
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

  final _colors = [
  Colors.grey[200],
  Colors.grey[300],
  Colors.grey[200],
  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      child: AnimatedBuilder(
          animation: _animationCurves,
          builder: (BuildContext context, Widget child) {
            double _value = (_animationCurves.value - 0.5) * 4;

            return Container(
              decoration: BoxDecoration(
                border: new Border.all(
                    color: Color(0xFFEDEDED), width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(5),
                gradient: new LinearGradient(
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(_value, _value),
                  colors: _colors,
                ),
                color: Colors.lightGreen,
              ),
            );
          }),
    );
  }
}
