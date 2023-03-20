import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

String _domainApi = '';

class XImageNetwork extends StatelessWidget {
  const XImageNetwork(
    this.url, {
    this.fit,
  });

  final String? url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (url?.isNotEmpty != true) {
      return _buildPlaceHolder();
    }

    final String fullUrl =
        ((url != null && url!.contains('http')) ? url : ('$_domainApi$url'))!;
    return CachedNetworkImage(
      imageUrl: fullUrl,
      fit: fit,
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
      child: Icon(Icons.error),
    );
  }
}
