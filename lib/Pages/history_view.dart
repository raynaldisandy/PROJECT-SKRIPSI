import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Controlers/history_controller.dart';
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
    final FrameController frameController = Get.put(FrameController());
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Center(
        child: Container(
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
                SpaceSizer(
                  vertical: 3,
                ),
                LobstertwoTextView(
                  value: "My History",
                  color: AppColors.textbluecolour,
                  size: SizeConfig.safeBlockHorizontal * 7,
                  fontWeight: FontWeight.bold,
                ),
                SpaceSizer(
                  vertical: 5,
                ),
                Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.all(SizeConfig.horizontal(1)),
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: frameController.historyList.length,
                    itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(top: SizeConfig.horizontal(2)),
                      child: Row(
                        children: [
                          SpaceSizer(
                            horizontal: 2,
                          ),
                          Container(
                            width: SizeConfig.horizontal(20),
                            height: SizeConfig.horizontal(20),
                            child: Image.network(
                                frameController.historyList[index].imageScan),
                          ),
                          SpaceSizer(
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
                              SpaceSizer(
                                vertical: 1,
                              ),
                              LeaguespartanTextView(
                                value: frameController
                                    .historyList[index].virusDetected,
                                color: AppColors.textblackcolour,
                                size: SizeConfig.safeBlockHorizontal * 2.5,
                              ),
                              SpaceSizer(
                                vertical: 3,
                              )
                            ],
                          ),
                          SpaceSizer(
                            horizontal: 3,
                          ),
                          CustomFlatButton(
                            width: SizeConfig.horizontal(5),
                            height: SizeConfig.horizontal(0.8),
                            text: "Risk",
                            textSize: 3,
                            onTap: () {},
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.buttoncolorblue,
                      ),
                      width: SizeConfig.horizontal(80),
                      height: SizeConfig.horizontal(40),
                    ),
                  ),
                ),
                SpaceSizer(
                  vertical:8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
