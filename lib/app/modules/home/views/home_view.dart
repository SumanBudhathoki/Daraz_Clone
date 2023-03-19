import 'package:daraz_clone_app/app/database/main_storage.dart';
import 'package:daraz_clone_app/app/modules/login/controllers/login_controller.dart';
import 'package:daraz_clone_app/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                Get.to(() => LoginView());
              },
              child: const Text("login"),
            ),
          ),
          Text("${MainStorage.readOnboarding}"),
          Center(
            child: TextButton(
              onPressed: () {
                loginController.signOut();
                // Get.to(() => LoginView());
              },
              child: const Text("Logout"),
            ),
          ),
        ],
      ),
    );
  }
}
