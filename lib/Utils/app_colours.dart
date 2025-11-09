import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color hex({required String colorCode}) {
    final String containHex = colorCode.toUpperCase().replaceAll('#', '');
    String result = '';
    if (colorCode.length == 7) {
      result = 'FF$containHex';
    }

    return Color(int.parse(result, radix: 16));
  }

  // color list
  // main theme color
  static Color backgroundcolor = AppColors.hex(colorCode: '#EFE9D5');
  static Color buttoncolorgreendark = AppColors.hex(colorCode: '#497D74');
  static Color buttoncolorblue = AppColors.hex(colorCode: '#71BBB2');
  static Color textblackcolour = AppColors.hex(colorCode: '#000000');
  static Color textwhitecolour = AppColors.hex(colorCode: '#FFFFFF');
  static Color textbluecolour = AppColors.hex(colorCode: '#27445D');
  static Color greencard = AppColors.hex(colorCode: '#5C715E');
  static Color whitecard = AppColors.hex(colorCode: '#F1F8E8');
  static Color creamcard = AppColors.hex(colorCode: '#F2F9F1');
  static Color greyDisabled = AppColors.hex(colorCode: '#B2C6D5');
  static Color rippleColor =
      // ignore: deprecated_member_use
      AppColors.hex(colorCode: '#EFEFEF').withOpacity(0.20);
 
}