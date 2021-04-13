import 'package:flutter/material.dart';
import 'package:my_app/src/utils/index.dart';

import 'package:transparent_image/transparent_image.dart';

String _domainApi = '';

class AppImage extends StatelessWidget {
  const AppImage(this.url,
      {this.fit = BoxFit.cover, this.heightPlaceHolder, this.widthPlaceHolder});

  final String? url;
  final BoxFit fit;

  final double? heightPlaceHolder;
  final double? widthPlaceHolder;

  @override
  Widget build(BuildContext context) {
    if (isNullOrEmpty(url)) {
      return _buildPlaceHolder();
    }

    final String fullUrl =
        ((url != null && url!.contains('http')) ? url : ('$_domainApi$url'))!;
    return FadeInImage.memoryNetwork(
      image: fullUrl,
      fit: fit,
      placeholder: kTransparentImage,
      imageErrorBuilder: (context, error, stackTrace) => _buildPlaceHolder(),
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
  const AppIcon(this.url,
      {this.fit = BoxFit.cover, this.colorError = Colors.white});

  final String? url;
  final BoxFit fit;
  final Color colorError;

  @override
  Widget build(BuildContext context) {
    if (isNullOrEmpty(url)) {
      return _buildPlaceHolder();
    }
    final String fullUrl =
        ((url != null && url!.contains('http')) ? url : ('$_domainApi$url'))!;
    return FadeInImage.memoryNetwork(
      image: fullUrl,
      placeholder: kTransparentImage,
      imageErrorBuilder: (context, error, stackTrace) => _buildPlaceHolder(),
      fit: fit,
    );
  }

  Widget _buildPlaceHolder() {
    return Center(
      child: Icon(
        Icons.error,
        color: colorError,
      ),
    );
  }
}
