import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

import 'booking_form_controller.dart';

class BookingFormScreen extends GetView<BookingFormController> {
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
          title: Text('book_appointment'.tr,
              style: AppStyles.textStyle(
                  fontSize: dimen15, weight: FontWeight.normal)),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: controller.formLoginKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),

                      //****** name

                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("name".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: textField(
                            controller.nameController,
                            "plz_enter_name".tr,
                            controller.name,
                            'name'.tr,
                            "name"),
                      ),

                      //****** phone number
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("phone_number".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child: textField(
                            controller.phoneNumberController,
                            "phone_number".tr,
                            controller.phoneNumber,
                            'phone_number'.tr,
                            "phone number"),
                      ),


//****** age
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("age".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                        child:

                        TextFormField(
                          controller: controller.ageController,
                          validator: (value) {
                            if (value.toString().isEmpty) {
                              return "age".tr;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.age.value= value;
                          },
                          decoration: InputDecoration(
                            isDense: false,
                            contentPadding:
                            const EdgeInsets.all(15),
                            hintText:"age".tr,
                            hintStyle:AppStyles.textStyle(
                              color: AppColors.black,
                              fontSize: dimen12,
                              weight: FontWeight.normal,
                            ),
                            suffixIcon:Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Image.asset(Assets.dropDown,),
                            ),

                            labelText: "age".tr,
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
                              borderRadius:
                              BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: AppColors.colorCD,
                                  width: 0.99),
                            ),
                            errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedErrorBorder:
                            const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: AppColors.colorCD,
                                  width: 0.99),
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
                        )
                      ),

                      //****** gender
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("gender".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child:

                          TextFormField(
                            controller: controller.genderController,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "gender".tr;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              controller.gender.value= value;
                            },
                            decoration: InputDecoration(
                              isDense: false,
                              contentPadding:
                              const EdgeInsets.all(15),
                              hintText:"gender".tr,
                              hintStyle:AppStyles.textStyle(
                                color: AppColors.black,
                                fontSize: dimen12,
                                weight: FontWeight.normal,
                              ),
                              suffixIcon:Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(Assets.dropDown,),
                              ),

                              labelText: "gender".tr,
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
                                borderRadius:
                                BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.colorCD,
                                    width: 0.99),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder:
                              const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.colorCD,
                                    width: 0.99),
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
                          )
                      ),


                      //****** service
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("service".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child:

                          TextFormField(
                            controller: controller.serviceController,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "service".tr;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              controller.service.value= value;
                            },
                            decoration: InputDecoration(
                              isDense: false,
                              contentPadding:
                              const EdgeInsets.all(15),
                              hintText:"service".tr,
                              hintStyle:AppStyles.textStyle(
                                color: AppColors.black,
                                fontSize: dimen12,
                                weight: FontWeight.normal,
                              ),
                              suffixIcon:Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(Assets.dropDown,),
                              ),

                              labelText: "service".tr,
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
                                borderRadius:
                                BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.colorCD,
                                    width: 0.99),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder:
                              const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.colorCD,
                                    width: 0.99),
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
                          )
                      ),



                      //****** service
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("show_room_location".tr,
                            style: AppStyles.textStyle(
                                fontSize: dimen12, weight: FontWeight.normal)),
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          child:

                          TextFormField(
                            controller: controller.locationController,
                            validator: (value) {
                              if (value.toString().isEmpty) {
                                return "show_room_location".tr;
                              }
                              return null;
                            },
                            onChanged: (value) {
                              controller.location.value= value;
                            },
                            decoration: InputDecoration(
                              isDense: false,
                              contentPadding:
                              const EdgeInsets.all(15),
                              hintText:"show_room_location".tr,
                              hintStyle:AppStyles.textStyle(
                                color: AppColors.black,
                                fontSize: dimen12,
                                weight: FontWeight.normal,
                              ),
                              suffixIcon:Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(Assets.dropDown,),
                              ),

                              labelText: "show_room_location".tr,
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
                                borderRadius:
                                BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.colorCD,
                                    width: 0.99),
                              ),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),
                              focusedErrorBorder:
                              const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    color: AppColors.colorCD,
                                    width: 0.99),
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
                          )
                      ),


                    ])),
            SizedBox(height: 20,),

            GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.bookingAppointmentScreen);
                  // if (!controller.formLoginKey.currentState!.validate()) {
                  //   print("not validate");
                  // } else {
                  //   // controller.loginApi();
                  // }
                },
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 80, bottom: 10),
                    child: buttom("next".tr))),

            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
