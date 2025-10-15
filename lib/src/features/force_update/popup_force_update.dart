import 'package:flutter/material.dart';
import 'package:myapp/generated/assets/assets.gen.dart';
import 'package:myapp/src/config/constants/links.dart';
import 'package:myapp/widgets/button/button.dart';
import 'package:url_launcher/url_launcher.dart';

class PopupForceUpdateApp extends StatelessWidget {
  const PopupForceUpdateApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            child: Assets.lotties.rocket.lottie(),
          ),
          Text(
            "Your application update is available",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: XButton(
                  title: "Update",
                  onPressed: () {
                    launchUrl(
                      Uri.parse(XLink.storeOf),
                      mode: LaunchMode.externalApplication,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
