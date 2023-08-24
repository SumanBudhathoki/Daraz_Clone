import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/connectivity_controller.dart';

class ConnectivityView extends GetView<ConnectivityController> {
  ConnectivityView({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ConnectivityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConnectivityView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ConnectivityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
