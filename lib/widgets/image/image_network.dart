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
    return Image.network(
      fullUrl,
      fit: fit,
    );
  }

  Widget _buildPlaceHolder() {
    return Container(
        decoration: BoxDecoration(
      color: Colors.grey[200],
    ));
  }
}
