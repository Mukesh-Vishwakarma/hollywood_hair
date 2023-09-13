import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:hollywood_hair/util/service/auth_service.dart';

class SignUpController extends GetxController {
  final formLoginKey = GlobalKey<FormState>();
  var authService = Get.find<AuthServices>();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var contactController = TextEditingController();

  var name = "".obs;
  var email = "".obs;
  var password = "".obs;
  var contact = "".obs;
  var countryCode = "+91".obs;

  var isPageLoad = false.obs;

  //****** api registration
  registrationApi() async {
    var deviceType = await authService.getDeviceType();
    isPageLoad.value = true;

    print("firstName>>>>>${nameController.text}");
    print("Email>>>>>${emailController.text}");
    print("Password>>>>>${passwordController.text}");
    print("deviceType>>>>>${deviceType.toString()}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        'firstname': nameController.text.toString(),
        'email': emailController.text.toString(),
        'device_type': deviceType.toString(),
        'device_id': '2',
        'password': passwordController.text.toString(),
      });

      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funRegister(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == "1") {
        successToast(baseModel.message!);
        otpApi();
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

//  ****** otp verification

  otpApi() async {
    print("Email>>>>>${emailController.text}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_email': emailController.text.toString(),
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

        Get.toNamed(AppPages.otpScreen, arguments: {
          "email": emailController.text.toString(),
          "type": "signUp",
          "password": passwordController.text.toString(),
          "phoneNumber":countryCode.value.toString()+contact.value.toString(),
        });

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
