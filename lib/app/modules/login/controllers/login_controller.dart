import 'dart:math';

import 'package:daraz_clone_app/app/modules/home/views/home_view.dart';
import 'package:daraz_clone_app/app/modules/login/views/login_view.dart';
import 'package:daraz_clone_app/app/modules/login/views/otp_view.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  // final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
  }

  void changeObscureValue() {
    obscureText.value = !obscureText.value;
  }

  Future<void> verifyPhoneNumber() async {
    loading.value = true;
    // if (loginFormKey.currentState!.validate()) {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+977 ${phoneNumberController.text}",
        verificationCompleted: (_) {
          loading.value = false;
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar(
              "Error",
              "The phone number you entered is invalid.",
              colorText: ColorManager.primaryWhite,
              duration: const Duration(seconds: 5),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
            );
          } else {
            Get.snackbar(
              "Error",
              "An unknown error occurred. Please try again later.",
              colorText: ColorManager.primaryWhite,
              duration: const Duration(seconds: 5),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
            );
          }

          debugPrint(e.message);
          loading.value = false;
        },
        codeSent: (String verificationId, int? token) {
          Get.to(() => OtpView(),
              arguments: {"verificationId": verificationId});
          loading.value = false;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          loading.value = false;
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unknown error occurred. Please try again later.',
        duration: const Duration(seconds: 5),
      );
    }
    // }
  }

  Future<void> signInWithPhoneNumber(String verificationId) async {
    loading.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text,
      );
      await _auth.signInWithCredential(credential);
      Get.offAll(() => HomeView());
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Error',
        'The OTP you entered is invalid. Please try again.',
        duration: const Duration(seconds: 5),
      );
    }
    //  loading.value = false;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Get.off(() => const LoginView());
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      loading.value = false;
      return "Please enter a valid phone number";
    } else if (value.length < 10 || value.length > 10) {
      loading.value = false;
      return "Please enter a valid phone number.";
    } else if (!RegExp(r'^\+?[1-9]\d{1,14}$').hasMatch(value)) {
      loading.value = false;
      return 'Please enter a valid phone number';
    }
    return null;
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
