import 'package:flutter/material.dart';
import 'package:myapp/generated/assets/assets.gen.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/src/theme/styles.dart';
import 'package:myapp/widgets/button/outlined_button.dart';

class XStateErrorWidget extends StatelessWidget {
  const XStateErrorWidget({
    super.key,
    this.onTap,
  });
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Assets.svgs.stateError.svg(),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            S.of(context).error_somethingWrongTryAgain,
            textAlign: TextAlign.center,
            style: AppStyles.title,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: XOutlinedButton(
            title: S.of(context).common_tap_to_refresh,
            onPressed: onTap,
          ),
        ),
      ],
    );
  }
}
