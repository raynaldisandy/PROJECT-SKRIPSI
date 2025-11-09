import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';
import 'package:skinalertsv2/Widget/user_info.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final FrameController frameController = Get.put(FrameController());
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Center(
        child: Column(
          children: [
            const SpaceSizer(
              vertical: 1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const UserPicture(),
                const SpaceSizer(
                  horizontal: 3,
                ),
                Obx(
                  () => LeaguespartanTextView(
                    value: frameController.userName.value,
                    color: AppColors.textblackcolour,
                    size: SizeConfig.safeBlockHorizontal * 5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SpaceSizer(
              vertical: 1,
            ),
            Container(
              width: SizeConfig.horizontal(90),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(3)),
                border: Border.all(
                  color: AppColors.textblackcolour,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SpaceSizer(
                      vertical: 3,
                    ),
                    LobstertwoTextView(
                      value: "My History",
                      color: AppColors.textbluecolour,
                      size: SizeConfig.safeBlockHorizontal * 7,
                      fontWeight: FontWeight.bold,
                    ),
                    const SpaceSizer(
                      vertical: 5,
                    ),
                    Obx(
                      () => ListView.builder(
                        padding: EdgeInsets.all(SizeConfig.horizontal(1)),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: frameController.historyList.length,
                        itemBuilder: (context, index) => Container(
                          margin:
                              EdgeInsets.only(top: SizeConfig.horizontal(2)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.buttoncolorblue,
                          ),
                          width: SizeConfig.horizontal(80),
                          height: SizeConfig.horizontal(40),
                          child: Row(
                            children: [
                              const SpaceSizer(
                                horizontal: 2,
                              ),
                              SizedBox(
                                width: SizeConfig.horizontal(20),
                                height: SizeConfig.horizontal(20),
                                child: Image.network(frameController
                                    .historyList[index].imageScan),
                              ),
                              const SpaceSizer(
                                horizontal: 3,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LeaguespartanTextView(
                                    value: frameController
                                        .historyList[index].creationTime,
                                    color: AppColors.textblackcolour,
                                    size: SizeConfig.safeBlockHorizontal * 2.5,
                                  ),
                                  const SpaceSizer(
                                    vertical: 1,
                                  ),
                                  LeaguespartanTextView(
                                    value: frameController
                                        .historyList[index].virusDetected,
                                    color: AppColors.textblackcolour,
                                    size: SizeConfig.safeBlockHorizontal * 2.5,
                                  ),
                                  const SpaceSizer(
                                    vertical: 3,
                                  )
                                ],
                              ),
                              const SpaceSizer(
                                horizontal: 3,
                              ),
                              CustomFlatButton(
                                width: SizeConfig.horizontal(5),
                                height: SizeConfig.horizontal(0.8),
                                text: "Details",
                                textSize: 3,
                                onTap: () {},
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SpaceSizer(
                      vertical: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
