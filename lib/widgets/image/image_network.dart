import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class XImageNetwork extends StatelessWidget {
  const XImageNetwork(
    this.url, {
    super.key,
    this.fit,
    this.width,
    this.height,
  });

  final String? url;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (url?.isNotEmpty != true) {
      return _buildPlaceHolder();
    }

    return CachedNetworkImage(
      imageUrl: url ?? '',
      fit: fit,
      width: width,
      height: height,
      placeholder: (context, url) => _buildPlaceHolder(),
      errorWidget: (context, url, error) => _buildError(),
    );
  }

  Widget _buildPlaceHolder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
    );
  }

  Widget _buildError() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: const Icon(Icons.error),
    );
  }
}
