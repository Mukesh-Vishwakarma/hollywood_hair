import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';

import 'booking_controller.dart';

class BookingScreen extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: AppColors.colorFF,
          title: Text("booking".tr,
              style: AppStyles.textStyle(
                  fontSize: dimen18, weight: FontWeight.w600)),
          actions: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  Assets.search,
                  height: 30,
                  width: 30,
                ),
              ),
              onTap: () {
                // do something
              },
            )
          ],
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            ListView.builder(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                reverse: false,
                itemCount: controller.bookingList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return bookingList(index);
                }),
            SizedBox(height: 40),
            DottedLine(
              dashColor: AppColors.gray99,
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: (){
                Get.toNamed(AppPages.myAppointmentScreen);

              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.colorD3,
                    // style: BorderStyle.solid,
                    width: 1.0,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    // Expanded(child: Container(),),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        "My Appointments",
                        style: AppStyles.textStyle(
                          color: AppColors.primaryColor,
                          fontSize: dimen12,
                          weight: FontWeight.normal,
                        ),
                      ),
                    )),
                    Image.asset(
                      Assets.arrowRight,
                      height:20,
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 130),
          ],
        ),
      ),
    );
  }

  bookingList(index) {
    return GestureDetector(
      onTap: (){
        if(index==1){
          Get.toNamed(AppPages.bookingFormScreen);

        }else{
        // name: AppPages.confirmBookingScreen
          Get.toNamed(AppPages.confirmBookingScreen);

        }
      },
      child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.only(bottom: 10),
          // height: 200,
          width: Get.size.width,
          decoration: (BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Column(
                    children: [
                      Image(
                          height: 200,
                          // width: 350,
                          fit: BoxFit.cover,
                          image: AssetImage(
                              controller.bookingList[index].image.toString())),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      controller.bookingList[index].text
                                          .toString(),
                                      style: AppStyles.textStyle(
                                          fontSize: dimen12,
                                          weight: FontWeight.w500)),
                                  Text(
                                      controller.bookingList[index].description
                                          .toString(),
                                      style: AppStyles.textStyle(
                                          fontSize: dimen12,
                                          weight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 0),
                            child: Image.asset(
                              Assets.arrowRight,
                              height: 15,
                              width: 15,
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
