import 'dart:developer';

import 'package:daraz_clone_app/app/modules/home/views/home_view.dart';
import 'package:daraz_clone_app/app/modules/onboarding/controllers/onboarding_controller.dart';
import 'package:daraz_clone_app/app/modules/onboarding/views/onboarding_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController _onboardingController =
        Get.put(OnboardingController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Daraz Clone",
      // initialRoute: (onboardingController.checkOnboardingStatus() == true)
      //     ? Routes.HOME
      //     : AppPages.INITIAL,
      home: _onboardingController.onBoarding
          ? const OnboardingView()
          : const HomeView(),
      getPages: AppPages.routes,
    );
  }
}
