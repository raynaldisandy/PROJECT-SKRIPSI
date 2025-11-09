import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';
import 'package:skinalertsv2/Widget/custom_ripplebutton.dart';
import 'package:skinalertsv2/Widget/custom_textfield.dart';
import 'package:skinalertsv2/Widget/user_info.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final FrameController frameController = Get.put(FrameController());

    frameController.emailChange.text = frameController.userEmail.value;
    frameController.usernameChange.text = frameController.userName.value;
    frameController.noHPChange.text = frameController.phoneNumber.value;
    return Obx(
      () => Container(
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
              const SpaceSizer(
                vertical: 2,
              ),
              Stack(
                children: [
                  Center(
                    child: UserPicture(
                      height: SizeConfig.horizontal(12),
                      width: SizeConfig.horizontal(12),
                      isUseBorder: true,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeConfig.horizontal(38)),
                      child: CustomRippleButton(
                        onTap: () {
                          showDialog(
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
                                    onTap: () => frameController
                                        .pickImage(ImageSource.gallery),
                                    icon: Icons.photo,
                                    iconSize:
                                        SizeConfig.safeBlockHorizontal * 12,
                                    colorIconImage: AppColors.whitecard,
                                  ),
                                  const SpaceSizer(
                                    horizontal: 7,
                                  ),
                                  CustomFlatButton(
                                    text: '',
                                    width: SizeConfig.horizontal(5),
                                    height: SizeConfig.horizontal(2.5),
                                    onTap: () => frameController
                                        .pickImage(ImageSource.camera),
                                    icon: Icons.camera,
                                    iconSize:
                                        SizeConfig.safeBlockHorizontal * 12,
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
                          );
                        },
                        child: frameController.isEdit.isTrue
                            ? Container(
                                width: SizeConfig.horizontal(15),
                                height: SizeConfig.horizontal(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.buttoncolorblue),
                                child: Icon(
                                  Icons.mode_edit_outline_outlined,
                                  color: AppColors.whitecard,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                ],
              ),
              const SpaceSizer(
                vertical: 2,
              ),
              frameController.isEdit.isTrue
                  ? CustomTextField(title: "Full Name",controller: frameController.usernameChange,)
                  : TextBox(
                      value: frameController.userName.value,
                    ),
              const SpaceSizer(
                vertical: 2,
              ),
              frameController.isEdit.isTrue
                  ? CustomTextField(title: "Phone Number",controller: frameController.noHPChange,)
                  : TextBox(
                      value: frameController.phoneNumber.value,
                    ),
              const SpaceSizer(
                vertical: 2,
              ),
              frameController.isEdit.isTrue
                  ? CustomTextField(title: "Email",controller: frameController.emailChange,)
                  : TextBox(
                      value: frameController.userEmail.value,
                    ),
              SpaceSizer(
                vertical: frameController.isEdit.isTrue ? 3 : 7,
              ),
              frameController.isEdit.isTrue
                  ? CustomFlatButton(
                      backgroundColor: AppColors.buttoncolorblue,
                      text: "Confirm Update",
                      onTap: () => frameController.updateData(username:frameController.usernameChange.text,noHP:  frameController.noHPChange.text,email:frameController.emailChange.text))
                  : CustomFlatButton(
                      backgroundColor: AppColors.buttoncolorblue,
                      text: "Update Profile",
                      onTap: () => frameController.isEdit.value =
                          !frameController.isEdit.value,
                    ),
              const SpaceSizer(
                vertical: 1,
              ),
              frameController.isEdit.isTrue
                  ? CustomFlatButton(
                      backgroundColor: Colors.red,
                      text: "Cancel",
                      onTap: () => frameController.isEdit.value =
                          !frameController.isEdit.value,
                    )
                  : CustomFlatButton(
                      backgroundColor: Colors.red,
                      text: "Log out",
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
  const TextBox({super.key, required this.value});

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
