import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Controlers/scan_controller.dart';
import 'package:skinalertsv2/Frame/frame_view.dart';
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
    final ScanController scanController = Get.put(ScanController());
    final FrameController frameController = Get.put(FrameController());
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Center(
        child: Container(
          width: SizeConfig.horizontal(90),
          height: SizeConfig.horizontal(170),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.horizontal(3)),
            border: Border.all(
              color: AppColors.textblackcolour,
            ),
          ),
          child: Column(
            children: [
              const SpaceSizer(
                vertical: 3,
              ),
              LobstertwoTextView(
                value: "Result",
                color: AppColors.textbluecolour,
                size: SizeConfig.safeBlockHorizontal * 7,
                fontWeight: FontWeight.bold,
              ),
              const SpaceSizer(
                vertical: 5,
              ),
              SizedBox(
                width: SizeConfig.horizontal(80),
                height: SizeConfig.horizontal(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.horizontal(2))),
                  child: Image.file(scanController.imageSkin!,fit: BoxFit.fill,)),
              ),
              const SpaceSizer(
                vertical: 2,
              ),
              Container(
                width: SizeConfig.horizontal(40),
                padding: EdgeInsets.all(SizeConfig.horizontal(2)),
                decoration: BoxDecoration(
                  color: AppColors.buttoncolorgreendark,
                  borderRadius: BorderRadius.circular(SizeConfig.horizontal(2)),
                ),
                child: Center(
                  child: Obx(
                    () => LeaguespartanTextView(
                      value: scanController.sicknessResult.value,
                      size: SizeConfig.safeBlockHorizontal * 4,
                      color: AppColors.textwhitecolour,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SpaceSizer(
                vertical: 2,
              ),
               Obx(()=> 
                  LeaguespartanTextView(
                          value: '${scanController.scanAccuracy.value}%',
                          size: SizeConfig.safeBlockHorizontal * 8,
                          color: Colors.green,
                          alignText: AlignTextType.center,
                          fontWeight: FontWeight.bold,
                        ),
               ),
                const SpaceSizer(
                vertical: 2,
              ),
              Container(
                child: Center(
                  child: Column(
                    children: [
                      const SpaceSizer(
                        vertical: 1,
                      ),
                      LeaguespartanTextView(
                        value: "Perlu diperhatikan!",
                        size: SizeConfig.safeBlockHorizontal * 4,
                        color: AppColors.textwhitecolour,
                        alignText: AlignTextType.center,
                        fontWeight: FontWeight.bold,
                      ),
                      const SpaceSizer(
                        vertical: 2,
                      ),
                      LeaguespartanTextView(
                        value:
                            "Hasil ini merupakan estimasi berdasarkan jawaban kuesioner dan bukan merupakan diagnosis medis. Penting untuk selalu berkonsultasi dengan tenaga medis profesional untuk penilaian yang akurat dan langkah penanganan yang tepat.",
                        size: SizeConfig.safeBlockHorizontal * 3,
                        alignText: AlignTextType.center,
                        color: AppColors.textwhitecolour,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                width: SizeConfig.horizontal(80),
                height: SizeConfig.horizontal(35),
                decoration: BoxDecoration(
                  color: AppColors.buttoncolorgreendark,
                  borderRadius: BorderRadius.circular(SizeConfig.horizontal(5)),
                ),
              ),
              const SpaceSizer(
                vertical: 4,
              ),
              CustomFlatButton(
                text: "Back To Home",
                textSize: SizeConfig.safeBlockHorizontal * 1.2,
                radius: SizeConfig.horizontal(0.7),
                width: SizeConfig.horizontal(13),
                colorIconImage: AppColors.textwhitecolour,
                onTap: () async {
                  await frameController.getHistory(frameController.userName.value);
Get.off(FrameView());
                } 
              ),
               const SpaceSizer(
                vertical: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
