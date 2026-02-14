import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:skinalertsv2/Utils/enum.dart';

import '../helpers/snackbar.dart';

class RegisterController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController;
  final RxBool isObscurePassword = true.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController noHPController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TapGestureRecognizer privacyPolicyRecognizer = TapGestureRecognizer();
  final RxBool isValidated = false.obs;
  final RxBool isValidatedFullname = false.obs;

  final RxBool isLoading = false.obs;
  final RxBool isTappedSignUp = false.obs;

  final RxDouble angle = RxDouble(0);

  void get context {}

  dynamic changeForm() {
    isTappedSignUp.value = !isTappedSignUp.value;
    update();
  }


 

  //Sign Up FORM

  dynamic clearTextController() {
    emailController.clear();
    nameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  Future<void> signInWithGoogle() async {
    Future<dynamic>.delayed(const Duration(milliseconds: 200));
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      // sharedPref.writeAccessToken(googleAuth!.accessToken!);
      final UserCredential userCreds =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCreds.user;
      if (userCreds.user != null) {
        final CollectionReference<dynamic> users =
            _firestore.collection('users');
        if (userCreds.additionalUserInfo!.isNewUser) {
          await users.doc(user!.uid).set(<String, dynamic>{
            'user_uid': user.uid,
            'creation_time': user.metadata.creationTime!.toIso8601String(),
            'last_sign_in_time':
                user.metadata.lastSignInTime!.toIso8601String(),
            'email': user.email,
            'role': 'guest',
            'no_hp': '0',
            'key_name': user.displayName!.substring(0, 1).toUpperCase(),
            'username': nameController.text.trim(),
            'user_image': user.photoURL,
          });
        } else {
          await users
              .doc(nameController.text.trim())
              .update(<Object, Object?>{
            'last_sign_in_time':
                user!.metadata.lastSignInTime!.toIso8601String(),
          });
        }

        // router.goNamed('dashboard');
      } else {
        Snack.show(SnackbarType.error, 'invalid email',
            'Email tidak dapat ditemukan coba lagi');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> signUpWithEmailAndPassword() async {
    if (confirmPasswordController.text != passwordController.text) {
      Snack.show(SnackbarType.error, 'Information',
          'Your password is not matched try again');
          log('1');
      return false;
    } else if (passwordController.text.length < 6) {
      Snack.show(SnackbarType.error, 'Information',
          'Your password too weak try again');
          log(passwordController.text);
          log(confirmPasswordController.text);

      return false;
    }
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      await credential.user?.sendEmailVerification();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(
        <String, dynamic>{
          'user_uid': credential.user!.uid,
          'username': nameController.text,
          'email': emailController.text,
          'no_hp': noHPController.text,
          'role': 'guest',
          'user_image': '',
          'key_name': nameController.text.substring(0, 1).toUpperCase(),
          'creation_time':
              credential.user!.metadata.creationTime!.toIso8601String(),
        },
      );
      isTappedSignUp.value = false;
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Snack.show(SnackbarType.error, 'Error', 'weak password try again');
      } else if (e.code == 'email-already-in-use') {
        Snack.show(SnackbarType.info, 'Information',
            '${emailController.text} is already exists');
      } else if (e.code == 'invalid-email') {
        Snack.show(
            SnackbarType.error, 'Information', 'Your email id is invalid');
      }
    }
    return false;
  }

  

  Future<bool> resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text.trim());
      Snack.show(SnackbarType.success, 'Reset successfully',
          'Mohon periksa inbox/spam email anda');
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

   
}