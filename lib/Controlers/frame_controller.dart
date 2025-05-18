
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skinalertsv2/Pages/history_view.dart';
import 'package:skinalertsv2/Pages/home_view.dart';
import 'package:skinalertsv2/Pages/profile_view.dart';
import 'package:skinalertsv2/Widget/custom_ripplebutton.dart';
import 'package:skinalertsv2/utils/on_tap_identifier.dart';


class FrameController extends GetxController {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxInt defaultIndex = RxInt(0);
  RxInt unReadNotif = RxInt(0);

  // final User? user = FirebaseAuth.instance.currentUser;
  RxList<OnTapIdentifier> onTapIdentifierList =
      RxList<OnTapIdentifier>(<OnTapIdentifier>[
    OnTapIdentifier(name: '', index: 0, isOnTapped: true),
    OnTapIdentifier(name: '', index: 2, isOnTapped: false),
    OnTapIdentifier(name: '', index: 3, isOnTapped: false),
    OnTapIdentifier(name: '', index: 4, isOnTapped: false),
  ]);

  // Stream<QuerySnapshot<Map<String, dynamic>>> totalUnreadChat() {
  //   return _firestore
  //       .collection('users')
  //       .doc(user!.uid)
  //       .collection('chats')
  //       .snapshots();
  // }

  List<Widget> widgetViewList = <Widget>[
    HomeView(),
    CustomRippleButton(onTap: () => ImagePicker().pickImage(source: ImageSource.camera),),
    HistoryView(),
    ProfileView()
    // const HomeView(),
    // const ChatView(),
    // const HomeServicesView(),
    // const WorkshopView(),
    // const AkunView(),
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