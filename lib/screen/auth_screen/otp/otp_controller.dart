import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/model/shopify_model/loginModel.dart';
import 'package:hollywood_hair/model/shopify_model/signUp_model.dart';
import 'package:hollywood_hair/model/user_model.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

class OtpController extends GetxController {
  TextEditingController otpController = TextEditingController();
  Duration myDuration = const Duration(minutes: 1);

  var contactNumber = "".obs;

  Timer? timer;

  var time = '02:00'.obs;

  var isResend = false.obs;
  var currentText = "".obs;
  var otpCode = "".obs;
  var email = "".obs;
  var password = "".obs;
  var phoneNumber = "".obs;
  var screenType = "".obs;
  var remainingSeconds = 0;
  var isPageLoad = false.obs;

  // @override
  // void onReady() {
  //   startTimer();
  //   super.onReady();
  // }

  @override
  void onInit() {
    email.value = Get.arguments["email"] ?? "";
    screenType.value = Get.arguments["type"] ?? "";
    password.value = Get.arguments["password"] ?? "";
    phoneNumber.value = Get.arguments["phoneNumber"] ?? "";
    print("emailll>>>>${email.value}");
    print("screen type>>>>${screenType.value}");
    print("password>>>>${password.value}");
    print("phoneNumber>>>>${phoneNumber.value}");
    startTimer(120);
    // contactNumber.value = Get.arguments['phone_number'] ?? "";
    super.onInit();
  }

  startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        isResend.value = true;
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value =
            "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";

        isResend.value = false;
        remainingSeconds--;
      }
    });
  }

  void setCountDown() {
    final reduceSecondsBy = 1;

    final seconds = myDuration.inSeconds - reduceSecondsBy;
    if (seconds < 0) {
      timer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
  }

  void stopTimer() {
    timer!.cancel();
  }

  //***** resend api
  resendApi() async {
    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_email': email.value.toString(),
      });

      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funLoginOtp(params);
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == "1") {
        successToast(baseModel.message!);
      } else {
        successToast(baseModel.message!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      // failedToast(exception.toString());
    }
  }

  //***** verify  api

  verifyApi() async {
    isPageLoad = true.obs;

    try {
      dio.FormData params = dio.FormData.fromMap(
          {'customer_email': email.value, 'otp': otpCode.value});
      print('create Data');
      print(params.toString());
      UserModel userModel = await ApiProvider.base().funOtpVerification(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(userModel.result);
      if (userModel.result == "1") {
        successToast(userModel.message!);
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

        if (screenType.value == "signUp") {
          signUpApiShopify();
          await GetStorage().write(AppConstants.isLogged, 'true');

          Get.offAllNamed(AppPages.baseScreen);
        } else {
          Get.offNamed(AppPages.newPasswordScreen);
        }
      } else {
        successToast(userModel.message!);
      }
    } on HttpException catch (exception) {
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print(exception.message);

      // failedToast(exception.message);
    } catch (exception) {
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print(exception.toString());
      // failedToast(exception.toString());
    }
  }

  @override
  void dispose() {
    otpController.clear();
    print("anything");
    super.dispose();
  }

  //   ****** api login with shopify

  signUpApiShopify() async {
    var userName = await GetStorage().read(AppConstants.userName);
    //mutation customerCreate($input: CustomerCreateInput!)
    // { customerCreate(input: $input) { customer
    // { firstName lastName email phone acceptsMarketing }
    // customerUserErrors { field message code } } }

    try {
      final Map<String, dynamic> requestBody = {
        'query':
            "mutation customerCreate(\$input: CustomerCreateInput!){ customerCreate(input:\$input) { customer { firstName lastName email phone acceptsMarketing } customerUserErrors { field message code } } }",
        'variables': {
          'input': {
            'firstName': userName.toString(),
            'lastName': '',
            'email': email.value.toString(),
            'phone': phoneNumber.value.toString(),
            'password': password.value.toString(),
            'acceptsMarketing': true,
          },
        }
      };
      print("signUp params");
      print(jsonEncode(requestBody));
      SignUpModel signUpModel = await ApiProvider.shopifyStorefront().funSignUpShopify(requestBody);
      isPageLoad.value = false;
      print("signUpModel >>>> ${signUpModel.data!.customerCreate!.customer}");

      if (signUpModel.data!.customerCreate!.customer != null) {
        successToast("SignUp SuccessFull");
        Get.offAllNamed(AppPages.baseScreen);
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
