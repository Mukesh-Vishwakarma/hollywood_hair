import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/shopify_model/loginModel.dart';
import 'package:hollywood_hair/model/shopify_model/signUp_model.dart';
import 'package:hollywood_hair/model/user_model.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/util/route/app_pages.dart';

class SignInController extends GetxController {
  final formLoginKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var passwordVisible = true.obs;
  var isPageLoad = false.obs;

  var email = "".obs;
  var password = "".obs;

  //****** api login
  loginApi() async {
    isPageLoad.value = true;

    print("Email>>>>>${emailController.text}");
    print("Password>>>>>${passwordController.text}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_email': emailController.text.toString(),
        'password': passwordController.text.toString(),
      });

      print('create Data');
      print(params.toString());
      UserModel userModel = await ApiProvider.base().funLogin(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(userModel.result);
      if (userModel.result == "1") {
        successToast(userModel.message!);
        await GetStorage().write(AppConstants.isLogged, 'true');
        print("UserIddd");
        print(userModel.data?.customerId);
        await GetStorage().write(
            AppConstants.userId, userModel.data?.customerId.toString() ?? "");
        await GetStorage().write(AppConstants.loginUser, userModel.data);
        await GetStorage()
            .write(AppConstants.accessToken, userModel.data?.token);
        await GetStorage()
            .write(AppConstants.userName, userModel.data?.customerName);
        await GetStorage()
            .write(AppConstants.profileImage, userModel.data?.profileImage);
        await GetStorage()
            .write(AppConstants.email, userModel.data?.customerEmail);
        await GetStorage().write(
            AppConstants.phoneNumber, userModel.data?.customerPhone.toString());
        await GetStorage().write(AppConstants.phoneCode,
            userModel.data?.customerCountryCode.toString());
        loginApiShopify();

        // Get.back();
      } else {
        // isPageLoad.value = false;
        // failedToast(userBean.msg!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      // isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }

//   ****** api login with shopify

  loginApiShopify() async {
    try {
      final Map<String, dynamic> requestBody = {
        'query':
            "mutation customerAccessTokenCreate(\$input: CustomerAccessTokenCreateInput!) { customerAccessTokenCreate(input: \$input) { customerAccessToken { accessToken } customerUserErrors { message } } }",
        "variables": {
          "input": {
            "email": emailController.text.toString(),
            "password": passwordController.text.toString(),
          }
        }
      };

      LoginModel loginModel =
          await ApiProvider.shopifyStorefront().funLoginShopify(requestBody);
      isPageLoad.value = false;
      print(
          "loginModelll>>>> ${loginModel.data!.customerAccessTokenCreate!.customerAccessToken}");

      if (loginModel.data!.customerAccessTokenCreate!.customerAccessToken != null) {
        await GetStorage().write(AppConstants.tokenShopify, loginModel.data!.customerAccessTokenCreate!.customerAccessToken!.accessToken);

        successToast("Login SuccessFull");
        Get.offAllNamed(AppPages.baseScreen,
            arguments: {"screenType": "login screen"});
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
