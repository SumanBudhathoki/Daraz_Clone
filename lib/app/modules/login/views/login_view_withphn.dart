import 'package:daraz_clone_app/app/widgets/gradient_button.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:daraz_clone_app/app/utils/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/assets_manager.dart';
import '../controllers/login_controller.dart';

class LoginViewWithPhn extends StatelessWidget {
  LoginViewWithPhn({Key? key}) : super(key: key);
  LoginController controller = Get.put(LoginController());

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
        child: Form(
          // key: controller.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What\'s your mobile number?',
                style: TextStyle(
                    fontSize: FontSize.s26, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextFormField(
                controller: controller.phoneNumberController,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: IntrinsicWidth(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(ImageAssets.nepalFlag),
                          SizedBox(
                            width: 15.w,
                          ),
                          const Text("+977"),
                          SizedBox(
                            width: 15.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                  filled: true,
                  hintText: 'Enter your mobile number',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w200,
                  ),
                  fillColor: ColorManager.primaryGrey.withOpacity(.15),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                validator: (value) {
                  return controller.validatePhone(value!);
                },
              ),
              const Spacer(),
              GradientButton(
                text: 'Next',
                onTap: () {
                  controller.verifyPhoneNumber();
                },
                gradient: LinearGradient(
                  colors: [ColorManager.primaryOrange, Colors.orangeAccent],
                  stops: const [0.2, 2],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
