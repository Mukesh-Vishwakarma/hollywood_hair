import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

class NewPasswordController extends GetxController {
  final formLoginKey = GlobalKey<FormState>();

  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var newPasswordVisible = true.obs;
  var confirmPasswordVisible = true.obs;

  var newPassword = "".obs;
  var confirmPassword = "".obs;

  var userId = "".obs;
  var isPageLoad = false.obs;




  @override
  void onInit() {
    userId.value = GetStorage().read(AppConstants.userId).toString() ?? "";
    print("userID>>> ${userId.value}");
    super.onInit();
  }


  //  ****** change password

  newPasswordApi() async {

    print("New password>>>>>${newPassword.value}");
    print("confirm password>>>>>${confirmPassword.value}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_id':userId.value.toString(),
        'new_password':newPassword.value.toString(),
        'confirm_password':confirmPassword.value.toString()
      });
      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funNewPassword(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == 1) {
        successToast(baseModel.message!);

        Get.offAllNamed(AppPages.signInScreen);

        // Get.back();
      } else {
        successToast(baseModel.message!);
        // isPageLoad.value = false;
        // failedToast(userBean.msg!);
      }
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
