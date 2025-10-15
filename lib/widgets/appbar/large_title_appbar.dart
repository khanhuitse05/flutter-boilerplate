import 'package:flutter/material.dart';
import 'package:myapp/src/theme/colors.dart';

class LargeTitleAppBar extends StatelessWidget {
  const LargeTitleAppBar(this.title,
      {super.key, this.hasDivider = false, this.paddingTop = 0});

  final double paddingTop;
  final String title;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            height: 80 + paddingTop,
            padding: EdgeInsets.only(bottom: 20, left: 20, top: paddingTop),
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColors.text,
                fontSize: 30,
              ),
            ),
          ),
          if (hasDivider) const Divider()
        ],
      ),
    );
  }
}
