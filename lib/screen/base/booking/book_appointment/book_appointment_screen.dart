import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:intl/intl.dart';

import 'book_appointment_controller.dart';

class BookAppointmentScreen extends GetView<BookAppointmentController> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Preferred Hairstylist(optional)",
                    style: AppStyles.textStyle(
                        fontSize: dimen12, weight: FontWeight.normal)),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child:

                  TextFormField(
                    controller: controller.nameController,
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "name".tr;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.name.value= value;
                    },
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding:
                      const EdgeInsets.all(15),
                      hintText:"name".tr,
                      hintStyle:AppStyles.textStyle(
                        color: AppColors.black,
                        fontSize: dimen12,
                        weight: FontWeight.normal,
                      ),
                      suffixIcon:Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Image.asset(Assets.dropDown,),
                      ),

                      labelText: "name".tr,
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Date",
                    style: AppStyles.textStyle(
                        fontSize: dimen12, weight: FontWeight.normal)),
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child:

                  TextFormField(
                    readOnly: true,
                    controller: controller.dateTimeController,
                    focusNode: controller.dateFocusNode,
                    onTap: () async {
                      DateTime? newDateTime =
                      await showRoundedDatePicker(
                        context: context,
                        description: "date_journey".tr,

                        theme:
                        ThemeData(primarySwatch: Colors.blue),
                        height: 300,
                        // initialDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        firstDate:
                        DateTime(DateTime.now().year - 100),
                        lastDate: DateTime(2030, 12, 12),
                        // firstDate: DateTime(DateTime.now().year - 100),
                        // lastDate: DateTime(DateTime.now().year + 18),
                        borderRadius: 30,
                      );
                      //**** for view/////
                      final DateFormat formatterView =
                      DateFormat('d MMMM yyyy');
                      String formattedView =
                      formatterView.format(newDateTime!);
                      controller.dateTimeController.text = formattedView;
                      //**** for api/////
                      //1996-04-19
                      final DateFormat formatterApi =
                      DateFormat('yyyy-MM-dd');
                      String formattedApi =
                      formatterApi.format(newDateTime);
                      controller.dateTime.value = formattedApi;

                      print('DateJourney');
                      print(controller.dateTime.value);
                    },
                    validator: (value) {
                      if (value.toString().isEmpty) {
                        return "date".tr;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.dateTime.value= value;
                    },
                    decoration: InputDecoration(
                      isDense: false,
                      contentPadding:
                      const EdgeInsets.all(15),
                      hintText:"date".tr,
                      hintStyle:AppStyles.textStyle(
                        color: AppColors.black,
                        fontSize: dimen12,
                        weight: FontWeight.normal,
                      ),
                      suffixIcon:Icon(Icons.calendar_month_outlined),

                      labelText: "date".tr,
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

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Available slots",
                    style: AppStyles.textStyle(
                        fontSize: dimen12, weight: FontWeight.normal)),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Wrap(
                    spacing: 3.0,
                    runSpacing: 0.0,
                    children: List.generate(
                      controller.timeList.length,(index) =>Obx(()=>

                        GestureDetector(
                      onTap: (){
                        controller.selectTime.value =controller.timeList[index].toString();
                      },
                        child: Container(
                          margin: const EdgeInsets.only(left: 5, top: 10),
                          child: (Chip(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color:
                              controller.selectTime.value==controller.timeList[index].toString()?
                              Colors.transparent :AppColors.colorD3

                              ),

                            ),
                            backgroundColor: controller.selectTime.value==controller.timeList[index].toString()?
                            AppColors.primaryColor :AppColors.lightBackgroundColor
                            ,
                            label: Text(
                              controller.timeList[index].toString(),
                              overflow: TextOverflow.ellipsis,
                              style:  TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: controller.selectTime.value==controller.timeList[index].toString()?
                                Colors.white:AppColors.primaryColor

                              ),
                            ),
                          )


                          ),
                        ),
                      )),
                    ).toList()),
              ),


              SizedBox(height: 20,),

              GestureDetector(
                  onTap: () {
                    // Get.toNamed(AppPages.bookingAppointmentScreen);
                    // if (!controller.formLoginKey.currentState!.validate()) {
                    //   print("not validate");
                    // } else {
                    //   // controller.loginApi();
                    // }
                  },
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 80, bottom: 10),
                      child: buttom("Book appointment"))),

              SizedBox(height: 20,),


            ],
          ),
        ));
  }
}
