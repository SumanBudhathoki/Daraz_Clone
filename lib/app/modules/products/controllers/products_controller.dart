import 'dart:developer';

import 'package:daraz_clone_app/app/data/providers/product_services.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var productList = [].obs;
  @override
  void onInit() {
    fetchApiData();
    super.onInit();
  }

  void fetchApiData() async {
    isLoading.value = true;
    var products = await ProductServices().getProducts();
    log('Products---------->$products');
    if (products.isNotEmpty) {
      productList.value = products;
    } else {
      // handle error
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    isLoading.close();
    productList.close();
    super.onClose();
  }
}
