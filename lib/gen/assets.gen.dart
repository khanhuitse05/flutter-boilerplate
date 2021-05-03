/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesLocaleGen get locale => const $AssetsImagesLocaleGen();
  $AssetsImagesUiGen get ui => const $AssetsImagesUiGen();
}

class $AssetsLocaleGen {
  const $AssetsLocaleGen();

  $AssetsLocaleEnGen get en => const $AssetsLocaleEnGen();
  $AssetsLocaleViGen get vi => const $AssetsLocaleViGen();
}

class $AssetsImagesLocaleGen {
  const $AssetsImagesLocaleGen();

  AssetGenImage get en => const AssetGenImage('assets/images/locale/en.png');
  AssetGenImage get vi => const AssetGenImage('assets/images/locale/vi.png');
}

class $AssetsImagesUiGen {
  const $AssetsImagesUiGen();

  AssetGenImage get hpPhotos =>
      const AssetGenImage('assets/images/ui/hp_photos.png');
}

class $AssetsLocaleEnGen {
  const $AssetsLocaleEnGen();

  String get common => 'assets/locale/en/common.json';
  String get main => 'assets/locale/en/main.json';
}

class $AssetsLocaleViGen {
  const $AssetsLocaleViGen();

  String get common => 'assets/locale/vi/common.json';
  String get main => 'assets/locale/vi/main.json';
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocaleGen locale = $AssetsLocaleGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}
