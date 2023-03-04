import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Daraz Clone",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Widget build(BuildContext context) {
  return ScreenUtilInit(
    designSize: const Size(1080, 2340),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (BuildContext context, Widget? child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Daraz Clone",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    },
    // child:
  );
}
