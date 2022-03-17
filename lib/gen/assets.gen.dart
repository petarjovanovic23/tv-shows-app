/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Logo_Horizontal_White.svg
  String get logoHorizontalWhite => 'assets/images/Logo_Horizontal_White.svg';

  /// File path: assets/images/Top_left_illustration.svg
  String get topLeftIllustration => 'assets/images/Top_left_illustration.svg';

  /// File path: assets/images/Top_right_illustration.svg
  String get topRightIllustration => 'assets/images/Top_right_illustration.svg';

  /// File path: assets/images/Welcome_icon.svg
  String get welcomeIcon => 'assets/images/Welcome_icon.svg';

  /// File path: assets/images/ic_office.png
  AssetGenImage get icOffice =>
      const AssetGenImage('assets/images/ic_office.png');

  /// File path: assets/images/ic_profile_placeholder.svg
  String get icProfilePlaceholder => 'assets/images/ic_profile_placeholder.svg';

  /// File path: assets/images/ic_shows_empty_state.svg
  String get icShowsEmptyState => 'assets/images/ic_shows_empty_state.svg';

  /// File path: assets/images/ic_stranger_things.png
  AssetGenImage get icStrangerThings =>
      const AssetGenImage('assets/images/ic_stranger_things.png');

  /// File path: assets/images/krv_nije_voda.png
  AssetGenImage get krvNijeVoda =>
      const AssetGenImage('assets/images/krv_nije_voda.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
