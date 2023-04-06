import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/font_manager.dart';
import '../../../utils/value_manager.dart';
import '../../../widgets/gradient_button.dart';

class LoginWithEmailView extends StatelessWidget {
  const LoginWithEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              'Welcome back',
              style: TextStyle(
                  fontSize: FontSize.s26, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              'Login with your password',
              style: TextStyle(
                  fontSize: FontSize.s14, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15.h,
            ),
            TextFormField(
              // autofocus: true,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Mobile Number/Email',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: FontSize.s14,
                ),
                fillColor: ColorManager.primaryGrey.withOpacity(.15),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Obx(() => TextFormField(
                  obscureText: controller.obscureText.value,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: FontSize.s14,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => controller.changeObscureValue(),
                      icon: Icon(controller.obscureText.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    ),
                    fillColor: ColorManager.primaryGrey.withOpacity(.15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                )),
            const Spacer(),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(fontSize: FontSize.s12),
                )),
            GradientButton(
              text: 'Login',
              onTap: () {},
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
