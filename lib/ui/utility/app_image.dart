import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/constans.dart';
import 'package:transparent_image/transparent_image.dart';

class AppImage extends StatelessWidget {
  const AppImage(this.url,
      {this.fit = BoxFit.cover, this.heightPlaceHolder, this.widthPlaceHolder});

  final String url;
  final BoxFit fit;
  final double heightPlaceHolder;
  final double widthPlaceHolder;

  @override
  Widget build(BuildContext context) {
    final String fullUrl =
    (url != null && url.contains('http')) ? url : ('$kDomainApi$url');
    return CachedNetworkImage(
      imageUrl: fullUrl,
      fit: fit,
      placeholder: (context, url) => _buildPlaceHolder(),
      errorWidget: (context, url, error) => _buildPlaceHolder(),
    );
  }

  Widget _buildPlaceHolder() {
    return Container(
      height: heightPlaceHolder,
      width: widthPlaceHolder,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[200],
      ),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        child: Image.asset('assets/images/ui/hp_photos.png'),
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  const AppIcon(this.url, {this.fit = BoxFit.cover});

  final String url;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final String fullUrl =
    (url != null && url.contains('http')) ? url : ('$kDomainApi$url');
    return FadeInImage.memoryNetwork(
        image: fullUrl, placeholder: kTransparentImage, fit: fit);
  }
}
