import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myapp/generated/assets/assets.gen.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/src/theme/styles.dart';

class XStateEmptyWidget extends StatelessWidget {
  const XStateEmptyWidget({
    super.key,
    this.title,
    this.body,
    this.iconSvg,
    this.bottom,
  });
  final String? title;
  final String? body;
  final String? iconSvg;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(iconSvg ?? Assets.svgs.stateEmpty.path),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            title ?? S.of(context).common_list_empty_title,
            textAlign: TextAlign.center,
            style: AppStyles.title,
          ),
        ),
        if (body?.isNotEmpty == true) ...[
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              body!,
              textAlign: TextAlign.center,
              style: AppStyles.body,
            ),
          ),
        ],
        if (bottom != null) ...[
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: bottom!,
          ),
        ],
      ],
    );
  }
}
