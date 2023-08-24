import 'package:daraz_clone_app/app/utils/constant/assets_manager.dart';
import 'package:daraz_clone_app/app/utils/constant/color_manager.dart';
import 'package:daraz_clone_app/app/utils/constant/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  SettingsView({Key? key}) : super(key: key);

  @override
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorManager.primaryBlack,
        title: const Text(
          'Settings',
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: ColorManager.primaryWhite,
      ),
      body: Container(
        color: Colors.grey.shade200,
        width: Get.width,
        child: Card(
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: IntrinsicHeight(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Messages',
                          style: TextStyle(fontSize: FontSize.s20),
                        ),
                        Text(
                          'Receive exclusive offers and personal updates',
                          style: TextStyle(
                              fontSize: FontSize.s12,
                              color: ColorManager.primaryGrey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                            child: SvgPicture.asset(
                          ImageAssets.nepalFlag,
                          width: 20,
                        )),
                        SizedBox(
                          width: 15.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country',
                              style: TextStyle(fontSize: FontSize.s20),
                            ),
                            Text(
                              'Nepal is your current country',
                              style: TextStyle(
                                  fontSize: FontSize.s12,
                                  color: ColorManager.primaryGrey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'भाषा - Language',
                          style: TextStyle(fontSize: FontSize.s20),
                        ),
                        Text(
                          'English',
                          style: TextStyle(
                              fontSize: FontSize.s12,
                              color: ColorManager.primaryGrey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      'General',
                      style: TextStyle(fontSize: FontSize.s20),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      'Policies',
                      style: TextStyle(fontSize: FontSize.s20),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Text(
                      'Help',
                      style: TextStyle(fontSize: FontSize.s20),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
      // persistentFooterButtons: [
      //   Obx(() => Text(
      //         "${controller.version}",
      //         style: TextStyle(color: Colors.white),
      //       )),
      // ],
    );
  }
}
