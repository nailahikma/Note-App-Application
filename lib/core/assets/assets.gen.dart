/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Step 1.png
  AssetGenImage get step1 => const AssetGenImage('assets/images/Step 1.png');

  /// File path: assets/images/Step 2.png
  AssetGenImage get step2 => const AssetGenImage('assets/images/Step 2.png');

  /// File path: assets/images/Step 3.png
  AssetGenImage get step3 => const AssetGenImage('assets/images/Step 3.png');

  /// File path: assets/images/Step 4.png
  AssetGenImage get step4 => const AssetGenImage('assets/images/Step 4.png');

  /// File path: assets/images/Step 5.png
  AssetGenImage get step5 => const AssetGenImage('assets/images/Step 5.png');

  /// File path: assets/images/Step 6.png
  AssetGenImage get step6 => const AssetGenImage('assets/images/Step 6.png');

  /// File path: assets/images/bg_detail.jpeg
  AssetGenImage get bgDetail =>
      const AssetGenImage('assets/images/bg_detail.jpeg');

  /// File path: assets/images/human-1.png
  AssetGenImage get human1Png =>
      const AssetGenImage('assets/images/human-1.png');

  /// File path: assets/images/human-1.svg
  SvgGenImage get human1Svg => const SvgGenImage('assets/images/human-1.svg');

  /// File path: assets/images/human-2.png
  AssetGenImage get human2Png =>
      const AssetGenImage('assets/images/human-2.png');

  /// File path: assets/images/human-2.svg
  SvgGenImage get human2Svg => const SvgGenImage('assets/images/human-2.svg');

  /// File path: assets/images/human-3.png
  AssetGenImage get human3Png =>
      const AssetGenImage('assets/images/human-3.png');

  /// File path: assets/images/human-3.svg
  SvgGenImage get human3Svg => const SvgGenImage('assets/images/human-3.svg');

  /// File path: assets/images/stars.png
  AssetGenImage get stars => const AssetGenImage('assets/images/stars.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// List of all assets
  List<dynamic> get values => [
        step1,
        step2,
        step3,
        step4,
        step5,
        step6,
        bgDetail,
        human1Png,
        human1Svg,
        human2Png,
        human2Svg,
        human3Png,
        human3Svg,
        stars,
        user
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size = null,
  }) : _isVecFormat = true;

  final String _assetName;

  final Size? size;
  final bool _isVecFormat;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture(
      _isVecFormat
          ? AssetBytesLoader(_assetName,
              assetBundle: bundle, packageName: package)
          : SvgAssetLoader(_assetName,
              assetBundle: bundle, packageName: package),
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
