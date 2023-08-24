import 'dart:developer';

import 'package:daraz_clone_app/app/data/models/products.dart';
import 'package:daraz_clone_app/app/data/providers/product_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  RxList<Products> productList = <Products>[].obs;
  @override
  void onInit() {
    fetchApiData();
    super.onInit();
  }

  void fetchApiData() async {
    isLoading.value = true;
    var products = await ProductServices().getProducts();

    if (products == null || products == false) {
      Get.showSnackbar(const GetSnackBar(
        title: 'There has been some problem loading data.',
        icon: Icon(Icons.dangerous_outlined),
      ));
    } else {
      productList.value = products;
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
