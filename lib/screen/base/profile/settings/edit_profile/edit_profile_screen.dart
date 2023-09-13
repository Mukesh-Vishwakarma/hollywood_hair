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

import 'edit_profile_controller.dart';

class EditProfileScreen extends GetView<EditProfileController> {
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
          title: Text("edit_profile".tr,
              style: AppStyles.textStyle(
                  fontSize: dimen15, weight: FontWeight.normal)),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: GestureDetector(
                  onTap: () {
                    controller.imageBottomSheet(context);
                  },
                  child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                              height: 200.0,
                              width: 200.0,
                              child: Obx(() => controller.getProfileImage()),
                              decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                border: new Border.all(
                                  color: AppColors.primaryColor,
                                  width: 4.0,
                                ),
                              )),
                          /*   Obx(() => controller.getProfileImage()),*/

                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Align(
                                alignment: Alignment.topRight,
                                child: Image.asset(
                                  Assets.editProfile,
                                  height: 30,
                                  width: 30,
                                )),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Form(
                key: controller.formLoginKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),

                      //****** name

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("name".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: textField(
                            controller.nameController,
                            "plz_enter_name".tr,
                            controller.name,
                            'name'.tr,
                            "name"),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      //****** email

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("email".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
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
                      SizedBox(
                        height: 20,
                      ),

                      //****** phone number

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("phone_number".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
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
                                                      '+ ${country.phoneCode.toString()}';

                                                  print(
                                                      'Select code: ${controller.countryCode.value}');
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
                                        labelStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
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
                      SizedBox(
                        height: 30,
                      ),

                      Obx(() => !controller.isPageLoad.value
                          ? GestureDetector(
                              onTap: () {
                                if (!controller.formLoginKey.currentState!
                                    .validate()) {
                                  print("not validate");
                                } else {
                                  controller.updateProfileApi();
                                  // controller.loginApi();
                                }
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20, right: 20, top: 80, bottom: 10),
                                  child: buttom("save".tr)))
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
                                    padding:
                                        EdgeInsets.only(top: 15, bottom: 15),
                                    child: SpinKitThreeBounce(
                                      color: Colors.white,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                            )),

                      SizedBox(height: 50),
                    ]))
          ],
        ),
      ),
    );
  }
}
