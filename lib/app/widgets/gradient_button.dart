import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/color_manager.dart';
import '../utils/font_manager.dart';

class GradientButton extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final String text;
  double? width = Get.width;
  double? height = 55.h;
  final VoidCallback onTap;
  final Gradient gradient;
  GradientButton(
      {super.key,
      required this.text,
      required this.onTap,
      required this.gradient,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Obx(() {
          return controller.loading.value
              ? Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: ColorManager.primaryWhite,
                    ),
                  ),
                )
              : Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        color: ColorManager.primaryWhite,
                        fontSize: FontSize.s18),
                  ),
                );
        }),
      ),
    );
  }
}
