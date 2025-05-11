import 'package:flutter/material.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import '../../../utils/size_config.dart';

class SkinalertLogo extends StatelessWidget {
  const SkinalertLogo({
    super.key,
    this.height,
    this.width,
    this.color,
  });

  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SizedBox(
        height: SizeConfig.horizontal(height ?? 50),
        width: SizeConfig.horizontal(width ?? 48),
        child: Image.asset(
          AssetList.skinalertLogo,
          color: color,
        ));
  }
}