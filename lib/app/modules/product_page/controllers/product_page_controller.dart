import 'package:get/get.dart';

import '../../../data/models/products.dart';

class ProductPageController extends GetxController {
  RxInt tabIndex = 0.obs;
  Product? product;

  @override
  void onInit() {
    product = Product.fromJson(Get.arguments["product"]);
    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
