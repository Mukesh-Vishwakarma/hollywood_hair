import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/product_by_id_model.dart';
import 'package:hollywood_hair/model/shopify_model/add_cart_model.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

class ProductDetailsController extends GetxController {
  var current = 0.obs;
  final CarouselController controller = CarouselController();
  var imageProductList = <Images>[].obs;
  var productDetailsList = <ProductData>[].obs;

  // var productReviewsList = <Review>[].obs;
  var productDetails = ProductDetailsModel().obs;

  var productId = "".obs;
  var varientId = 0.obs;

  @override
  void onInit() {
    productId.value = Get.arguments['product_id'] ?? "";
    print("product id >>> ${productId.value}");
    productDetailsApi();
    super.onInit();
  }

  late List<Widget> imageSliders = imageProductList.value
      .map((item) => Stack(
            children: <Widget>[
              Image.network(
                item.src.toString(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 320,
              ),
            ],
          ))
      .toList()
      .obs;

  // ******* add to cart

  addToCart() async {
    try {
      dio.FormData params = dio.FormData.fromMap({'id': varientId.value, 'quantity': "1"});

      AddCartModel addCartModel = await ApiProvider.shopifyCustomer().funAddToCart(params);
      print("add to cart product >>>> ${addCartModel.quantity.toString()}");

      Get.offAllNamed(AppPages.baseScreen,arguments: {"screenType": "product details"});
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      // isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      // isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }

  //  ****** product Details api

  productDetailsApi() async {
    try {
      dio.FormData params = dio.FormData.fromMap({
        'product_id': productId.value.toString(),
      });
      print('product data by id');
      print(params.fields.toString());
      ProductDetailsModel productDetailsModel =
          await ApiProvider.shopify().funProductDetailsShopify(productId.value);
      // isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      if (productDetailsModel.product?.variants != null) {
        varientId.value = productDetailsModel.product?.variants?[0].id ?? "";
      }
      print("product varient id >>>$varientId");
      // print(productDetailsModel.product!.variants[].id);
      // if (productByIDModel.product) {
      imageProductList.value = productDetailsModel.product!.images!;

      productDetails.value = productDetailsModel;
      // productReviewsList.value = productByIDModel.data!.review!;
      // print("productReviewsList >>>${productReviewsList.length}");

      // Get.back();
      // } else {
      //   // isPageLoad.value = false;
      //   // failedToast(userBean.msg!);
      // }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      // isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      // isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }
}
