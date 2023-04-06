import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../product_page/views/product_page_view.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProductPageView();
  }
}
