 
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductServices {
  final Dio dio = Dio();
  Future<List<dynamic>> getProducts() async {
    try {
      var response = await dio.get('https://fakestoreapi.com/products');
      // log("Response=========>>>>$response");
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return [];
      }
    } catch (e) {
      debugPrint("Error getting product=> $e");
      return [];
    }
  }
}
