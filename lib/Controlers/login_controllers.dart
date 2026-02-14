import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skinalertsv2/Frame/frame_view.dart';
import 'package:skinalertsv2/Utils/enum.dart';

import '../helpers/snackbar.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxBool isObscurePassword = true.obs;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController phoneNumbController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();
  // final TapGestureRecognizer privacyPolicyRecognizer = TapGestureRecognizer();
  final RxBool isTapped = false.obs;

  final RxDouble angle = RxDouble(0);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithGoogle() async {
    Future<dynamic>.delayed(const Duration(milliseconds: 200));
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final UserCredential userCreds =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCreds.user;
      if (userCreds.user != null) {
        isTapped.value = true;
        final CollectionReference<dynamic> users =
            _firestore.collection('users');
        if (userCreds.additionalUserInfo!.isNewUser) {
          await users.doc(user!.uid).set(<String, dynamic>{
            'user_uid': user.uid,
            'update_time': DateTime.now().toIso8601String(),
            'creation_time': user.metadata.creationTime!.toIso8601String(),
            'last_sign_in_time':
                user.metadata.lastSignInTime!.toIso8601String(),
            'email': user.email,
            'status': 'User',
            'key_name': user.displayName!.substring(0, 1).toUpperCase(),
            'username': user.displayName,
            'user_image': user.photoURL ?? '',
            'no_hp': '0',
            'description': '',
            'gender': '',
            'profiency': '',
            'city': '',
            'subdistrict': '',
          });
        } else {
          await users.doc(user!.uid).update(<Object, Object?>{
            'last_sign_in_time':
                user.metadata.lastSignInTime!.toIso8601String(),
          });
        }

        isTapped.value = false;
        Get.offAll(const FrameView());
      } else {
        Snack.show(SnackbarType.error, 'invalid email',
            'Email tidak dapat ditemukan coba lagi');
      }
    } catch (e) {
      log('tetot${e.toString()}');
    }
  }

  Future<bool> resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      Get.back();
      Snack.show(SnackbarType.success, 'Reset Berhasil',
          'Cek email kamu di spam/inbox dan lakukan reset password');
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          Snack.show(SnackbarType.error, 'invalid email',
              'Email tidak dapat ditemukan coba lagi');
          break;
        case 'user-not-found':
          Snack.show(SnackbarType.error, 'Unknown email',
              'Akun tidak dapat ditemukan coba lagi/password salah');
          break;
        default:
          Snack.show(SnackbarType.error, 'Error',
              'Something error please try again later');
      }
      return false;
    }
  }

  dynamic signInWithEmailAndPassword() async {
    try {
      isTapped.value = true;
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      if (!credential.user!.emailVerified) {
        Snack.show(SnackbarType.error, 'Email Verification',
            'Email kamu belum terverifikasi mohon check inbox/spam');
        isTapped.value = false;
        return;
      }
      if (credential.user == null) {
        Snack.show(SnackbarType.error, 'Email Verification',
            'Email kamu belum terverifikasi mohon check inbox/spam');
        isTapped.value = false;
        return;
      }
      Get.offAll(const FrameView());
      isTapped.value = false;

      return credential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          Snack.show(SnackbarType.error, 'invalid email',
              'Email tidak dapat ditemukan coba lagi');
          isTapped.value = false;
          break;
        case 'invalid-credential':
          Snack.show(SnackbarType.error, 'wrong email/password',
              'Email/Password salah coba lagi');
          isTapped.value = false;
          break;
        case 'user-not-found':
          Snack.show(SnackbarType.error, 'Unknown email',
              'Akun tidak dapat ditemukan coba lagi/password salah');
          isTapped.value = false;
          break;
        case 'ERROR_USER_DISABLED':
          Snack.show(SnackbarType.error, 'Error User',
              'Akunmu dihentikan untuk sementara waktu');
          isTapped.value = false;
          break;
        case 'ERROR_TOO_MANY_REQUESTS':
          Snack.show(
              SnackbarType.error, 'Error', 'Too many request try again later');
          isTapped.value = false;
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          Snack.show(SnackbarType.error, 'Unknown user', 'Operasi dihentikan');
          isTapped.value = false;
          break;
        default:
          Snack.show(SnackbarType.error, 'Error',
              'Something error please try again later');
          isTapped.value = false;
          return null;
      }
    }
  }
}
