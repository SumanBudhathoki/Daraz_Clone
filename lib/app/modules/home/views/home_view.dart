import 'dart:math';

import 'package:daraz_clone_app/app/modules/account/views/account_view.dart';
import 'package:daraz_clone_app/app/modules/cart/views/cart_view.dart';
import 'package:daraz_clone_app/app/modules/connectivity/controllers/connectivity_controller.dart';
import 'package:daraz_clone_app/app/modules/homescreen/views/homescreen_view.dart';
import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:daraz_clone_app/app/modules/login/views/login_view.dart';
import 'package:daraz_clone_app/app/modules/messages/views/messages_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/color_manager.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(HomeController());
  final loginController = Get.put(LoginController());
  final ConnectivityController _controller = Get.find<ConnectivityController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          body: _controller.connectionType.value == 0
              ? const Center(child: Text('No internet'))
              : IndexedStack(
                  index: controller.tabIndex.value,
                  children: [
                    HomescreenView(),
                    loginController.loggingStatus() == true
                        ? const MessagesView()
                        : Navigator(
                            onGenerateRoute: (settings) {
                              return PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 500),
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        LoginView(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  var begin = Offset(1.0, 0.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                              );
                            },
                          ),
                    loginController.logged.value
                        ? const CartView()
                        : LoginView(),
                    const AccountView(),
                  ],
                ),
          bottomNavigationBar: Obx(() {
            final isCartOrMessageView = controller.tabIndex.value == 1 ||
                controller.tabIndex.value == 2;
            if (!loginController.logged.value && isCartOrMessageView) {
              return const SizedBox(); // hide the bottom navigation bar
            } else {
              return buttomNavBar(); //dont hide size box
            }
          })),
    );
  }

  Widget buttomNavBar() {
    return BottomNavigationBar(
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
        ]);
  }
}
