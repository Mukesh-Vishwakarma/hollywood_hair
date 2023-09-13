import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {

var image = Assets.textImage;
var isFirstTime = ''.obs;

  @override
  void onInit() {

    super.onInit();
    switchScreen();
  }

switchScreen() async {
  isFirstTime.value = GetStorage().read(AppConstants.isLogged)??'';
  print("check is first time ${isFirstTime.value}");
  Future.delayed(Duration(seconds: 3), () {
    //      Get.toNamed(AppPages.baseScreen,arguments: {"screenType":"product details"});
    return isFirstTime.value=='true'
        ? Get.offNamed(AppPages.baseScreen,arguments: {"screenType":"splash screen"}
    )
        : Get.offNamed(AppPages.signInScreen);
  });

}
}