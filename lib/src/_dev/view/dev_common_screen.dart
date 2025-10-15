import 'package:flutter/material.dart';
import 'package:myapp/generated/assets/assets.gen.dart';
import 'package:myapp/src/_dev/widget/dev_button_title.dart';
import 'package:myapp/src/_dev/widget/dev_navigation_title.dart';
import 'package:myapp/src/_dev/widget/dev_screen_layout.dart';
import 'package:myapp/src/dialogs/toast_wrapper.dart';
import 'package:myapp/src/features/common/view/not_found_view.dart';
import 'package:myapp/src/features/common/view/webview/web_view.dart';
import 'package:myapp/src/localization/localization_utils.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:myapp/widgets/state/state_empty_widget.dart';
import 'package:myapp/widgets/state/state_error_widget.dart';
import 'package:myapp/widgets/state/state_loading_widget.dart';

class DevCommonScreen extends StatelessWidget {
  const DevCommonScreen({super.key});

  Widget viewOf(Widget child) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Card',
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        DevNavigationTitle(
          'Error',
          (_) => viewOf(XStateErrorWidget(
            onTap: () => XToast.show(S.of(context).common_tap_to_refresh),
          )),
        ),
        DevNavigationTitle(
          'Loading',
          (_) => viewOf(const XStateLoadingWidget()),
        ),
        DevNavigationTitle(
          'Empty List',
          (_) => viewOf(
            const XStateEmptyWidget(
              body: "Keep browsing for more products",
            ),
          ),
        ),
        DevNavigationTitle(
          'Empty Notification',
          (_) => viewOf(
            XStateEmptyWidget(
              iconSvg: Assets.svgs.stateEmptyNotification.path,
              title: 'No notifications yet',
              body:
                  "You're all caught up!\n Check back later for new notifications",
              bottom: Center(
                child: XButton(
                  title: 'Back to home',
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        DevButtonTitle(
          'Webview',
          onTap: () {
            WebviewPage.show(context, 'https://github.com');
          },
        ),
        DevNavigationTitle('NotFound', (_) => const NotFoundView()),
      ],
    );
  }
}
