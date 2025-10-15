import 'package:flutter/material.dart';
import 'package:myapp/widgets/card/card.dart';
import 'package:myapp/widgets/common/nav_icon.dart';

class XCardSection extends StatelessWidget {
  const XCardSection({super.key, required this.children, this.borderColor});
  final List<Widget> children;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return XCard(
      borderColor: borderColor,
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i < (children.length - 1))
              const Divider(
                height: 0.5,
                endIndent: 16,
                indent: 16,
              )
          ]
        ],
      ),
    );
  }
}

class XCardSectionButton extends StatelessWidget {
  const XCardSectionButton({
    required this.title,
    super.key,
    this.onTap,
    this.trailing,
  });

  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(child: Text(title)),
            if (trailing != null) trailing!,
            const XNavIcon(),
          ],
        ),
      ),
    );
  }
}
