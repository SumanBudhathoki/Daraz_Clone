import 'package:carousel_slider/carousel_slider.dart';
import 'package:daraz_clone_app/app/modules/homescreen/views/widgets/category.dart';
import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/assets_manager.dart';
import '../../../utils/font_manager.dart';
import '../../../utils/style_manager.dart';
import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  final HomescreenController controller = Get.put(HomescreenController());
  final LoginController logincontroller = Get.put(LoginController());
  final expandedHeight = 70.h;
  HomescreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        Obx(
          () => SliverAppBar(
            expandedHeight: expandedHeight,
            pinned: true,
            backgroundColor: controller.isAppBarExpanded.value
                ? Colors.white
                : Colors.grey.withOpacity(.2),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(IconAssets.scanner),
                  width: 25.w,
                  height: 25.h,
                ),
                Text("Scan", style: smallText()),
              ],
            ),
            title: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                  color: ColorManager.primaryWhite,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image(
                    image: const AssetImage(IconAssets.search),
                    width: 25.w,
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'old durbar 750 ml',
                    style: TextStyle(
                        color: ColorManager.primaryGrey,
                        fontSize: FontSize.s16),
                  )
                ],
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  logincontroller.signOut();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: const AssetImage(IconAssets.gem),
                      width: 25.w,
                      height: 25.h,
                    ),
                    Text(
                      'Gems',
                      style: smallText(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        ),
        // const SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: 5,
        //   ),
        // ),
        _buildCarousel(),
        _setLocation(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 25.h,
          ),
        ),
        _category(),
        Images(),
      ],
    );
  }

  Widget _buildCarousel() {
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
        itemCount: controller.images.length,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: controller.images[index],
              ),
              Positioned(
                bottom: 25.h,
                left: 0,
                right: 0,
                child: DotIndicator(
                  itemCount: controller.images.length,
                  currentIndex: controller.currentPage.value,
                  activeColor: ColorManager.primaryWhite,
                  inactiveColor: ColorManager.primaryGrey,
                  spacing: 8,
                ),
              )
            ],
          );
        },
        options: CarouselOptions(
          height: 150.h,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 4 / 3,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.94,
          onPageChanged: (int page, CarouselPageChangedReason reason) {
            controller.currentPage.value = page;
          },
        ),
      ),
    );
  }

  Widget _category() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Category(
            image: ImageAssets.mart,
            title: 'Mart',
            onTap: () {},
          ),
          Category(
            image: ImageAssets.fashion,
            title: 'Fashion',
            onTap: () {},
          ),
          Category(
            image: ImageAssets.beauty,
            title: 'Beauty',
            onTap: () {},
          ),
          Category(
            image: ImageAssets.proudlyNepali,
            title: 'Proudly Nepali',
            onTap: () {},
          ),
          Category(
            image: ImageAssets.under499,
            title: 'Under 499',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _setLocation() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        decoration: BoxDecoration(
          color: ColorManager.primaryWhite,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0, // soften the shadow
              // spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                0.0, // Move to right 5  horizontally
                2.0, // Move to bottom 5 Vertically
              ),
            )
          ],
        ),
        child: Row(children: [
          Icon(
            Icons.location_pin,
            color: ColorManager.primaryOrange,
          ),
          Text('  |     Set your location'),
        ]),
      ),
    );
  }
}

// For dot in the carousel slider
class DotIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double spacing;

  DotIndicator({
    required this.itemCount,
    required this.currentIndex,
    this.activeColor = Colors.black,
    this.inactiveColor = Colors.grey,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing / 2),
          child: Container(
            width: currentIndex == index ? 30 : 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: currentIndex == index ? activeColor : inactiveColor,
            ),
          ),
        ),
      ),
    );
  }
}

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 29,
          ),
          Container(
            color: Colors.red,
            width: Get.width,
            height: 200,
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            color: Colors.yellow,
            width: Get.width,
            height: 200,
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            color: Colors.blue,
            width: Get.width,
            height: 200,
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            color: Colors.green,
            width: Get.width,
            height: 200,
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            color: Colors.green,
            width: Get.width,
            height: 200,
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            color: Colors.green,
            width: Get.width,
            height: 200,
          ),
          SizedBox(
            height: 29,
          ),
          Container(
            color: Colors.green,
            width: Get.width,
            height: 200,
          ),
        ],
      ),
    );
  }
}
