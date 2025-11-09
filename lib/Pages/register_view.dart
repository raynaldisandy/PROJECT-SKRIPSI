import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/register_controller.dart';
import 'package:skinalertsv2/Frame/frame_scaffold.dart';
import 'package:skinalertsv2/Pages/login_view.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';
import 'package:skinalertsv2/Widget/custom_textbutton.dart';
import 'package:skinalertsv2/Widget/custom_textfield.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController = Get.put(RegisterController());
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
            view: Center(
              child: Column(
                children: [
                  const SpaceSizer(
                    vertical: 3,
                  ),
                  LobstertwoTextView(
                    value: "Register",
                    size: SizeConfig.blockSizeHorizontal * 10,
                    color: AppColors.textbluecolour,
                    fontWeight: FontWeight.bold,
                  ),
                  const SpaceSizer(
                    vertical: 1,
                  ),
                  CustomTextField(
                    title: "Nama",
                    controller: registerController.nameController,
                  ),
                  const SpaceSizer(
                    vertical: 1,
                  ),
                  CustomTextField(
                    isPasswordField: true,
                    title: "Password",
                    passwordController: registerController.passwordController,
                  ),
                  const SpaceSizer(
                    vertical: 1,
                  ),
                  CustomTextField(
                    isPasswordField: true,
                    title: "Confirm Password",
                    passwordController:
                        registerController.confirmPasswordController,
                  ),
                  const SpaceSizer(
                    vertical: 1,
                  ),
                  CustomTextField(
                    title: "Email",
                    controller: registerController.emailController,
                  ),
                  const SpaceSizer(
                    vertical: 1,
                  ),
                  CustomTextField(
                    title: "No Handhphone",
                    controller: registerController.noHPController,
                  ),
                  const SpaceSizer(
                    vertical: 1,
                  ),
                  LeaguespartanTextView(
                    value:
                        "    By continuing, you agree to\nTerms of Use and Privacy Policy.",
                    color: AppColors.textblackcolour,
                  ),
                  const SpaceSizer(
                    vertical: 2,
                  ),
                  CustomFlatButton(
                    text: "Create Account",
                    onTap: () async {
                      await registerController.signUpWithEmailAndPassword();
                      Get.off(const LoginView());
                    },
                  ),
                  const SpaceSizer(
                    vertical: 2,
                  ),
                  SizedBox(
                    width: SizeConfig.horizontal(80),
                    child: Divider(
                        height: SizeConfig.horizontal(0.5),
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                        color: Colors.black26),
                  ),
                  const SpaceSizer(
                    vertical: 2,
                  ),
                  CustomFlatButton(
                    text: "Continue With Google",
                    onTap: () => registerController.signInWithGoogle(),
                    backgroundColor: AppColors.buttoncolorblue,
                    image: AssetList.googleLogo,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SpaceSizer(
                        horizontal: 5,
                      ),
                      LeaguespartanTextView(
                        value: "Already Have Account? Login",
                        color: AppColors.textblackcolour,
                      ),
                      CustomTextbutton(
                        onPressed: () {
                          Get.back();
                        },
                        text: "Now        ",
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
