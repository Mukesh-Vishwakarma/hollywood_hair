import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/model/get_all_product_list_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart' as http;

class AllProductController extends GetxController
    with GetTickerProviderStateMixin {
  var searchController = TextEditingController();

  var productList = <GetAllProductData>[].obs;
  var isPageLoad = true.obs;
  var cateName = "".obs;
  var cateId = "".obs;

  @override
  void onInit() {
    cateName.value = Get.arguments['categoryName'] ?? "";
    cateId.value = Get.arguments['categoryId'] ?? "";

    allProductApi();

    // TODO: implement onInit
    super.onInit();
  }

  //  ****** all product list

  allProductApi() async {
    try {
     GetAllProductModel getAllProductModel = await ApiProvider.shopify().funProductListShopify(cateId.value,);

      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(getAllProductModel.products);
      productList.value = getAllProductModel.products!;
      print("length product list >>> ${productList.length}");

    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }


}
