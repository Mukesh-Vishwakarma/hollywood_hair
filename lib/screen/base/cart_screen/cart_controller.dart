import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/shopify_model/get_cart_model.dart';


class CartController extends GetxController with GetTickerProviderStateMixin {
  var promoCodeController = TextEditingController();
  var cartList = <CartData>[].obs;
  var cardModel = GetCartModel().obs;



  var quantity = 1.obs; // Initialize with a default quantity

   incrementQuantity(index){
    quantity.value = index;

    return quantity.value++;

  }
  price(value){
     quantity.value = value;
     return quantity.value.toString();

  }


   decrementQuantity(index) {
    quantity.value = index;
    if (quantity.value > 1) {

      return quantity.value--;

    }
  }

  @override
  void onInit() {
    getCartApi();
    super.onInit();
  }

  getCartApi() async {
    print('create Data');
    try {
      GetCartModel getCartModel = await ApiProvider.shopifyWithToken().funGetToCart();
      cardModel.value = getCartModel;
      // isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(getCartModel.items!.length);
      cartList.value = getCartModel.items!;
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

class CartModel {
  String image, price, title, qun;
  int number;

  CartModel(
      {required this.image,
      required this.price,
      required this.title,
      required this.qun,
      required this.number});
}
