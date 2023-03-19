import 'package:daraz_clone_app/app/modules/login/views/login_view_withphn.dart';
import 'package:daraz_clone_app/app/modules/login/views/login_with_email_view.dart';
import 'package:daraz_clone_app/app/utils/assets_manager.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:daraz_clone_app/app/utils/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../utils/style_manager.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryOrange,
      appBar: AppBar(
        backgroundColor: ColorManager.primaryOrange,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close_outlined),
          iconSize: AppSize.s28,
          color: ColorManager.primaryWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Image.asset(
              ImageAssets.logo1,
              width: 150.w,
              height: 160.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'shop over 1'.toUpperCase(),
              style: getLoginSubtitle(color: ColorManager.primaryCyan),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'million products at'.toUpperCase(),
              style: getLoginSubtitle(color: ColorManager.primaryCyan),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
              'unbeatable prices'.toUpperCase(),
              style: getLoginSubtitle(color: ColorManager.primaryCyan),
            ),
            SizedBox(
              height: 150.h,
            ),
            Text(
              'Register or Login with Mobile Number',
              style: getLoginSubtitle(
                      color: ColorManager.primaryCyan.withOpacity(0.5))
                  .copyWith(
                fontWeight: FontWeightManager.light,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: ColorManager.primaryWhite,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.w),
                  child: Row(
                    children: [
                      SvgPicture.asset(ImageAssets.nepalFlag),
                      SizedBox(
                        width: 15.w,
                      ),
                      const Text("+977"),
                      SizedBox(
                        width: 15.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LoginViewWithPhn(),
                              transition: Transition.rightToLeft);
                        },
                        child: Text(
                          'Enter your mobile number',
                          style: TextStyle(
                              color:
                                  ColorManager.primaryBlack.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const LoginWithEmailView(),
                    transition: Transition.rightToLeft);
              },
              child: Text(
                'Login with email',
                style: TextStyle(
                    color: ColorManager.primaryWhite,
                    decoration: TextDecoration.underline),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 50.h, 30.w, 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100.h,
                    height: 0.5.h,
                    color: ColorManager.primaryWhite.withOpacity(.7),
                  ),
                  Text(
                    'Or continue with',
                    style: getProductSubtitle(
                        fontSize: FontSize.s10,
                        color: ColorManager.primaryWhite.withOpacity(.7)),
                  ),
                  Container(
                    width: 100.h,
                    height: 0.5.h,
                    color: ColorManager.primaryWhite.withOpacity(.7),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Image.asset(
                    ImageAssets.fbLogo,
                    width: 40.w,
                  ),
                ),
                SizedBox(
                  width: 30.w,
                ),
                GestureDetector(
                  onTap: () => controller.googleLogin(),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 40.w,
                      // height: 50.w,
                      decoration: BoxDecoration(
                          color: ColorManager.primaryWhite,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Image(
                        image: AssetImage(
                          ImageAssets.googleLogo,
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
