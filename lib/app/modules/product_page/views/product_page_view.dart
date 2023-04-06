import 'package:daraz_clone_app/app/utils/assets_manager.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/style_manager.dart';
import '../controllers/product_page_controller.dart';

class ProductPageView extends GetView<ProductPageController> {
  const ProductPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryWhite,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.primaryGrey,
          ),
          onPressed: () => Get.back(),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Image.asset(
                IconAssets.search,
                width: 25.w,
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
              ),
              Stack(
                children: [
                  Positioned(
                    right: 2,
                    top: 2,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.primaryOrange,
                      maxRadius: 10.r,
                      child: const Text("1"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart_outlined),
                    color: ColorManager.primaryBlack,
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    right: 2,
                    top: 2,
                    child: CircleAvatar(
                      backgroundColor: ColorManager.primaryOrange,
                      maxRadius: 10.r,
                      child: const Text("4"),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      color: ColorManager.primaryBlack,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: Get.width,
            height: 450.h,
            child: Image.asset(
              ImageAssets.shoes,
              fit: BoxFit.contain,
            ),
          ),
          // Card(child: ,)
        ],
      ),
    );
  }
}
