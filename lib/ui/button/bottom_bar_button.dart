import 'package:flutter/material.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({this.child, this.onPressed});

  final Widget child;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(26, 35, 76, 117),
                offset: Offset(0, -5),
                blurRadius: 3,
              ),
            ]),
        padding: EdgeInsets.fromLTRB(
            16, 5, 16, 10 + MediaQuery.of(context).viewInsets.bottom),
        child: RaisedButton(
          child: child,
          onPressed: onPressed,
        ),
      ),
    );
  }
}

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(26, 35, 76, 117),
                  offset: Offset(0, -2),
                  blurRadius: 5,
                ),
              ]),
          padding: EdgeInsets.fromLTRB(
              16, 5, 16, 10 + MediaQuery.of(context).viewInsets.bottom),
          child: child,
        ));
  }
}
