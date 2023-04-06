import 'package:daraz_clone_app/app/database/main_storage.dart';
import 'package:daraz_clone_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// first time open
class OnboardingMiddleware extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 0;

  OnboardingMiddleware({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (MainStorage.readOnboarding == null) {
      return const RouteSettings(name: Routes.ONBOARDING);
    }
    return null;
  }
}
