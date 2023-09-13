import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:dio/dio.dart' as dio;

class ChangePasswordController extends GetxController {


  final formLoginKey = GlobalKey<FormState>();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var oldPasswordVisible = true.obs;
  var newPasswordVisible = true.obs;
  var confirmPasswordVisible = true.obs;

  var oldPassword = "".obs;
  var newPassword = "".obs;
  var confirmPassword = "".obs;

  var userId = "".obs;
  var isPageLoad = false.obs;




  //  ****** change password

  changePasswordApi() async {
    isPageLoad.value = true;
    userId.value = GetStorage().read(AppConstants.userId)??"";

    print("customer_id>>>>>${userId.value}");
    print("New password>>>>>${newPassword.value}");
    print("old password>>>>>${oldPassword.value}");
    print("confirm password>>>>>${confirmPassword.value}");
    try {

      dio.FormData params = dio.FormData.fromMap({
        'customer_id':userId.value.toString(),
        'old_password':oldPassword.value,
        'new_password':newPassword.value.toString(),
        'confirm_password':confirmPassword.value.toString()
      });
      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funChangePassword(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == 1) {
        successToast(baseModel.message!);


        Get.back();
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