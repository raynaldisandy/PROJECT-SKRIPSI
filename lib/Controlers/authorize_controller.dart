import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthorizeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final PageController pageController = PageController();

  late AnimationController animationController;
  Rx<String?> versionApp = Rx<String>('');
  Rx<String?> appName = Rx<String>('');
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxInt appYear = DateTime.now().year.obs;
  final RxString termsOfUse = RxString('');
  final RxString privacyPolicy = RxString('');
  RxString tagHero = RxString('auth');

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    animationController.repeat();
    _getValidateUser();
  }

  dynamic _getValidateUser() async {
    Future<void>.delayed(const Duration(milliseconds: 2000), () async {
      Get.offAllNamed('/login');
    });
  }
}
