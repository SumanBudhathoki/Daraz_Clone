import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/color_manager.dart';
import '../../../../utils/font_manager.dart';

class LoginViewButton extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final String text;
  final VoidCallback onTap;
  LoginViewButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 40),
        width: Get.width,
        height: 55.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorManager.primaryOrange, Colors.orangeAccent],
            stops: const [0.2, 2],
          ),
          borderRadius: BorderRadius.circular(10),
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
