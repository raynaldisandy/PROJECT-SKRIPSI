import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';

class SpaceSizer extends StatelessWidget {
  const SpaceSizer({
    super.key,
    this.vertical,
    this.horizontal,
  });

  //parameter sizer double
  final double? vertical;
  final double? horizontal;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: vertical != null ? SizeConfig.vertical(vertical!) : null,
      width: horizontal != null ? SizeConfig.horizontal(horizontal!) : null,
    );
  }
}