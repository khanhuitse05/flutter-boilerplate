import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/utils/index.dart';
import 'package:my_app/src/widget/common/indicator.dart';

class BusyOverlay extends StatelessWidget {
  const BusyOverlay({this.title = ""});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: Container(
          width: isNullOrEmpty(title) ? 80 : 130,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 80,
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: const Indicator(),
              ),
              if (isNullOrEmpty(title) == false)
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
