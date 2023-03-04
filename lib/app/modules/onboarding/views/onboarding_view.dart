import 'dart:developer';

import 'package:daraz_clone_app/app/utils/assets_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:daraz_clone_app/app/utils/value_manager.dart';
import 'package:daraz_clone_app/app/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                      controller.index.value = value;
                      log(controller.index.value.toString());
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
                        Wrap(
                          spacing: AppSize.s8,
                          children: [
                            Icon(
                              Icons.circle,
                              size: FontSize.s12,
                              color: controller.index.value == 0
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.circle,
                              size: FontSize.s12,
                              color: controller.index.value == 1
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.circle,
                              size: FontSize.s12,
                              color: controller.index.value == 2
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.circle,
                              size: FontSize.s12,
                              color: controller.index.value == 3
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            Icon(
                              Icons.circle,
                              size: FontSize.s12,
                              color: controller.index.value == 4
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ],
                        ),
                        TextButtonWidget(
                          onPress: () {},
                          text: controller.index.value ==
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
