import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sizer/sizer.dart';

import 'otp_controller.dart';

class OtpScreen extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(controller.myDuration.inDays);
    final hours = strDigits(controller.myDuration.inHours.remainder(24));
    final minutes = strDigits(controller.myDuration.inMinutes.remainder(60));
    final seconds = strDigits(controller.myDuration.inSeconds.remainder(60));

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: Image.asset(
                    Assets.back,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 50),
                child: Text(
                  "enter_otp".tr,
                  style: AppStyles.textStyle(
                      fontSize: dimen20, weight: FontWeight.w600),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  "enter_otp_des".tr,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle(
                      fontSize: dimen12,
                      color: Colors.grey,
                      weight: FontWeight.w400),
                  // textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 50),
                child:  Text(
                  controller.email.toString()??"",
                  style: TextStyle(
                      fontFamily: 'JosefinSans',

                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 100.w,
                  margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
                  child: PinCodeTextField(
                    controller: controller.otpController,
                    length: 4,
                    enableActiveFill: true,
                    animationType: AnimationType.none,
                    keyboardType: defaultTargetPlatform == TargetPlatform.iOS
                        ? const TextInputType.numberWithOptions(
                            decimal: true, signed: true)
                        : TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      // borderRadius: BorderRadius.circular(30),
                      fieldWidth: 48,
                      activeColor: AppColors.grayEB,
                      activeFillColor: AppColors.grayEB,
                      inactiveColor: AppColors.grayEB,
                      inactiveFillColor: AppColors.grayEB,
                      disabledColor: AppColors.grayEB,
                      selectedColor: AppColors.grayEB,
                      selectedFillColor: AppColors.grayEB,
                    ),
                    textStyle: const TextStyle(
                      color: AppColors.primaryColor,
                    ),
                    appContext: context,
                    onChanged: (String value) {},
                    onCompleted: (v) {
                      controller.otpCode.value = v.toString();
                      // controller.verifyApi();

                      // Get.toNamed(AppRoutes.home);
                    },
                  )),
              GestureDetector(
                onTap: (){
                  if(controller.otpCode.isNotEmpty){
                    controller.verifyApi();
                  }else{
                    successToast("Please enter otp");

                  }

                },
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 80, bottom: 10),
                    child: buttom("verify_me".tr)),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: const Text(
                    "Didn’t Receive The Code?",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'JosefinSans',

                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: 'JosefinSans',

                              color: controller.isResend.value
                                  ? AppColors.primaryColor
                                  : AppColors.grayC4,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () {
                            if (controller.isResend.value) {
                              // controller.resendApi();
                            } else {
                            }
                          },
                        ),
                        const Text(
                          " in ",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.gray99,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          controller.time.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.black,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
