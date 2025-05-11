import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skinalertsv2/Frame/frame_scaffold.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/skinalert_logo.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          systemNavigationBarColor: AppColors.textwhitecolour,
          systemNavigationBarIconBrightness: Brightness.dark), 
      child: FrameScaffold(
        heightBar: 0,
        elevation: 0,
        color: AppColors.backgroundcolor,
        statusBarColor: AppColors.backgroundcolor,
        colorScaffold: AppColors.backgroundcolor,
        statusBarBrightness: Brightness.light,
        view:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SkinalertLogo(
              ),
              Row(
                children: [
                   SpaceSizer(horizontal: 20,),
                  LobstertwoTextView(value: "Skin",size: SizeConfig.blockSizeHorizontal * 25,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textbluecolour,
                  ),
                  SpaceSizer(horizontal: 2,)
                ],
              ),
              Row(
                children: [
                  SpaceSizer(horizontal: 32,),
                  LobstertwoTextView(value: "Alert",size: SizeConfig.blockSizeHorizontal * 25,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textbluecolour,),
                ],
              )
            ],
          ),
        )
      )
      );
  }
}