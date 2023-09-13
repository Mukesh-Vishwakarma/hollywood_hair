import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';

import 'change_password_controller.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            backgroundColor: AppColors.colorFF,
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                )),
            title: Text('change_password'.tr,
                style: AppStyles.textStyle(
                    fontSize: dimen18, weight: FontWeight.normal)),
            automaticallyImplyLeading: false,
          ),
        ),
        body: SingleChildScrollView(child: Column(
            children: [
SizedBox(height: 20),
          Form(
              key: controller.formLoginKey,
              child: Column(children: [


              Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Obx(() => TextFormField(
                controller: controller.oldPasswordController,
                obscureText: controller.oldPasswordVisible.value,
                onTap: () {
                  controller.oldPasswordVisible.value =
                  !controller.oldPasswordVisible.value;
                },
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return "plz_enter_old_password".tr;
                  }
                  return null;
                },
                onChanged: (value) {
                  controller.oldPassword.value = value;
                },
                decoration: InputDecoration(
                  isDense: false,
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'old_password'.tr,
                  hintStyle: AppStyles.textStyle(
                    color: AppColors.black,
                    fontSize: dimen12,
                    weight: FontWeight.normal,
                  ),
                  suffixIcon: Obx(() => Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: !controller.oldPasswordVisible.value
                        ? Image.asset(
                      Assets.seenPassword,
                      height: 5,
                    )
                        : Image.asset(
                      Assets.unseenPassword,
                      height: 5,
                    ),
                  )),

                  labelText: 'old_password'.tr,
                  labelStyle: AppStyles.textStyle(
                    color: AppColors.black,
                    fontSize: dimen12,
                    weight: FontWeight.normal,
                  ),

                  // const TextStyle(
                  //     color: AppColors.color3D,
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: AppColors.colorCD, width: 0.99),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: AppColors.colorCD, width: 0.99),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 0,
                    ),
                  ),
                ),
              ))),


                Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Obx(() => TextFormField(
                      controller: controller.newPasswordController,
                      obscureText: controller.newPasswordVisible.value,
                      onTap: () {
                        controller.newPasswordVisible.value =
                        !controller.newPasswordVisible.value;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "plz_enter_new_password".tr;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.newPassword.value = value;
                      },
                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: const EdgeInsets.all(15),
                        hintText: 'new_password'.tr,
                        hintStyle: AppStyles.textStyle(
                          color: AppColors.black,
                          fontSize: dimen12,
                          weight: FontWeight.normal,
                        ),
                        suffixIcon: Obx(() => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: !controller.newPasswordVisible.value
                              ? Image.asset(
                            Assets.seenPassword,
                            height: 5,
                          )
                              : Image.asset(
                            Assets.unseenPassword,
                            height: 5,
                          ),
                        )),

                        labelText: 'new_password'.tr,
                        labelStyle: AppStyles.textStyle(
                          color: AppColors.black,
                          fontSize: dimen12,
                          weight: FontWeight.normal,
                        ),

                        // const TextStyle(
                        //     color: AppColors.color3D,
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: AppColors.colorCD, width: 0.99),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: AppColors.colorCD, width: 0.99),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0,
                          ),
                        ),
                      ),
                    ))),


                Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Obx(() => TextFormField(
                      controller: controller.confirmPasswordController,
                      obscureText: controller.confirmPasswordVisible.value,
                      onTap: () {
                        controller.confirmPasswordVisible.value =
                        !controller.confirmPasswordVisible.value;
                      },
                      validator: (value) {
                        if (value.toString().isEmpty)
                          return "plz_enter_confirm_password".tr;
                        if (value != controller.newPassword.value)
                          return 'Password not match';
                        return null;
                      },
                      //   if (value.toString().isEmpty) {
                      //     return "plz_enter_confirm_password".tr;
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) {
                        controller.confirmPassword.value = value;
                      },
                      decoration: InputDecoration(
                        isDense: false,
                        contentPadding: const EdgeInsets.all(15),
                        hintText: 'confirm_password'.tr,
                        hintStyle: AppStyles.textStyle(
                          color: AppColors.black,
                          fontSize: dimen12,
                          weight: FontWeight.normal,
                        ),
                        suffixIcon: Obx(() => Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: !controller.confirmPasswordVisible.value
                              ? Image.asset(
                            Assets.seenPassword,
                            height: 5,
                          )
                              : Image.asset(
                            Assets.unseenPassword,
                            height: 5,
                          ),
                        )),

                        labelText: 'confirm_password'.tr,
                        labelStyle: AppStyles.textStyle(
                          color: AppColors.black,
                          fontSize: dimen12,
                          weight: FontWeight.normal,
                        ),

                        // const TextStyle(
                        //     color: AppColors.color3D,
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: AppColors.colorCD, width: 0.99),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: AppColors.colorCD, width: 0.99),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 0,
                          ),
                        ),
                      ),
                    ))),

SizedBox(height: 100),

                Obx(() => !controller.isPageLoad.value
                    ? GestureDetector(
                    onTap: () {
                      if (!controller.formLoginKey.currentState!.validate()) {
                        print("not validate");
                      } else {
                        controller.changePasswordApi();
                        // Get.toNamed(AppPages.baseScreen);
                        // controller.loginApi();
                      }
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 80, bottom: 10),
                        child: buttom("change_password".tr)))
                    : Padding(
                  padding: EdgeInsets.only(
                      left: 20, right: 20, top: 80, bottom: 10),
                  child: Container(
                    width: Get.size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.color7C,
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                )),

              ])

        )])));
  }
}
