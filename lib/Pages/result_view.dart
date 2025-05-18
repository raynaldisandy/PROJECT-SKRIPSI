import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/enum.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Center(
        child: Container(
          width: SizeConfig.horizontal(90),
          height: SizeConfig.horizontal(150),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.horizontal(3)),
            border: Border.all(
              color: AppColors.textblackcolour,
              ),
          ),
          child: Column(
            children: [
              SpaceSizer(vertical: 3,),
              LobstertwoTextView(
                value: "Result",
                color: AppColors.textbluecolour,
                size: SizeConfig.safeBlockHorizontal * 7,
                fontWeight: FontWeight.bold,
                ),
                SpaceSizer(vertical: 5,),
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.buttoncolorblue,
                ),
                width: SizeConfig.horizontal(80),
                height: SizeConfig.horizontal(40),
              ),
              SpaceSizer(vertical: 2,),
              Container(
                child: Center(
                  child: LeaguespartanTextView(
                    value: "Low Risk",
                    size: SizeConfig.safeBlockHorizontal * 4,
                    color: AppColors.textwhitecolour,
                    fontWeight: FontWeight.bold,
                    ),
                ),
                width:SizeConfig.horizontal(30),
                height: SizeConfig.horizontal(10),
                decoration: BoxDecoration(
                color: AppColors.buttoncolorgreendark,
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(5)),
                ),
              ),
              SpaceSizer(vertical: 2,),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      SpaceSizer(vertical: 1,),
                      LeaguespartanTextView(
                        value: "Perlu diperhatikan!",
                        size: SizeConfig.safeBlockHorizontal * 4,
                        color: AppColors.textwhitecolour,
                        alignText: AlignTextType.center,
                        fontWeight: FontWeight.bold,
                        ),
                        SpaceSizer(vertical: 2,),
                        LeaguespartanTextView(
                        value: "Hasil ini merupakan estimasi berdasarkan jawaban kuesioner dan bukan merupakan diagnosis medis. Penting untuk selalu berkonsultasi dengan tenaga medis profesional untuk penilaian yang akurat dan langkah penanganan yang tepat.",
                        size: SizeConfig.safeBlockHorizontal * 3,
                        alignText: AlignTextType.center,
                        color: AppColors.textwhitecolour,
                        fontWeight: FontWeight.bold,
                        ),
                    ],
                  ),
                ),
                width:SizeConfig.horizontal(80),
                height: SizeConfig.horizontal(35),
                decoration: BoxDecoration(
                color: AppColors.buttoncolorgreendark,
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(5)),
                ),
              ),
              SpaceSizer(vertical: 4,),
              CustomFlatButton(
                  text: "Back To Home",
                  textSize: SizeConfig.safeBlockHorizontal * 1.2,
                  radius: SizeConfig.horizontal(0.7),
                  width: SizeConfig.horizontal(13),
                  colorIconImage: AppColors.textwhitecolour,
                  onTap: () {},
                ),
            ],
          ),
        ),
      ),
    );
  }
}