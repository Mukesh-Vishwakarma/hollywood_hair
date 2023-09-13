import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'booking/booking_screen.dart';
import 'cart_screen/cart_screen.dart';
import 'home_screen/home_screen.dart';
import 'profile/profile_screen.dart';


class BaseHomeController extends GetxController {
  var selectedIndex = 0.obs;
  var baseChildren = <Widget>[].obs;

  var totalMessageCount = "0".obs;



  @override
  void onInit() {
    var screenType = Get.arguments["screenType"]??"";
    print("screenType>>>$screenType");
    if(screenType =="product details"){
      selectedIndex.value = 3;
    }

    baseChildren.value = [
      HomeScreen(),
      BookingScreen(),
      ProfileScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    super.onInit();
  }

  onItemSelect(index) {
    selectedIndex.value = index;
    refresh();
  }


}
