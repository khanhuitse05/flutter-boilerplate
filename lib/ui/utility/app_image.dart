import 'package:my_app/core/constans.dart';
import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  AppImage(this.url, {this.fit = BoxFit.cover, this.heightPlaceHolder, this.widthPlaceHolder});

  final String url;
  final BoxFit fit;

  final double heightPlaceHolder;
  final double widthPlaceHolder;

  @override
  Widget build(BuildContext context) {
    return _buildCachedImage();
  }

  _buildCachedImage() {
    var fullUrl =
        url.contains('http') ? url : (kDomainApi + url);
    return Image.network(fullUrl, fit: fit);
  }

  // todo: update later
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
