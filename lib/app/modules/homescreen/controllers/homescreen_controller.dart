import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/assets_manager.dart';

class HomescreenController extends GetxController {
  RxBool isAppBarExpanded =
      false.obs; //For changing the color of appBar when scrolling
  late ScrollController scrollController = ScrollController();
  RxInt currentPage = 0.obs; //For carousel slider

  // Images for Carousel
  List<Widget> images = [
    Image.asset(
      ImageAssets.carousel1,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.carousel2,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.carousel3,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.carousel4,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.carousel5,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.carousel6,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.carousel7,
      fit: BoxFit.fill,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset >= 40.h) {
        isAppBarExpanded.value = true;
      } else {
        isAppBarExpanded.value = false;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
