import 'package:flutter/material.dart';
import 'package:real_estate3_a/core/constants/app_assets.dart';
// import 'package:flutter_svg/svg.dart' as Assets;

import 'custom_png_image.dart';

class CustomPlaceholderImage extends StatelessWidget {
  const CustomPlaceholderImage({
    super.key,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });

  final double? height;
  final double? width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CustomPngImage(
      path: Assets.assetsPlaceholder, //Assets.svg.logo
      height: height,
      width: width,
      fit: fit,
    );
  }
}
