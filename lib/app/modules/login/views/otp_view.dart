import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/constant/color_manager.dart';
import '../../../utils/constant/font_manager.dart';
import '../../../utils/constant/value_manager.dart';
import '../../../widgets/gradient_button.dart';

class OtpView extends StatelessWidget {
  OtpView({Key? key}) : super(key: key);

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    final verificationId = Get.arguments['verificationId'];
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back,
              color: ColorManager.primaryBlack,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter the code',
              style: TextStyle(
                  fontSize: FontSize.s26, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Please enter the 6-digit code sent to ${controller.phoneNumberController.text} via SMS',
              style: TextStyle(
                  fontSize: FontSize.s14, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              controller: controller.otpController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: '6 digit code'),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Resend Code',
                  style: TextStyle(fontSize: FontSize.s12),
                )),
            GradientButton(
              text: 'Next',
              loading: controller.loading.value,
              onTap: () async {
                await loginController.signInWithPhoneNumber(verificationId);
                Get.offAllNamed("/");
              },
              gradient: LinearGradient(
                colors: [ColorManager.primaryOrange, Colors.orangeAccent],
                stops: const [0.2, 2],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
