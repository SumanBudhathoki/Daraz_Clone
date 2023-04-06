import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:daraz_clone_app/app/modules/products/controllers/products_controller.dart';
import 'package:daraz_clone_app/app/utils/assets_manager.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:daraz_clone_app/app/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/style_manager.dart';
import '../controllers/product_page_controller.dart';

class ProductPageView extends GetView<ProductPageController> {
  final int id;
  final productController = Get.put(ProductsController());
  final productPageController = Get.put(ProductPageController());
  ProductPageView({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryWhite,
        elevation: 2,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: ColorManager.primaryGrey,
          ),
          onPressed: () => Get.back(),
        ),
        title: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Image.asset(
                IconAssets.search,
                width: 20.w,
                color: Colors.grey.shade700,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Search in Daraz',
                style: getProductSubtitle(
                    fontSize: FontSize.s16, color: ColorManager.primaryGrey),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
                color: ColorManager.primaryBlack,
                iconSize: 20,
              ),
              Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 5,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.primaryOrange,
                      maxRadius: 8.r,
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: FontSize.s12),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                    color: ColorManager.primaryBlack,
                    iconSize: 20,
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    right: 5,
                    top: 5,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.primaryOrange,
                      maxRadius: 8.r,
                      child: Text(
                        "4",
                        style: TextStyle(fontSize: FontSize.s12),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 20,
                      color: ColorManager.primaryBlack,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  width: Get.width,
                  height: 400.h,
                  child: CachedNetworkImage(
                      imageUrl: productController.productList[id - 1]['image']),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // "Box Cargo Pants for Men",
                              productController.productList[id - 1]['title'],
                              style:
                                  getProductTitleStyle(fontSize: FontSize.s18),
                            ),
                            SizedBox(height: 10.h),
                            RichText(
                              text: TextSpan(
                                  text: "Rs. ",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: FontSize.s18,
                                      fontWeight: FontWeight.bold),
                                  children: [
                                    TextSpan(
                                      // text: "2,000\t\t",
                                      text:
                                          "${productController.productList[id - 1]["price"]}\t\t",
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: FontSize.s24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text:
                                          "Rs ${productController.productList[id - 1]["price"] + 92}",
                                      style: TextStyle(
                                          color: ColorManager.primaryGrey,
                                          fontSize: FontSize.s14,
                                          fontWeight: FontWeight.normal,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ]),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.orange.withAlpha(20),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(children: [
                                Icon(
                                  Icons.discount_outlined,
                                  color: ColorManager.primaryOrange,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Up to Rs.200 off",
                                  style: getProductPriceStyle(
                                      fontSize: FontSize.s18,
                                      color: ColorManager.primaryOrange),
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "6 Vouchers",
                                      style: getProductPriceStyle(
                                          fontSize: FontSize.s18,
                                          color: ColorManager.primaryOrange),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: ColorManager.primaryOrange,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ]),
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                                  Text(
                                    "${productController.productList[id - 1]['rating']['rate']}/5(${productController.productList[id - 1]['rating']['count']})\t",
                                    style: TextStyle(fontSize: FontSize.s16),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: ColorManager.primaryGrey,
                                    size: 20,
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.favorite_outline_outlined,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "6",
                                    style: TextStyle(fontSize: FontSize.s16),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  color: Colors.cyan.withAlpha(20),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(children: [
                                const Icon(
                                  Icons.delivery_dining_outlined,
                                  color: Color(0xff1a9cb7),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Standard Delivery 9 Apr",
                                  style: getProductPriceStyle(
                                      fontSize: FontSize.s18,
                                      color: const Color(0xff1a9cb7)),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Color(0xff1a9cb7),
                                  size: 20,
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                  // color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Row(children: [
                                Icon(
                                  Icons.question_answer_outlined,
                                  color: ColorManager.secondaryBlack,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "5 product questions and answers.",
                                  style: getProductPriceStyle(
                                          fontSize: FontSize.s18,
                                          color: ColorManager.secondaryBlack)
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: ColorManager.secondaryBlack,
                                  size: 20,
                                ),
                              ]),
                            ),
                            const Divider(
                              indent: 10,
                              endIndent: 10,
                              height: 2,
                            ),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          height: 50,
          width: double.infinity,
          // color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: const EdgeInsets.only(top: 4),
                onPressed: () {},
                icon: Column(
                  children: [
                    Icon(
                      Icons.store_mall_directory_outlined,
                      color: ColorManager.primaryOrange,
                    ),
                    Text(
                      'Shop',
                      style: TextStyle(
                          fontSize: FontSize.s12,
                          color: ColorManager.primaryGrey),
                    ),
                  ],
                ),
              ),
              Container(
                height: 28.h,
                width: 1,
                color: ColorManager.primaryGrey,
              ),
              IconButton(
                padding: const EdgeInsets.only(top: 4),
                onPressed: () {},
                icon: Column(
                  children: [
                    Icon(
                      Icons.chat,
                      color: ColorManager.primaryOrange,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                          fontSize: FontSize.s12,
                          color: ColorManager.primaryGrey),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Colors.orange, Colors.orangeAccent],
                      stops: [0.2, 2],
                    ),
                  ),
                  child: Text(
                    'Buy Now',
                    style: getTextButtonStyle(fontSize: FontSize.s16),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [ColorManager.primaryOrange, Colors.red],
                      stops: const [0.2, 2],
                    ),
                  ),
                  child: Text(
                    'Add to Cart',
                    style: getTextButtonStyle(fontSize: FontSize.s16),
                  ),
                ),
              ),
            ],
          ),
        ),
        //
      ],
    );
  }
}
