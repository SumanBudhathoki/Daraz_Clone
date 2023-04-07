import 'package:get/get.dart';

import '../../../data/models/products.dart';

class ProductPageController extends GetxController {
  Product? product;

  @override
  void onInit() {
    product = Product.fromJson(Get.arguments["product"]);
    super.onInit();
  }
}
