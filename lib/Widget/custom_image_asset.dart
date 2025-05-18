import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class CustomImageAsset extends StatelessWidget {
  const CustomImageAsset({
    required this.asset,
    this.height,
    this.width,
    this.fit,
    this.color,
    this.margin,
    this.padding,
    this.decoration,
    super.key,
  });

  final String asset;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: decoration,
      child: Image.asset(
        asset,
        height: height != null ? SizeConfig.horizontal(height!) : null,
        width: width != null ? SizeConfig.horizontal(width!) : null,
        fit: fit ?? BoxFit.cover,
        color: color ?? Colors.white,
      ),
    );
  }
}