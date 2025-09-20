import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';
import 'package:skinalertsv2/Widget/custom_textfield.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final FrameController frameController = Get.put(FrameController());
    return Obx(
      () =>  Container(
        color: AppColors.backgroundcolor,
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              LobstertwoTextView(
                value: "Profile",
                size: SizeConfig.blockSizeHorizontal * 10,
                color: AppColors.textbluecolour,
                fontWeight: FontWeight.bold,
              ),
              SpaceSizer(
                vertical: 2,
              ),
              CircleAvatar(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    child: Icon(Icons.mode_edit_outline_outlined),
                    width: SizeConfig.horizontal(15),
                    height: SizeConfig.horizontal(15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.buttoncolorblue),
                  ),
                ),
                backgroundColor: Colors.black,
                radius: SizeConfig.horizontal(20),
              ),
              SpaceSizer(
                vertical: 2,
              ),
              frameController.isEdit.isTrue?
              CustomTextField(
                title: "Full Name"):
              TextBox(value: frameController.username.value,),
              
              SpaceSizer(
                vertical: 2,
              ),
              frameController.isEdit.isTrue?
              CustomTextField(title: "Phone Number"):
              TextBox(value: frameController.phoneNumber.value,),
              SpaceSizer(
                vertical: 2,
              ),
              frameController.isEdit.isTrue?
              CustomTextField(title: "Email"):
              TextBox(value: frameController.userEmail.value,),
              SpaceSizer(
                vertical: 2,
              ),
              SpaceSizer(
                vertical: 2,
              ),
              // CustomFlatButton(
              //   text: "Update",
              //   onTap: () => frameController.isEdit.value = !frameController.isEdit.value,
              // ),
              SpaceSizer(
                vertical: 12,
              ),
              CustomFlatButton(
                backgroundColor: Colors.red,
                text: "Logout",
                onTap: () => frameController.signOut(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.value
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.horizontal(80),
      height: SizeConfig.horizontal(13),
      decoration: BoxDecoration(
      color: AppColors.buttoncolorblue,
        borderRadius: BorderRadius.all(
          Radius.circular(
            SizeConfig.horizontal(2),
          ),
        ),
      ),
      child: Center(child: LeaguespartanTextView(value: value)),
    );
  }
}
