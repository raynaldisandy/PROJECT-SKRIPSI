import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Controlers/scan_controller.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';
import 'package:skinalertsv2/Widget/skinalert_logo.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanController scanController = Get.put(ScanController());
    final FrameController frameController = Get.put(FrameController());
    SizeConfig().init(context);
    return Column(
      children: [
        const SpaceSizer(
          vertical: 5,
        ),
        const SkinalertLogo(),
        Row(
          children: [
            const SpaceSizer(
              horizontal: 20,
            ),
            LobstertwoTextView(
              value: "Skin",
              size: SizeConfig.blockSizeHorizontal * 25,
              fontStyle: FontStyle.italic,
              color: AppColors.textbluecolour,
            ),
            const SpaceSizer(
              horizontal: 2,
            )
          ],
        ),
        Row(
          children: [
            const SpaceSizer(
              horizontal: 32,
            ),
            LobstertwoTextView(
              value: "Alert",
              size: SizeConfig.blockSizeHorizontal * 25,
              fontStyle: FontStyle.italic,
              color: AppColors.textbluecolour,
            ),
          ],
        ),
        const SpaceSizer(
          vertical: 5,
        ),
        Center(
          child: CustomFlatButton(
            text: 'MULAI SCAN KULITMU DISINI',
            // onTap: () => scanController.pickImage(ImageSource.gallery),
            onTap: () => showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const LeaguespartanTextView(
                  value: "Pilih Directory",
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFlatButton(
                      text: '',
                      width: SizeConfig.horizontal(5),
                      height: SizeConfig.horizontal(2.5),
                      onTap: () => scanController.pickImage(
                        ImageSource.gallery,
                        frameController.userName.value,
                      ),
                      icon: Icons.photo,
                      iconSize: SizeConfig.safeBlockHorizontal * 12,
                      colorIconImage: AppColors.whitecard,
                    ),
                    const SpaceSizer(
                      horizontal: 7,
                    ),

                    CustomFlatButton(
                      text: '',
                      width: SizeConfig.horizontal(5),
                      height: SizeConfig.horizontal(2.5),
                      onTap: () => scanController.pickImage(
                        ImageSource.camera,
                        frameController.userName.value,
                      ),
                      icon: Icons.camera_alt_rounded,
                      iconSize: SizeConfig.safeBlockHorizontal * 12,
                      colorIconImage: AppColors.whitecard,
                    ), 
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const LeaguespartanTextView(
                      value: "Cancel",
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
