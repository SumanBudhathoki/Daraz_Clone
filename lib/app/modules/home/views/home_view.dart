import 'package:carousel_slider/carousel_slider.dart';
import 'package:daraz_clone_app/app/modules/account/views/account_view.dart';
import 'package:daraz_clone_app/app/modules/cart/views/cart_view.dart';
import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:daraz_clone_app/app/modules/messages/views/messages_view.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/assets_manager.dart';
import '../../../utils/style_manager.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var top = 0.0;
  var expandedHeight = 70.h;

  HomeView({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.tabIndex.value,
            children: [
              CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  // // Using OBX to change the color of the appbar when scrolling.
                  SliverAppBar(
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
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
                      Column(
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
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  _buildCarousel(),
                  Images(),
                ],
              ),
              MessagesView(),
              CartView(),
              AccountView(),
            ],
          )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: ColorManager.primaryOrange,
            unselectedItemColor: ColorManager.primaryGrey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: (index) {
              controller.changeTabIndex(index);
            },
            currentIndex: controller.tabIndex.value,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Account',
              ),
            ]),
      ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.images.length,
                    (index) => Container(
                      margin: const EdgeInsets.all(2),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red
                          // color: controller.selectedIndex.value == index
                          //     ? ColorManager.primaryWhite
                          //     : ColorManager.primaryGrey),
                          ),
                    ),
                  ),
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
