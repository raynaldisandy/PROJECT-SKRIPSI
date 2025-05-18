import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

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
                value: "My History",
                color: AppColors.textbluecolour,
                size: SizeConfig.safeBlockHorizontal * 7,
                fontWeight: FontWeight.bold,
                ),
                SpaceSizer(vertical: 5,),
              Container(
                child: Row(
                  children: [
                    SpaceSizer(horizontal: 2,),
                    Container(
                      width: SizeConfig.horizontal(20),
                      height: SizeConfig.horizontal(20),
                      color: Colors.blue,
                    ),
                      SpaceSizer(horizontal: 3,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LeaguespartanTextView(
                          value: "01 April 2025 | 12.00 WIB",
                          color: AppColors.textblackcolour,
                          size: SizeConfig.safeBlockHorizontal * 2.5,
                          ),
                        SpaceSizer(vertical: 1,),
                        LeaguespartanTextView(
                          value: "No Cancer Found",
                          color: AppColors.textblackcolour,
                          size: SizeConfig.safeBlockHorizontal * 2.5,
                          ),
                          SpaceSizer(vertical: 3,)
                      ],
                    ),
                    SpaceSizer(horizontal: 3,),
                    CustomFlatButton(
                    width: SizeConfig.horizontal(5),
                    height: SizeConfig.horizontal(0.8),
                    text: "Low Risk",
                    textSize: 3, 
                    onTap: () {
                      
                    },)
                  ],
                ),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.buttoncolorblue,
                ),
                width: SizeConfig.horizontal(80),
                height: SizeConfig.horizontal(40),
              ),
              SpaceSizer(vertical: 2,),
            ],
          ),
        ),
      ),
    );
  }
}