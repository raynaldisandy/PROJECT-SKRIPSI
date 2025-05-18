import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Text/lobstertwo_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';
import 'package:skinalertsv2/Widget/custom_textfield.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundcolor,
        child: Column(
          children: [
            SpaceSizer(
              vertical: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SpaceSizer(
                  horizontal: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: SizeConfig.horizontal(10),
                ),
                SpaceSizer(
                  horizontal: 5,
                ),
                LeaguespartanTextView(
                  value: "Super Admin",
                  color: AppColors.textblackcolour,
                ),
                SpaceSizer(
                  horizontal: 10,
                ),
                CustomFlatButton(
                  text: "Logout",
                  textSize: SizeConfig.safeBlockHorizontal * 0.8,
                  radius: SizeConfig.horizontal(0.4),
                  colorIconImage: AppColors.textwhitecolour,
                  width: SizeConfig.horizontal(5),
                  height: SizeConfig.horizontal(1),
                  onTap: () {},
                ),
              ],
            ),
            SpaceSizer(
              vertical: 2,
            ),
            Container(
              child: Center(
                child: LeaguespartanTextView(
                  value: "Poster Card",
                  fontWeight: FontWeight.bold,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(2)),
                color: AppColors.buttoncolorblue,
              ),
              width: SizeConfig.horizontal(90),
              height: SizeConfig.horizontal(10),
            ),
            SpaceSizer(
              vertical: 2,
            ),
            Row(
              children: [
                SpaceSizer(
                  horizontal: 5,
                ),
                CustomFlatButton(
                  text: "Add",
                  textSize: SizeConfig.safeBlockHorizontal * 0.8,
                  radius: SizeConfig.horizontal(0.4),
                  image: AssetList.addlogo,
                  iconSize: 2,
                  colorIconImage: AppColors.textwhitecolour,
                  width: SizeConfig.horizontal(5),
                  height: SizeConfig.horizontal(1),
                  onTap: () {},
                ),
                SpaceSizer(
                  horizontal: 3,
                ),
                CustomFlatButton(
                  text: "Edit",
                  textSize: SizeConfig.safeBlockHorizontal * 0.8,
                  radius: SizeConfig.horizontal(0.4),
                  image: AssetList.editlogo,
                  iconSize: 2,
                  colorIconImage: AppColors.textwhitecolour,
                  width: SizeConfig.horizontal(5),
                  height: SizeConfig.horizontal(1),
                  onTap: () {},
                ),
                SpaceSizer(
                  horizontal: 3,
                ),
                CustomFlatButton(
                  text: "Delete",
                  textSize: SizeConfig.safeBlockHorizontal * 0.8,
                  radius: SizeConfig.horizontal(0.4),
                  image: AssetList.deletelogo,
                  iconSize: 2,
                  colorIconImage: AppColors.textwhitecolour,
                  width: SizeConfig.horizontal(5),
                  height: SizeConfig.horizontal(1),
                  onTap: () {},
                ),
                SpaceSizer(
                  horizontal: 3,
                ),
              ],
            ),
            SpaceSizer(
              vertical: 3,
            ),
            Container(
              child: Center(
                child: Image.asset(AssetList.posterlogo),
              ),
            ),
            SpaceSizer(
              vertical: 30,
            ),
            Row(
              children: [
                Spacer(),
                CustomFlatButton(
                  text: "Submit",
                  radius: SizeConfig.horizontal(0.5),
                  width: SizeConfig.horizontal(10),
                  colorIconImage: AppColors.textwhitecolour,
                  onTap: () {},
                ),
                SpaceSizer(
                  horizontal: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
