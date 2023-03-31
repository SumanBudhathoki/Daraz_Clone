import 'package:get/get.dart';

import '../controllers/connectivity_controller.dart';

class ConnectivityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectivityController>(
      () => ConnectivityController(),
    );
  }
}
