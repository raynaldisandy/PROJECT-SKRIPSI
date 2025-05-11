import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/size_config.dart';

class FrameAppBar extends StatelessWidget implements PreferredSizeWidget {
  // constructor
  const FrameAppBar({
    super.key,
    // status bar
    this.action,
    this.customLeading,
    this.customTitle,
    this.heightBar,
    this.elevation,
    this.isCenter,
    this.isUseLeading,
    this.isImplyLeading,
    this.color,
    this.onBack,
    this.titleScreen,
    this.bottom,
    this.gradient,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.statusBarBrightness,
  });

  /// [Parameter]
  //Widget
  final Widget? action;
  final Widget? customLeading;
  final Widget? customTitle;
  //double
  final double? heightBar;
  final double? elevation;
  //boolean
  final bool? isCenter;
  final bool? isUseLeading;
  final bool? isImplyLeading;
  //Widget Color
  final Color? color;
  //Function
  final Function()? onBack;
  //String
  final String? titleScreen;
  //PrefferedSizeWidget
  final PreferredSizeWidget? bottom;
  final LinearGradient? gradient;

  // status bar
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;
  final Brightness? statusBarBrightness;

  Widget _titleScreen() {
    if (titleScreen == null && isImplyLeading == null) {
      return const SizedBox.shrink();
    } else if (titleScreen == null && isImplyLeading == false) {
      return customTitle ?? const Text('');
    } else {
      return LobstertwoTextView(
        value: titleScreen ?? '',
        fontWeight: FontWeight.bold,
        color: AppColors.textwhitecolour,
        size: SizeConfig.safeBlockHorizontal * 5,
      );
    }
  }

  Widget _leadingWrapper(BuildContext context) {
    if (customLeading == null) {
      return _backButton(context);
    } else {
      return customLeading!;
    }
  }

  Widget _backButton(BuildContext context) {
    return IconButton(
        onPressed: () {
          onBack == null ? Get.back() : onBack!();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColors.textwhitecolour,
        ));
  }

  bool _enableImplyLeading() {
    if (isImplyLeading == null) {
      return true;
    } else if (isImplyLeading == false) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AppBar(
      flexibleSpace: Container(
        color: Colors.transparent,
      ),
      title: _titleScreen(),
      backgroundColor: color ?? Colors.white,
      centerTitle: isCenter ?? false,
      elevation: elevation,
      bottomOpacity: 0.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? AppColors.backgroundcolor,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
        // iOS
        statusBarBrightness: statusBarBrightness ?? Brightness.light,
      ),
      leading: isUseLeading == null || isUseLeading == false
          ? null
          : _leadingWrapper(context),
      actions: <Widget>[action ?? const SizedBox.shrink()],
      automaticallyImplyLeading: _enableImplyLeading(),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(heightBar ?? kToolbarHeight);
}