import 'package:flutter/material.dart';
import 'package:skinalertsv2/Text/leaguespartan_text_view.dart';
import 'package:skinalertsv2/Utils/app_colours.dart';
import 'package:skinalertsv2/Utils/assets_list.dart';
import 'package:skinalertsv2/Utils/enum.dart';
import 'package:skinalertsv2/Utils/size_config.dart';
import 'package:skinalertsv2/Utils/space_sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return  Container(
        color: AppColors.backgroundcolor,
        child:SingleChildScrollView(
          child: Column(
            children: [
              SpaceSizer(
                vertical: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: SizeConfig.horizontal(10),
                  ),
                  SpaceSizer(
                    horizontal: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LeaguespartanTextView(
                        value: "Hi John Doe.",
                        color: AppColors.textblackcolour,
                      ),
                      LeaguespartanTextView(
                        value: "Good Morning and Keep Healthy",
                        color: AppColors.textblackcolour,
                      ),
                    ],
                  ),
                ],
              ),
              SpaceSizer(
                vertical: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SpaceSizer(horizontal: 10,),
                  LeaguespartanTextView(
                    value: "News & Info",
                    color: AppColors.textblackcolour,
                    fontWeight: FontWeight.bold,
                  ),
                  SpaceSizer(
                    horizontal: 2,
                  ),
                ],
              ),
              SpaceSizer(vertical: 2,),
              ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(4)),
                child: Image.asset(
                  AssetList.posterlogo,
                ),
              ),
              SpaceSizer(vertical: 2,),
              ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(4)),
                child: Image.asset(
                  AssetList.posterlogo,
                ),
              ),
              SpaceSizer(vertical: 2,),
              ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(4)),
                child: Image.asset(
                  AssetList.posterlogo,
                ),
              ),
              SpaceSizer(vertical: 2,),
              ClipRRect(
                borderRadius: BorderRadius.circular(SizeConfig.horizontal(4)),
                child: Image.asset(
                  AssetList.posterlogo,
                ),
              ),
              SpaceSizer(vertical: 10,)
            ],
          ),
        ),
      
    );
  }
}
