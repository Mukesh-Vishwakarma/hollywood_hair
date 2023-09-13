import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/res_dimens.dart';

import 'my_appointment_controller.dart';

class MyAppointmentScreen extends GetView<MyAppointmentController> {
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
          title: Text("my_appointment".tr,
              style: AppStyles.textStyle(
                  fontSize: dimen15, weight: FontWeight.normal)),
          automaticallyImplyLeading: false,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Text("UPCOMING",
                style: AppStyles.textStyle(
                    color: AppColors.gray99,
                    fontSize: dimen12,
                    weight: FontWeight.normal)),
          ),
          Container(
              // height: 100,
              margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              padding: EdgeInsets.only(top: 15, bottom: 0, left: 0, right: 0),
              width: Get.size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.colorD9,
                  width: 1.0,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hair Thickening",
                                style: AppStyles.textStyle(
                                    color: AppColors.black,
                                    fontSize: dimen12,
                                    weight: FontWeight.w500)),
                            SizedBox(height: 7),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 40),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, right: 8),
                                            child: Image.asset(
                                              Assets.calender,
                                              height: 20,
                                              width: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Date",
                                                    style: AppStyles.textStyle(
                                                        color: AppColors.gray99,
                                                        fontSize: dimen12,
                                                        weight:
                                                            FontWeight.normal)),
                                                Text("Mon, 01 Aug, 2023",
                                                    style: AppStyles.textStyle(
                                                        color: AppColors.black,
                                                        fontSize: dimen12,
                                                        weight: FontWeight.w500)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 6, right: 8),
                                            child: Image.asset(
                                              Assets.user,
                                              height: 20,
                                              // width: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 6),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Hairstylist",
                                                    style: AppStyles.textStyle(
                                                        color: AppColors.gray99,
                                                        fontSize: dimen12,
                                                        weight:
                                                            FontWeight.normal)),
                                                Text("Ishita Sajwan",
                                                    style: AppStyles.textStyle(
                                                        color: AppColors.black,
                                                        fontSize: dimen12,
                                                        weight: FontWeight.w500)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(top: 6, right: 8),
                                      child: Image.asset(
                                        Assets.clock,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Time",
                                              style: AppStyles.textStyle(
                                                  color: AppColors.gray99,
                                                  fontSize: dimen12,
                                                  weight: FontWeight.normal)),
                                          Text("9:30 AM",
                                              style: AppStyles.textStyle(
                                                  color: AppColors.black,
                                                  fontSize: dimen12,
                                                  weight: FontWeight.w500)),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 20, bottom: 10),
                    child: DottedLine(
                      dashColor: AppColors.gray99,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10),
                    child: Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 0,top: 15, right: 15),
                            decoration: (BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            )),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Column(children: [
                                        Image(
                                            height: 70,
                                            width: 70,
                                            fit: BoxFit.cover,
                                            image: AssetImage(Assets.demo3))
                                      ]))
                                ])),


                        Expanded(
                          child: Text("st. Belwederska 4400-594 Warsaw",
                              style: AppStyles.textStyle(
                                  color: AppColors.black,
                                  fontSize: dimen12,
                                  weight: FontWeight.normal)



                          ),
                        )

                      ],
                    ),
                  ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                      padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          // topRight: Radius.circular(0.0),
                        ),
                        border: Border.all(
                          color: AppColors.colorD3,
                          // style: BorderStyle.solid,
                          // width: 1.0,
                        ),
                        color: Colors.transparent,
                        // borderRadius: BorderRadius.circular(10.0),
                      ),
                      child:Center(child: Text("Reschedule",
                          style: AppStyles.textStyle(
                              color: AppColors.primaryColor,
                              fontSize: dimen12,
                              weight: FontWeight.w500)


                      ),)),
                  ),
                  
                  Expanded(
                    child: Container(
                        margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                        padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
                        width: Get.size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10.0),

                          ),
                          border: Border.all(
                            color: AppColors.colorD3,
                            // style: BorderStyle.solid,
                            // width: 1.0,
                          ),
                          color: Colors.transparent,
                          // borderRadius: BorderRadius.circular(10.0),
                        ),
                        child:Center(child: Text("Cancel",

                            style: AppStyles.textStyle(
                                color: AppColors.primaryColor,
                                fontSize: dimen12,
                                weight: FontWeight.w500)



                        ),)),
                  ),
                ],
              )


                ],
              ))
        ],
      ),
    );
  }
}
