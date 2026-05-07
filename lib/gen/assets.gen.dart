// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class Assets {
  const Assets._();

  static const String navigationHome = 'assets/Navigation_home.svg';
  static const String appleIcon = 'assets/apple_icon.svg';
  static const String chatHome = 'assets/chat_home.svg';
  static const String favNav = 'assets/fav_nav.svg';
  static const String favOrange = 'assets/fav_orange.svg';
  static const String favOrange2 = 'assets/fav_orange2.svg';
  static const String favProperty = 'assets/fav_property.svg';
  static const String filterHome = 'assets/filter_home.svg';
  static const String googleIcon = 'assets/google_icon.svg';
  static const String historyNav = 'assets/history_nav.svg';
  static const String homeNav = 'assets/home_nav.svg';
  static const String locationHome = 'assets/location_home.svg';
  static const String mabNav = 'assets/mab_nav.svg';
  static const String notificationHome = 'assets/notification_home.svg';
  static const String obBoardingImg = 'assets/obBoardingImg.svg';
  static const AssetGenImage onBoardingImgg = AssetGenImage(
    'assets/onBoardingImgg.png',
  );
  static const AssetGenImage plashPng = AssetGenImage('assets/plashPng.png');
  static const String reviewIcon = 'assets/review_icon.svg';
  static const String saleProperty = 'assets/sale_property.svg';
  static const String searchHome = 'assets/search_home.svg';
  static const AssetGenImage splashPng1 = AssetGenImage(
    'assets/splashPng1.png',
  );

  /// List of all assets
  static List<dynamic> get values => [
    navigationHome,
    appleIcon,
    chatHome,
    favNav,
    favOrange,
    favOrange2,
    favProperty,
    filterHome,
    googleIcon,
    historyNav,
    homeNav,
    locationHome,
    mabNav,
    notificationHome,
    obBoardingImg,
    onBoardingImgg,
    plashPng,
    reviewIcon,
    saleProperty,
    searchHome,
    splashPng1,
  ];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
