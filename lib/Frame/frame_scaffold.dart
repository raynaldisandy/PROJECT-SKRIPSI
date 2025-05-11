import 'package:flutter/material.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';

import 'frame_appbar.dart';

class FrameScaffold extends StatelessWidget {
  // constructor
  const FrameScaffold({
    super.key,
    // parameter for app bar
    // parameter for scaffold
    // system status bar
    this.view,
    this.bottomSheet,
    this.avoidBottomInset,
    this.elevation,
    this.heightBar,
    this.color,
    this.colorScaffold,
    this.isCenter,
    this.isUseLeading,
    this.isImplyLeading,
    this.customLeading,
    this.action,
    this.customTitle,
    this.bottomNavBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.titleScreen,
    this.onBack,
    this.bottom,
    this.gradient,
    this.statusBarColor,
    this.statusBarBrightness,
    this.statusBarIconBrightness,
  });

  // parameter for scaffold
  final Widget? view;
  final Widget? bottomSheet;
  final bool? avoidBottomInset;

  //Appbar parameter double
  final double? elevation;
  final double? heightBar;
  //Appbar parameter Color
  final Color? color;
  final Color? colorScaffold;
  //Appbar parameter bool
  final bool? isCenter;
  final bool? isUseLeading;
  final bool? isImplyLeading;
  //Appbar constructor Widget
  final Widget? customLeading;
  final Widget? action;
  final Widget? customTitle;
  final Widget? bottomNavBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  //Appbar constructor
  final String? titleScreen;
  final dynamic Function()? onBack;
  final PreferredSizeWidget? bottom;
  final LinearGradient? gradient;
  // system status bar
  final Color? statusBarColor;
  // system status bar Brightness
  final Brightness? statusBarBrightness;
  final Brightness? statusBarIconBrightness;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      
      backgroundColor: colorScaffold ?? AppColors.backgroundcolor,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      appBar: FrameAppBar(
        titleScreen: titleScreen,
        heightBar: heightBar,
        color: color,
        isCenter: isCenter,
        elevation: elevation,
        gradient: gradient,
        isUseLeading: isUseLeading,
        onBack: onBack,
        customLeading: customLeading,
        action: action,
        isImplyLeading: isImplyLeading,
        customTitle: customTitle,
        statusBarColor: statusBarColor,
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarBrightness: statusBarBrightness,
        bottom: bottom,
      ),
      bottomSheet: bottomSheet,
      body: view,
      bottomNavigationBar: bottomNavBar,
    );
  }
}