import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Container(
        color: AppColors.backgroundcolor,
        child: Center(
          child: Column(children: [
            SpaceSizer(
              vertical: 7,
            ),
            LobstertwoTextView(
              value: "Profile",
              size: SizeConfig.blockSizeHorizontal * 10,
              color: AppColors.textbluecolour,
              fontWeight: FontWeight.bold,
            ),
            SpaceSizer(vertical: 2,),
            CircleAvatar(
              child:Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  child: Icon(Icons.mode_edit_outline_outlined),
                  width: SizeConfig.horizontal(15),
                  height: SizeConfig.horizontal(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.buttoncolorblue
                  ),
                ),
              ),
              backgroundColor: Colors.black,
              radius: SizeConfig.horizontal(20),
            ),
            SpaceSizer(
              vertical: 2,
            ),
            CustomTextField(title: "Full Name"),
            SpaceSizer(
              vertical: 2,
            ),
            CustomTextField(title: "Phone Number"),
            SpaceSizer(
              vertical: 2,
            ),
            CustomTextField(title: "Email"),
            SpaceSizer(
              vertical: 2,
            ),
            SpaceSizer(
              vertical: 2,
            ),
            CustomFlatButton(text: "Update", onTap: () {

            },)
          ]),
        ),
      ),
    );
  }
}
