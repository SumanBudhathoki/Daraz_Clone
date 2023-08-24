import 'package:daraz_clone_app/app/data/models/onboarding.dart';
import 'package:daraz_clone_app/app/utils/constant/assets_manager.dart';
import 'package:get/get.dart';
import '../../../database/main_storage.dart';
import '../../../routes/app_pages.dart';

class OnboardingController extends GetxController {
  List<Onboarding> onboardingPages = [
    Onboarding(ImageAssets.onBoarding1),
    Onboarding(ImageAssets.onBoarding2),
    Onboarding(ImageAssets.onBoarding3),
    Onboarding(ImageAssets.onBoarding4),
    Onboarding(ImageAssets.onBoarding5),
  ];

  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void skipTextButton() {
    MainStorage.saveOnboarding(false);
    Get.offAllNamed(Routes.HOME);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
