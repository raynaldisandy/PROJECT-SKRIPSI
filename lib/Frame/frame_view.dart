import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Frame/frame_bottom_nav_bar.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';

import '../../utils/size_config.dart';

class FrameView extends StatefulWidget {
  const FrameView({super.key});

  @override
  State<FrameView> createState() => _FrameViewState();
}

class _FrameViewState extends State<FrameView> {
  final FrameController _controller = Get.put(
    FrameController(),
  );

  @override
  
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.textblackcolour,
          systemNavigationBarIconBrightness: Brightness.dark),
      child: Obx(() => FrameBottomNav(
          onBack: () => _controller.onTapNav(0),
          isUseLeading: _useBackButton(),
          isImplyLeading: false,
          elevation: 0,
          heightBar: _whenUseHeightBar(),
          isCenter: _isCenterTitle(),
          statusBarColor: _colorStatusBar(),
          titleScreen: '',
          statusBarBrightness: Brightness.light)),
    );
  }

  //need maintenance
  Color _colorStatusBar() {
    if (_controller.defaultIndex.value == 1 ||
        _controller.defaultIndex.value == 2) {
      return Colors.black;
    } else {
      return Colors.black;
    }
  }

  bool _isCenterTitle() {
    if (_controller.defaultIndex.value == 2 ||
        _controller.defaultIndex.value == 3 ||
        _controller.defaultIndex.value == 4) {
      return true;
    } else {
      return false;
    }
  }

  double _whenUseHeightBar() {
    if (_controller.defaultIndex.value == 5 ) {
      return SizeConfig.horizontal(12);
    } else {
      return 0;
    }
  }


  bool _useBackButton() {
    if (_controller.defaultIndex.value == 1) {
      return true;
    } else {
      return false;
    }
  }
}