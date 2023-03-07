import 'package:daraz_clone_app/app/data/models/onboarding.dart';
import 'package:daraz_clone_app/app/utils/assets_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  List<Onboarding> onboardingPages = [
    Onboarding(ImageAssets.onBoarding1),
    Onboarding(ImageAssets.onBoarding2),
    Onboarding(ImageAssets.onBoarding3),
    Onboarding(ImageAssets.onBoarding4),
    Onboarding(ImageAssets.onBoarding5),
  ];
  final box = GetStorage(); //Initialization of getStorage
  RxInt selectedIndex = 0.obs;
  final RxBool _showOnboarding = true.obs;

  bool get onBoarding => _showOnboarding.value;

  @override
  void onInit() {
    super.onInit();
    _checkOnboardingStatus();
  }

  // Check whether to show onBoarding or not. If hasCompletedOnboarding false then show onboarding else not.
  void _checkOnboardingStatus() {
    bool hasCompletedOnboarding = box.read('hasCompletedOnboarding') ?? false;
    _showOnboarding.value = !hasCompletedOnboarding;
  }

  // Complete onboarding and set the storage variable showonboarding to false
  void completeOnboarding() {
    box.write('hasCompletedOnboarding', true);
    _showOnboarding.value = false;
  }
}
