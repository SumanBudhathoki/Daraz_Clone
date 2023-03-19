import 'package:daraz_clone_app/app/modules/home/views/home_view.dart';
import 'package:daraz_clone_app/app/modules/login/views/login_view.dart';
import 'package:daraz_clone_app/app/modules/login/views/otp_view.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/widgets/custom_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  RxBool obscureText = false.obs;
  RxBool loading = false.obs;

  final phoneNumberController = TextEditingController();
  final otpController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late GoogleSignIn googleSignin;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() async {
    googleSignin = GoogleSignIn();
    // _auth.authStateChanges().listen((event) {
    //   print(event);
    // });
    // TODO: implement onReady
    super.onReady();
  }

  // For password field
  void changeObscureValue() {
    obscureText.value = !obscureText.value;
  }

  // Phone number verification for login
  Future<void> verifyPhoneNumber() async {
    loading.value = true;
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
  }

  // Otp Verification and login
  Future<void> signInWithPhoneNumber(String verificationId) async {
    loading.value = true;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpController.text,
      );
      await _auth.signInWithCredential(credential);
      Get.offAll(() => HomeView());
      Get.snackbar(
        'Success',
        'Logged in successfully',
      );
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

  // Logout
  Future<void> signOut() async {
    await googleSignin.disconnect();
    await _auth.signOut();

    Get.offAll(() => const LoginView());
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

  // Sign in with google
  void googleLogin() async {
    CustomFullScreenDialog.showDialog();
    GoogleSignInAccount? googleSignInAccount = await googleSignin.signIn();
    if (googleSignin == null) {
      CustomFullScreenDialog.cancelDialog();
    } else {
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      await _auth.signInWithCredential(oAuthCredential);
      CustomFullScreenDialog.cancelDialog();
      
    }
  }

  @override
  void onClose() {
    phoneNumberController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
