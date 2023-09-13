import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

class ForgotScreenController extends GetxController {

  final formLoginKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
    var email ="".obs;
  var isPageLoad = false.obs;






  //  ****** otp verification

  otpApi() async {
    isPageLoad = true.obs;
    print("Email>>>>>${emailController.text}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_email':emailController.text.toString(),
      });
      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funLoginOtp(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == "1") {
        successToast(baseModel.message!);

        Get.toNamed(AppPages.otpScreen,arguments: {"email":emailController.text.toString(),"type":"forgot"});

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