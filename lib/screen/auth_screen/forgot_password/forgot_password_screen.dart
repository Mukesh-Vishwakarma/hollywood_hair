import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

import 'forgot_password_controller.dart';



class ForgotPasswordScreen extends GetView<ForgotScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,top: 30),
                    child: Image.asset(Assets.back,height:20,width: 20,),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      "forgot_password".tr,
                      style: AppStyles.textStyle(
                          fontSize: dimen20, weight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Center(
                    child: Text(
                      "forgot_password_dis".tr,
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle(
                          fontSize: dimen12,
                          color: Colors.grey,
                          weight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                Form(
                    key: controller.formLoginKey,
                    child: Column(children: [

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: textField(
                            controller.emailController,
                            "plz_enter_email".tr,
                            controller.email,
                            'email'.tr,
                            "email"),
                      ),
                      SizedBox(height: 80,),


                      Obx(()=>!controller.isPageLoad.value?
                      GestureDetector(
                          onTap: () {
                            if (!controller.formLoginKey.currentState!.validate()) {
                              print("not validate");
                            } else {
                              // Get.toNamed(AppPages.otpScreen);
                              controller.otpApi();
                            }
                          },
                          child: Padding(
                              padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 10),
                              child: buttom("get_otp".tr))):
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 10),                        child: Container(
                          width: Get.size.width,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.color7C,
                          ),
                          child:const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 15,bottom: 15),
                              child: SpinKitThreeBounce(
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),),
                      )),






                    ]))
              ],
            ),
          ),
        ));
  }
}
