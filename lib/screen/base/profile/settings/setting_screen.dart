import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

import 'setting_controller.dart';

class SettingScreen extends GetView<SettingsController> {
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
          // title: Text("setting".tr,
          //     style: AppStyles.textStyle(
          //         fontSize: dimen18, weight: FontWeight.w600)),
          title: Text("setting".tr,
              style: AppStyles.textStyle(
                  fontSize: dimen18, weight: FontWeight.normal)),
          automaticallyImplyLeading: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.changePasswordScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("change_password".tr,
                              style: AppStyles.textStyle(
                                fontSize: dimen15,
                                weight: FontWeight.w400,
                              )),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Image.asset(
                            Assets.arrowLeft,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.languagesScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("languages".tr,
                              style: AppStyles.textStyle(
                                fontSize: dimen15,
                                weight: FontWeight.w400,
                              )),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Image.asset(
                            Assets.arrowLeft,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.staticScreen,
                        arguments: "terms_&_condition".tr);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("terms_&_condition".tr,
                              style: AppStyles.textStyle(
                                fontSize: dimen15,
                                weight: FontWeight.w400,
                              )),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Image.asset(
                            Assets.arrowLeft,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.staticScreen,
                        arguments: "privacy_policy".tr);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("privacy_policy".tr,
                              style: AppStyles.textStyle(
                                fontSize: dimen15,
                                weight: FontWeight.w400,
                              )),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Image.asset(
                            Assets.arrowLeft,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.contactScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("contact_us".tr,
                              style: AppStyles.textStyle(
                                fontSize: dimen15,
                                weight: FontWeight.w400,
                              )),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Image.asset(
                            Assets.arrowLeft,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppPages.faqScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5,bottom: 5),
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("FAQs".tr,
                              style: AppStyles.textStyle(
                                fontSize: dimen15,
                                weight: FontWeight.w400,
                              )),
                        )),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 10),
                          child: Image.asset(
                            Assets.arrowLeft,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Divider(),
          ),
          GestureDetector(
            onTap: () {
              logout(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("log_out".tr,
                        style: AppStyles.textStyle(
                          fontSize: dimen15,
                          weight: FontWeight.w400,
                        )),
                  )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Image.asset(
                      Assets.arrowLeft,
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  logout(context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, top: 15),
                          child: Image.asset(
                            Assets.cancel,
                            height: 15,
                            width: 15,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text("log_out".tr,
                          style: AppStyles.textStyle(
                              fontSize: dimen18, weight: FontWeight.normal)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Center(
                        child: Text("log_out_dis".tr,
                            style: AppStyles.textStyle(
                              fontSize: dimen12,
                              weight: FontWeight.normal,
                            )),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: GestureDetector(
                           onTap: () {
                             isLogoutResponse();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Text("log_out".tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: dimen15,
                                    color: AppColors.color2C,
                                    fontFamily: 'JosefinSans',
                                    decoration: TextDecoration.underline,
                                  )),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                                // width: Get.size.width,
                                padding: EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: AppColors.black,
                                ),
                                child: Center(
                                  child: Text("cancel".tr,
                                      style: AppStyles.textStyle(
                                        fontSize: dimen12,
                                        color: AppColors.lightBackgroundColor,
                                        weight: FontWeight.normal,
                                      )),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
