import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/getAllProductApi.dart';
import 'package:dio/dio.dart' as dio;

class SearchProductController extends GetxController {
  var listScrollController = ScrollController().obs;

  var productList = <GetAllProductModel>[].obs;

  var searchController = TextEditingController();
  var searchProduct = "".obs;
  var totalPage = 1.obs;
  var page = 1.obs;
  var isPageLoad = false.obs;
  var isLoadPage = false.obs;

  @override
  void onInit() {
    print("listenerrr");
    listScrollController.value.addListener(() {
      if (listScrollController.value.position.pixels == listScrollController.value.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    allProductApi(searchProduct.value);
    super.onInit();
  }

  // pagination

  listScrollListener() {
    print("listenerrr");
    listScrollController.value.addListener(() {
      if (listScrollController.value.position.pixels ==
          listScrollController.value.position.maxScrollExtent) {
        isPageLoad.value = true;

        loadNextPage();
      }
    });
  }

  void loadNextPage() {
    isPageLoad.value = false;
    print("loadNextPage");
    if (totalPage.value != page.value) {
      isPageLoad.value = true;
      page.value = page.value + 1;
      print("loadNextPage>>>>${page.value}");
      productList.refresh();
      allProductApi(searchProduct.value);
    } else {
      isPageLoad.value = false;
    }
  }

//  ****** all product list

  allProductApi(value) async {
    isLoadPage.value = true;
    // isLoadPage.value=true;
    try {
      dio.FormData params = dio.FormData.fromMap({
        'keyword': searchProduct.value.toString(),
        'page': page.value.toString(),
        'per_page': "10",
      });
      GetAllProductApi getAllProductModel = await ApiProvider.base().funGetAllProduct(params);
      isLoadPage.value = false;
      // progressDialog.dismiss();
      print('get all product');
      print(getAllProductModel.result);
      if (getAllProductModel.result == 1) {
        productList.value = getAllProductModel.data!.data!;
        // successToast(getAllProductModel.msg!);
        totalPage.value = getAllProductModel.data!.lastPage!;
        // destinationList.value = getDestinationModel.data!.data!;
        //
        // for (var i = 0; i < getAllProductModel.data!.data!.length; i++) {
        //   productList.value.add(getAllProductModel.data!.data![i]);
        // }
        print("lengthhh>>>>${productList.length}");
        print("totalPage.value>>>>${totalPage.value}");

        // Get.back();
      } else {
        // successToast(getAllProductModel.msg!);
        isLoadPage.value = false;
        // failedToast(userBean.msg!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      isLoadPage.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isLoadPage.value = false;
      // failedToast(exception.toString());
    }
  }




  @override
  void dispose() {
    listScrollController.value.dispose();
    super.dispose();
  }
}
