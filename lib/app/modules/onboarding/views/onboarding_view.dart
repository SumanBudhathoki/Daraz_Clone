import 'dart:developer';

import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';

import 'package:daraz_clone_app/app/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => SafeArea(
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: controller.onboardingPages.length,
                    onPageChanged: (value) {
                      controller.selectedIndex.value = value;
                      log(controller.selectedIndex.value.toString());
                    },
                    itemBuilder: (context, index) {
                      return Image(
                        image: AssetImage(
                            controller.onboardingPages[index].imageAsset!),
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            controller.onboardingPages.length,
                            (index) => Container(
                              margin: const EdgeInsets.all(2),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.selectedIndex.value == index
                                      ? ColorManager.primaryWhite
                                      : ColorManager.primaryGrey),
                            ),
                          ),
                        ),
                        TextButtonWidget(
                          onPress: () async {
                            controller
                                .completeOnboarding(); //This function will only call onboarding screen once when the app is installed
                            Get.offAllNamed(Routes.HOME);  
                          },
                          text: controller.selectedIndex.value ==
                                  4 //When the Page view is at last
                              ? "Start Shopping >".toUpperCase()
                              : "Skip to the App >".toUpperCase(),
                          fontSize: FontSize.s14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
