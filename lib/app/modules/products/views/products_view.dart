import 'package:daraz_clone_app/app/data/models/products.dart';
import 'package:daraz_clone_app/app/modules/products/views/widgets/single_product.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/style_manager.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  ProductsView({Key? key}) : super(key: key);
  final productController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              'Just For You',
              style: getProductTitleStyle(fontSize: FontSize.s20),
            ),
          ),
          Obx(() => controller.isLoading.value == true
              ? const CircularProgressIndicator()
              : GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.productList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (context, index) {
                    return SingleProductView(
                      imageUrl: controller.productList[index]["image"],
                      productTitle: controller.productList[index]["title"],
                      price: controller.productList[index]["price"],
                      rating: controller.productList[index]["rating"]["rate"],
                      ratingCount: controller.productList[index]["rating"]
                          ["count"],
                    );
                  })),
        ],
      ),
    );
  }
}
