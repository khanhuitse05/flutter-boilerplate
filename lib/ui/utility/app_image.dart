import 'package:chat_app/core/core.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  AppImage(this.url, {this.fit = BoxFit.cover, this.showLoading = true});

  final String url;
  final BoxFit fit;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return _buildCachedImage();
  }

  _buildCachedImage() {
    var fullUrl =
        url.contains('http') ? url : (GlobalConfig.instance.domain + url);
    return Image.network(fullUrl, fit: fit);
  }
}
