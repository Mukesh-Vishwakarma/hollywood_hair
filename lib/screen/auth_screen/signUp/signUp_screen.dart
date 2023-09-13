import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';

import 'signUp_controller.dart';


class SignUpScreen extends GetView<SignUpController> {
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
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: Text(
                      "get_started".tr,
                      style: AppStyles.textStyle(
                          fontSize: dimen20, weight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
                  child: Center(
                    child: Text(
                      "get_started_dis".tr,
                      textAlign: TextAlign.center,
                      style: AppStyles.textStyle(
                          fontSize: dimen12,
                          color: Colors.grey,
                          weight: FontWeight.w400),
                    ),
                  ),
                ),
                Form(
                    key: controller.formLoginKey,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                        child: textField(
                            controller.nameController,
                            "plz_enter_name".tr,
                            controller.name,
                            'name'.tr,
                            "name"),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: textField(
                            controller.emailController,
                            "plz_enter_email".tr,
                            controller.email,
                            'email'.tr,
                            "email"),
                      ),

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: textField(
                            controller.passwordController,
                            "plz_enter_password".tr,
                            controller.password,
                            'password'.tr,
                            "password"),
                      ),


                      //****** phone number

                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 0),
                        child: Obx(() => Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 24),
                                // height: 46,
                                child: TextFormField(
                                  style: AppStyles.textStyle(
                                    fontSize: dimen12,
                                    weight: FontWeight.normal,
                                  ),
                                  controller: controller.contactController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(12),
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "plz_enter_phone_number".tr;
                                    } else if (!RegExp(
                                        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                        .hasMatch(value)) {
                                      return "plz_enter_phone_number".tr;
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.contact.value = value;
                                    // text = value;
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          showCountryPicker(
                                            context: context,
                                            //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                                            exclude: <String>['KN', 'MF'],
                                            favorite: <String>['SE'],
                                            //Optional. Shows phone code before the country name.
                                            showPhoneCode: true,
                                            onSelect: (Country country) {
                                              print(
                                                  'Select country: ${country.phoneCode.toString()}');
                                              controller.countryCode.value =
                                              '+${country.phoneCode.toString()}';

                                              print('Select code: ${controller.countryCode.value}');
                                            },

                                            // Optional. Sets the theme for the country list picker.
                                            countryListTheme:
                                            CountryListThemeData(
                                              // Optional. Sets the border radius for the bottomsheet.
                                              borderRadius:
                                              BorderRadius.only(
                                                topLeft:
                                                Radius.circular(40.0),
                                                topRight:
                                                Radius.circular(40.0),
                                              ),
                                              // Optional. Styles the search field.
                                              textStyle:
                                              AppStyles.textStyle(
                                                fontSize: dimen12,
                                                weight: FontWeight.normal,
                                              ),
                                              inputDecoration:
                                              InputDecoration(
                                                labelText: 'Search',
                                                hintText:
                                                'Start typing to search',
                                                prefixIcon: const Icon(
                                                    Icons.search),
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: const Color(
                                                        0xFF8C98A8)
                                                        .withOpacity(0.2),
                                                  ),
                                                ),
                                              ),
                                              // Optional. Styles the text in the search field
                                              searchTextStyle: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(5.0),
                                              child: Text(
                                                controller.countryCode
                                                    .toString(),
                                                style: AppStyles.textStyle(
                                                  fontSize: dimen12,
                                                  weight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Image.asset(
                                              Assets.dropDown,
                                              height: 10,
                                              width: 10,
                                            ),
                                            Padding(
                                              padding:
                                              const EdgeInsets.all(8.0),
                                              child: Container(
                                                margin:
                                                const EdgeInsets.only(
                                                    left: 8),
                                                height: 18,
                                                width: 2,
                                                color:
                                                AppColors.primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    contentPadding:
                                    const EdgeInsets.all(15),
                                    // hintText: "Enter Your Contact Number",
                                    // hintStyle: const TextStyle(
                                    //     fontSize: 13, fontWeight: FontWeight.w400),
                                    labelText: 'phone_number'.tr,
                                    labelStyle: AppStyles.textStyle(
                                      color: AppColors.black,
                                      fontSize: dimen12,
                                      weight: FontWeight.normal,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: AppColors.grayEB,
                                          width: 0.99),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                          color: AppColors.grayEB,
                                          width: 0.99),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 0.0),
                                    ),
                                    focusedErrorBorder:
                                    const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8)),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),



                      Obx(()=>!controller.isPageLoad.value?
                      GestureDetector(
                          onTap: () {
                            if (!controller.formLoginKey.currentState!.validate()) {
                              print("not validate");
                            } else {
                              print("validateeee");
                              controller.registrationApi();
                              // Get.back();
                              // controller.loginApi();
                            }
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 80, bottom: 10),
                              child: buttom("sign_up".tr))):
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 80, bottom: 10),
                        child: Container(
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



                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 8, left: 8),
                              child: Text(
                                "signUp_with".tr,
                                  style: AppStyles.textStyle(
                                    color: AppColors.gray99,
                                    fontSize: dimen12,
                                    weight: FontWeight.normal,
                                  )
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20),

                          width: Get.size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.colorE9,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            // color: AppColors.colorFF,
                          ),
                          padding: EdgeInsets.only(top: 15, bottom: 15, left: 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Image.asset(
                                  Assets.google,
                                  height: 20,
                                  width: 20,
                                ),
                              ),


                              Padding(
                                padding: const EdgeInsets.only(left: 100),
                                child: Text(
                                    "Google",
                                    style: AppStyles.textStyle(
                                      color: AppColors.black,
                                      fontSize: dimen12,
                                      weight: FontWeight.normal,
                                    )
                                ),
                              ),
                            ],
                          )),

                      SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          // Get.toNamed(AppRoutes.signUp);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: RichText(
                            text:  TextSpan(
                              text: "already_have_an_account".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                fontFamily: 'JosefinSans',

                                color: AppColors.color61,
                              ),
                              children: <TextSpan>[
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "sign_in".tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color:Colors.black,
                                      fontFamily: 'JosefinSans',

                                      decoration: TextDecoration.underline,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 50),


                    ]))
              ],
            ),
          ),
        ));
  }





}
