import 'package:get/get.dart';

import '../../../data/models/products.dart';

class ProductPageController extends GetxController {
  Products? product;

  @override
  void onInit() {
    product = Get.arguments["product"];
    super.onInit();
  }
}
