
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {


  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController =
      TextEditingController();

  File? image;

  RxString profince = RxString('');
  RxString city = RxString('');
  RxString subdistrict = RxString('');
  RxString userImage = RxString('');
  RxBool isChangeAddress = RxBool(false);

  Future<dynamic> pickImage(ImageSource source) async {

      await ImagePicker().pickImage(source: source);
      // final Reference ref = firebaseStorage
      //     .ref('users')
      //     .child('user_gallery')
      //     .child(user!.displayName!)
      //     .child('${user!.uid}.jpeg');

    update();
  }
}