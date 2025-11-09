import 'dart:developer';
import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skinalertsv2/Pages/history_view.dart';
import 'package:skinalertsv2/Pages/home_view.dart';
import 'package:skinalertsv2/Pages/login_view.dart';
import 'package:skinalertsv2/Pages/profile_view.dart';
import 'package:skinalertsv2/Pages/scan_view.dart';
import 'package:skinalertsv2/Utils/enum.dart';
import 'package:skinalertsv2/helpers/snackbar.dart';
import 'package:skinalertsv2/models/history_model.dart';
import 'package:skinalertsv2/utils/on_tap_identifier.dart';

class FrameController extends GetxController {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxInt defaultIndex = RxInt(0);
  RxInt unReadNotif = RxInt(0);
  final RxBool isLoading = false.obs;
  final RxBool isEdit = false.obs;
  User? user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  TextEditingController usernameChange = TextEditingController();
  TextEditingController noHPChange = TextEditingController();
  final CarouselSliderController carouselController =
      CarouselSliderController();
  TextEditingController emailChange = TextEditingController();
  final RxInt currentDot = RxInt(0);
  File? image;
  RxString userName = RxString('');
  RxString userImage = RxString('');
  RxString phoneNumber = RxString('');
  RxList<ScanHistory> historyList = RxList<ScanHistory>(<ScanHistory>[]);
  RxString userEmail = RxString('');
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final User? user = FirebaseAuth.instance.currentUser;
  RxList<OnTapIdentifier> onTapIdentifierList =
      RxList<OnTapIdentifier>(<OnTapIdentifier>[
    OnTapIdentifier(name: '', index: 0, isOnTapped: true),
    OnTapIdentifier(name: '', index: 1, isOnTapped: false),
    OnTapIdentifier(name: '', index: 2, isOnTapped: false),
    OnTapIdentifier(name: '', index: 3, isOnTapped: false),
  ]);
  @override
  void onInit() async {
    await getDataUser();
    getHistory(userName.value);
    super.onInit();
  }

  Future<void> signOut() async {
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginView());
  }

  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  dynamic getDataUser() async {
    isLoading.value = true;
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot<dynamic> documentSnapshot) {
      userName.value = documentSnapshot.data()['username'] as String;
      phoneNumber.value = documentSnapshot.data()['no_hp'] as String;
      userEmail.value = documentSnapshot.data()['email'] as String;
      userImage.value = documentSnapshot.data()['user_image'] as String;
      log(documentSnapshot.toString());
      update();
    });

    isLoading.value = false;
  }

  Future<bool> updateData({
    String? username,
    String? noHP,
    String? email,
  }) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw Exception("User not authenticated");
      }

      Map<String, dynamic> updateData = {};
      bool hasChanges = false;

      // Only update username if provided and different
      if (username != null && userName.value != username) {
        userName.value = username;
        updateData['username'] = username;
        hasChanges = true;
      }

      // Only update phone number if provided and different
      if (noHP != null && phoneNumber.value != noHP) {
        phoneNumber.value = noHP;
        updateData['no_hp'] = noHP;
        hasChanges = true;
      }

      // Only update email if provided and different
      if (email != null && userEmail.value != email) {
        userEmail.value = email;
        updateData['email'] = email;
        hasChanges = true;
      }

      if (hasChanges) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update(updateData);
      }
      isEdit.value = !isEdit.value;

      return true;
    } catch (e) {
      log("Error updating user data: $e");
      rethrow;
    }
  }

  Future<dynamic> pickImage(ImageSource source) async {
    try {
      user = FirebaseAuth.instance.currentUser;

      final SettableMetadata metadata =
          SettableMetadata(contentType: 'image/jpeg');
      final XFile? image = await ImagePicker().pickImage(source: source);
      final Reference ref = firebaseStorage
          .ref('users')
          .child('user_gallery')
          .child(user!.displayName!)
          .child('${user!.uid}.jpeg');

      if (image == null) {
        return Snack.show(
            SnackbarType.error, 'Information', 'Failed to pick image');
      }
      final File imageTemp = File(image.path);
      await ref.putFile(imageTemp, metadata);
      final String url = await ref.getDownloadURL();
      Get.back();
      Snack.show(SnackbarType.success, 'Image',
          'Image has been uploaded, Image will replaced after pressing Submit');
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .update(<Object, Object?>{'user_image': url});
    } on PlatformException {
      Snack.show(SnackbarType.error, 'Information', 'Failed to pick image');
    }
    update();
  }

  Future<void> getHistory(String username) async {
    try {
      await _firestore
          .collection('history_scanner')
          .doc(username)
          .get()
          .then((DocumentSnapshot<dynamic> documentSnapshot) {
        if (documentSnapshot.exists) {
          final Map<String, dynamic> data =
              documentSnapshot.data() as Map<String, dynamic>;

          // Akses field scan_history yang merupakan array
          final List<dynamic> historyData =
              data['scan_history'] as List<dynamic>;

          historyList.value = historyData
              .map((dynamic e) =>
                  ScanHistory.fromJson(e as Map<String, dynamic>))
              .toList();

          log(data.toString());
          update();
        } else {
          log('Dokumen tidak ditemukan untuk username: $username');
          historyList.value = []; // Set empty list jika dokumen tidak ada
        }
      });

      update();
    } catch (e) {
      log('Error fetching scan history: ${e.toString()}');
    }
  }



  List<Widget> widgetViewList = <Widget>[
    const HomeView(),
    const ScanView(),
    const HistoryView(),
    const ProfileView()
  ];

  void onTapNav(int index) {
    defaultIndex.value = index;

    for (final OnTapIdentifier element in onTapIdentifierList) {
      if (element.index == index) {
        onTapIdentifierList[index].isOnTapped = true;
      } else {
        onTapIdentifierList[element.index].isOnTapped = false;
      }
    }
  }
}
