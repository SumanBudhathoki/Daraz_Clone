import 'package:daraz_clone_app/app/modules/product_page/views/product_page_view.dart';
import 'package:daraz_clone_app/app/modules/products/views/widgets/single_product.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
              ? getShimmerLoading()
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
                      onTap: () {
                        Get.to(
                          () => ProductPageView(),
                          arguments: {"product": controller.productList[index]},
                        );
                      },
                    );
                  })),
        ],
      ),
    );
  }

  // Shimmer loading while fetching data from the api
  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.6,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200.w,
                    height: 200.h,
                    color: Colors.white,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 190.w,
                              height: 15.h,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Container(
                              width: 190.w,
                              height: 15.h,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 70.w,
                              height: 15.h,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 15.h,
                              color: Colors.white,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}
