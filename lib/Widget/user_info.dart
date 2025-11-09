import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skinalertsv2/Controlers/frame_controller.dart';

import '../Utils/size_config.dart';

class UserPicture extends StatelessWidget {
  const UserPicture({
    super.key,
    this.width,
    this.height,
    this.isUseBorder,
  });
  final double? width;
  final double? height;
  final bool? isUseBorder;

  @override
  Widget build(BuildContext context) {
    // final AkunController akunController = Get.put(AkunController());
    final FrameController frameController = Get.put(FrameController());

    return Obx(
      () => frameController.isLoading.isTrue
          ? const Center(
              child: CircularProgressIndicator(
                  ))
          : frameController.userImage.value == ''
              ? CircleAvatar(
                  minRadius: 30,
                  child: Icon(Icons.person_2_rounded,
                      size: SizeConfig.horizontal(10)))
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.horizontal(20))),
                      // ignore: use_if_null_to_convert_nulls_to_bools
                      border: isUseBorder == true
                          ? Border.all(
                              color: Colors.white,
                              width: SizeConfig.horizontal(1))
                          : null),
                  width: SizeConfig.horizontal(width ?? 20),
                  height: SizeConfig.horizontal(height ?? 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(SizeConfig.horizontal(20))),
                    child: CachedNetworkImage(
                        imageUrl: frameController.userImage.value,
                        fit: BoxFit.cover),
                  ),
                ),
    );
  }
}