import 'dart:convert';
import 'dart:developer';

import 'package:daraz_clone_app/app/data/models/products.dart';
import 'package:daraz_clone_app/app/utils/flavor/flavor_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductServices {
  final Dio dio = Dio();
  Future getProducts() async {
    try {
      var response = await dio.get(FlavorConfig.baseUrl);
      log("Getting product:::${response.statusCode}:::::${response.data}");
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        return jsonData
            .map((productData) => Products.fromMap(productData))
            .toList();
        // return response;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Error getting product=> $e");
      return false;
    }
  }
}
