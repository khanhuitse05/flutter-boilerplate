import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:myapp/src/features/common/view/webview/model/web_menu_item.dart';
import 'package:myapp/src/theme/colors.dart';
import 'package:myapp/src/utils/extension.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:validators/validators.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage(
      {required this.title,
      required this.url,
      this.onSubmitted,
      super.key,
      this.disableRedirect = false});

  final String? title;
  final String url;
  final Function(String)? onSubmitted;
  final bool disableRedirect;

  @override
  State<WebviewPage> createState() => _WebviewPageState();

  static Future show(
    BuildContext context,
    String url, {
    String? title,
    Function(String)? onSubmitted,
    bool disableRedirect = false,
  }) async {
    return showBarModalBottomSheet<bool>(
      expand: true,
      context: context,
      builder: (context) => WebviewPage(
        title: title ?? url,
        url: url,
        onSubmitted: onSubmitted,
        disableRedirect: disableRedirect,
      ),
      isDismissible: false,
      enableDrag: false,
    );
  }
}

class _WebviewPageState extends State<WebviewPage> {
  int _progress = 0;
  Logger log =
      Logger(printer: PrefixPrinter(SimplePrinter(), info: 'INFO webview: '));
  late WebViewController controller;

  void onSelected(WebMenuItem item) async {
    switch (item) {
      case WebMenuItem.goBack:
        final canGoBack = await controller.canGoBack();
        if (canGoBack) {
          controller.goBack();
        }
        break;
      case WebMenuItem.goForward:
        final canGoForward = await controller.canGoForward();
        if (canGoForward) {
          controller.goForward();
        }
        break;
      case WebMenuItem.reload:
        controller.reload();
        break;
      case WebMenuItem.openBrowser:
        final currentUrl = await controller.currentUrl();
        if (currentUrl != null) {
          launchUrlString(currentUrl);
        }
        break;
      case WebMenuItem.copyLink:
        final currentUrl = await controller.currentUrl();
        if (currentUrl != null) {
          Clipboard.setData(ClipboardData(text: currentUrl));
        }
        break;
      case WebMenuItem.shareLink:
        final currentUrl = await controller.currentUrl();
        if (currentUrl != null) {
          SharePlus.instance.share(ShareParams(
            uri: Uri.parse(currentUrl),
            downloadFallbackEnabled: false,
          ));
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    final fixUrl = fixUrlFromText(widget.url);
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            log.i(progress);
            setState(() {
              _progress = progress;
            });
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.urlTrim() != widget.url.urlTrim() &&
                widget.disableRedirect) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(fixUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ?? widget.url,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        leading: const CloseButton(),
      ),
      bottomNavigationBar:
          widget.disableRedirect ? null : _buildBottomNavigationBar(context),
      body: Column(
        children: [
          if (_progress != 100)
            LinearProgressIndicator(
              minHeight: 3,
              value: _progress / 100,
              color: Theme.of(context).primaryColor,
              backgroundColor: const Color(0xFF707070),
            ),
          Expanded(
            child: WebViewWidget(controller: controller),
          ),
        ],
      ),
    );
  }

  Container _buildBottomNavigationBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: AppColors.grey4,
        border: Border.all(width: 1.0, color: Colors.white),
        boxShadow: const [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...[WebMenuItem.goBack, WebMenuItem.goForward, WebMenuItem.reload]
                .map(_buildIconButton),
            PopupMenuButton<WebMenuItem>(
              icon: const Icon(Icons.more_vert, color: AppColors.textSecondary),
              enableFeedback: true,
              onSelected: (item) {
                onSelected.call(item);
              },
              onCanceled: () {},
              offset: const Offset(0, -156),
              color: const Color(0xFFEEEEEE),
              // padding: EdgeInsets.zero,
              itemBuilder: (context) => [
                _buildPopupMenuItem(WebMenuItem.openBrowser),
                const PopupMenuDivider(),
                _buildPopupMenuItem(WebMenuItem.copyLink),
                const PopupMenuDivider(),
                _buildPopupMenuItem(WebMenuItem.shareLink),
              ],
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuItem<WebMenuItem> _buildPopupMenuItem(WebMenuItem item) {
    return PopupMenuItem<WebMenuItem>(
      value: item,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 32,
      child: Center(
        child: Text(
          item.nameOf(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildIconButton(WebMenuItem item) {
    return IconButton(
      onPressed: () => onSelected(item),
      icon: item.iconOf(),
    );
  }

  String fixUrlFromText(String value) {
    if (isURL(value)) {
      if (value.startsWith('https://') || value.startsWith('http://')) {
        return value;
      } else {
        return 'https://$value';
      }
    } else {
      return 'https://www.google.com/search?q=$value';
    }
  }
}
