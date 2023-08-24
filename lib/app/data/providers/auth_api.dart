import 'dart:convert';
import 'dart:developer';

import 'package:daraz_clone_app/app/utils/constant/api_path.dart';
import 'package:dio/dio.dart';

class AuthApi {
  final Dio dio = Dio();
  Future<dynamic> loginWithEmail(
      {required String username, required String password}) async {
    try {
      final response = await dio.post(ApiPath.loginWithUsername,
          data: {"username": username, "password": password});
      log("Logging:::::${response.statusCode}:::::${response.data}");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      log("Error while logging:::::$e");
      return false;
    }
  }
}
