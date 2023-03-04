import 'package:daraz_clone_app/app/data/models/onboarding.dart';
import 'package:daraz_clone_app/app/utils/assets_manager.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  List<Onboarding> onboardingPages = [
    Onboarding(ImageAssets.onBoarding1),
    Onboarding(ImageAssets.onBoarding2),
    Onboarding(ImageAssets.onBoarding3),
    Onboarding(ImageAssets.onBoarding4),
    Onboarding(ImageAssets.onBoarding5),
  ];

  RxInt index = 0.obs;
}
