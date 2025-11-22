import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/login_controllers.dart';
import 'package:skinalertsv2/Frame/frame_scaffold.dart';
import 'package:skinalertsv2/Pages/register_view.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';
import 'package:skinalertsv2/Widget/custom_textbutton.dart';
import 'package:skinalertsv2/Widget/custom_textfield.dart';
import 'package:skinalertsv2/Widget/skinalert_logo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
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
                    vertical: 4,
                  ),
                  LobstertwoTextView(
                    value: "Skin Alert",
                    size: SizeConfig.blockSizeHorizontal * 10,
                    color: AppColors.textbluecolour,
                    fontWeight: FontWeight.bold,
                  ),
                  const SkinalertLogo(),
                  LobstertwoTextView(
                    value: "Log In",
                    size: SizeConfig.blockSizeHorizontal * 10,
                    color: AppColors.textbluecolour,
                    fontWeight: FontWeight.bold,
                  ),
                  const SpaceSizer(
                    vertical: 2,
                  ),
                  CustomTextField(
                    title: "Email",
                    controller: loginController.emailController,
                  ),
                  const SpaceSizer(
                    vertical: 2,
                  ),
                  CustomTextField(
                    title: "Password",
                    passwordController: loginController.passwordController,
                    isPasswordField: true,
                  ),
                  Row(
                    children: [
                      const SpaceSizer(
                        horizontal: 10,
                      ),
                      CustomTextbutton(
                          onPressed: () => showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const LeaguespartanTextView(
                                    value:
                                        "Masukkan email-mu untuk reset password",
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  content: SizedBox(
                                    width: SizeConfig.horizontal(20),
                                    height: SizeConfig.horizontal(35),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomTextField(
                                              controller: loginController
                                                  .emailController,
                                              title: 'Email',
                                              width: SizeConfig.horizontal(15),
                                              height: SizeConfig.horizontal(25),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    CustomFlatButton(
                                        width: 40,
                                        height: 5,
                                        text: 'Reset Password',
                                        onTap: () =>
                                            loginController.resetPassword()),
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
                          text: 'Forgot Password?'),
                    ],
                  ),
                  CustomFlatButton(
                    text: "Log in",
                    onTap: () async {
                      await loginController.signInWithEmailAndPassword();
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
                    onTap: () => loginController.signInWithGoogle(),
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
                        value: "Don't Have An Account? Create",
                        color: AppColors.textblackcolour,
                      ),
                      CustomTextbutton(
                        onPressed: () => Get.to(const RegisterView()),
                        text: "Now        ",
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
