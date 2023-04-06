import 'package:daraz_clone_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  late FirebaseAuth _firebaseAuth;

  @override
  // ignore: overridden_fields
  int? priority = 0;

  AuthMiddleware({required this.priority}) {
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  RouteSettings? redirect(String? route) {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser == null) {
      return const RouteSettings(name: Routes.LOGIN);
    }
    return null;
  }
}
