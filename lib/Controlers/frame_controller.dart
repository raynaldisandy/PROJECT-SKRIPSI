import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skinalertsv2/Pages/history_view.dart';
import 'package:skinalertsv2/Pages/home_view.dart';
import 'package:skinalertsv2/Pages/login_view.dart';
import 'package:skinalertsv2/Pages/profile_view.dart';
import 'package:skinalertsv2/Pages/scan_view.dart';
import 'package:skinalertsv2/models/history_model.dart';
import 'package:skinalertsv2/utils/on_tap_identifier.dart';

class FrameController extends GetxController {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxInt defaultIndex = RxInt(0);
  RxInt unReadNotif = RxInt(0);
  final RxBool isLoading = false.obs;
  final RxBool isEdit = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxString username = RxString('');
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
    getHistory(username.value);
    super.onInit();
  }


  Future<void> signOut() async {
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    Get.offAll(const LoginView());
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

  dynamic getDataUser() async {
    isLoading.value = true;
    await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((DocumentSnapshot<dynamic> documentSnapshot) {
      username.value = documentSnapshot.data()['username'] as String;
      phoneNumber.value = documentSnapshot.data()['no_hp'] as String;
      userEmail.value = documentSnapshot.data()['email'] as String;
      log(documentSnapshot.toString());
      update();
    });

    isLoading.value = false;
  }
  // Stream<QuerySnapshot<Map<String, dynamic>>> totalUnreadChat() {
  //   return _firestore
  //       .collection('users')
  //       .doc(user!.uid)
  //       .collection('chats')
  //       .snapshots();
  // }

  List<Widget> widgetViewList = <Widget>[
    HomeView(),
    ScanView(),
    HistoryView(),
    ProfileView()
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
