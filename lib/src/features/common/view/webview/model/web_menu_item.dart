import 'package:flutter/material.dart';

enum WebMenuItem {
  goBack,
  goForward,
  reload,
  openBrowser,
  copyLink,
  shareLink,
}

extension WebMenuItemExtension on WebMenuItem {
  String nameOf() {
    switch (this) {
      case WebMenuItem.openBrowser:
        return 'Open in Browser';
      case WebMenuItem.copyLink:
        return 'Copy Page URL';
      case WebMenuItem.shareLink:
        return 'Share Link to...';
      default:
        return '';
    }
  }

  Widget iconOf() {
    switch (this) {
      case WebMenuItem.goBack:
        return const Icon(Icons.arrow_back, size: 24);
      case WebMenuItem.goForward:
        return const Icon(Icons.arrow_forward, size: 24);
      case WebMenuItem.reload:
        return const Icon(Icons.replay_outlined, size: 24);
      default:
        return const Icon(Icons.more_vert, size: 24);
    }
  }
}
