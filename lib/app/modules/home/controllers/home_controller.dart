import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 0.obs; //For indexed stack
  RxBool visible = true.obs;
  @override
  void onInit() {
    super.onInit();
  }

  setVisiblity(val) {
    visible.value = val;
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onClose() {
    super.onClose();
  }
}
