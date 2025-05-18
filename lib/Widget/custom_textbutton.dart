import 'package:flutter/material.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';

class CustomTextbutton extends StatelessWidget {
  const CustomTextbutton(
      {super.key, required this.onPressed, required this.text});

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        child: LeaguespartanTextView(
          value: text,
          color: AppColors.textblackcolour,
          fontWeight: FontWeight.bold,
        ),
        onPressed: () => onPressed,
      ),
    );
  }
}
