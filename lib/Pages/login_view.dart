import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skinalertsv2/Frame/frame_scaffold.dart';
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
                  SpaceSizer(
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
                  SpaceSizer(
                    vertical: 2,
                  ),
                  CustomTextField(title: ""),
                  SpaceSizer(
                    vertical: 2,
                  ),
                  CustomTextField(
                    title: "",
                    isPasswordField: true,
                  ),
                  Row(
                    children: [
                      SpaceSizer(
                        horizontal: 10,
                      ),
                      CustomTextbutton(
                          onPressed: () {}, text: 'Forgot Password'),
                    ],
                  ),
                  CustomFlatButton(
                    text: "Log in",
                    onTap: () {},
                  ),
                  SpaceSizer(
                    vertical: 2,
                  ),
                  Container(
                    width: SizeConfig.horizontal(80),
                    child: Divider(
                        height: SizeConfig.horizontal(0.5),
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                        color: Colors.black26),
                  ),
                  SpaceSizer(
                    vertical: 2,
                  ),
                  CustomFlatButton(
                    text: "Continue With Google",
                    onTap: () {},
                    backgroundColor: AppColors.buttoncolorblue,
                    image: AssetList.googleLogo,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpaceSizer(horizontal: 5,),
                      LeaguespartanTextView(
                        value: "Don't Have An Account? Create",
                        color: AppColors.textblackcolour,
                      ),
                      CustomTextbutton(
                        onPressed: () {},
                        text: "Now        ",
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
