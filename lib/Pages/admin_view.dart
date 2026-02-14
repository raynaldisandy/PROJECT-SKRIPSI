import 'package:flutter/material.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';
import 'package:skinalertsv2/Widget/custom_flatbutton.dart';

class AdminView extends StatelessWidget {
  const AdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.backgroundcolor,
        child: Column(
          children: [
            const SpaceSizer(
              vertical: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SpaceSizer(
                  horizontal: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: SizeConfig.horizontal(10),
                ),
                const SpaceSizer(
                  horizontal: 5,
                ),
                LeaguespartanTextView(
                  value: "Super Admin",
                  color: AppColors.textblackcolour,
                ),
                const SpaceSizer(
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
            const SpaceSizer(
              vertical: 2,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(2)),
                color: AppColors.buttoncolorblue,
              ),
              width: SizeConfig.horizontal(90),
              height: SizeConfig.horizontal(10),
              child: const Center(
                child: LeaguespartanTextView(
                  value: "Poster Card",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SpaceSizer(
              vertical: 2,
            ),
            Row(
              children: [
                const SpaceSizer(
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
                const SpaceSizer(
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
                const SpaceSizer(
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
                const SpaceSizer(
                  horizontal: 3,
                ),
              ],
            ),
            const SpaceSizer(
              vertical: 3,
            ),
            Center(
              child: Image.asset(AssetList.posterlogo),
            ),
            const SpaceSizer(
              vertical: 30,
            ),
            Row(
              children: [
                const Spacer(),
                CustomFlatButton(
                  text: "Submit",
                  radius: SizeConfig.horizontal(0.5),
                  width: SizeConfig.horizontal(10),
                  colorIconImage: AppColors.textwhitecolour,
                  onTap: () {},
                ),
                const SpaceSizer(
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
