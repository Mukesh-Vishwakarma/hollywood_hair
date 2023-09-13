import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:sizer/sizer.dart';

import 'my_order_controller.dart';

class MyOrderScreen extends GetView<MyOrderController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
    ));
    return Scaffold(
        backgroundColor: AppColors.lightBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: AppBar(
            elevation: 0.4,
            backgroundColor: AppColors.colorFF,
            leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                )),
            title: Text("my_orders".tr,
                style: AppStyles.textStyle(
                    fontSize: dimen14, weight: FontWeight.w500)),
            automaticallyImplyLeading: false,
            actions: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.favouriteScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SvgPicture.asset(Assets.favouriteIcon),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SvgPicture.asset(Assets.searchIcon),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.allProductScreen);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SvgPicture.asset(Assets.notificationIcon),
                ),
              ),
            ],
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              padding: const EdgeInsets.only(right: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 6),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text("Order ID:",
                                                style: AppStyles.textStyle(
                                                    color: AppColors.gray99,
                                                    fontSize: dimen12,
                                                    weight:
                                                    FontWeight.normal)),
                                            Text("HH0144PL384S",
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
                                  padding: const EdgeInsets.only(top: 6),
                                  child:  Text("Sun 1 Aug, 2023",
                                      style: AppStyles.textStyle(
                                          color: AppColors.gray99,
                                          fontSize: dimen12,
                                          weight: FontWeight.normal)),
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
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text("Sushant Dhasmana",
                    style: AppStyles.textStyle(
                        color: AppColors.black,
                        fontSize: dimen12,
                        weight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text("+91 431243 87234",
                    style: AppStyles.textStyle(
                        color: AppColors.gray99,
                        fontSize: dimen12,
                        weight:
                        FontWeight.normal)),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Text("user.hollywoodhair@gmail.com",
                    style: AppStyles.textStyle(
                        color: AppColors.gray99,
                        fontSize: dimen12,
                        weight:
                        FontWeight.normal)),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 10),
                child: DottedLine(
                  dashColor: AppColors.gray99,
                ),
              ),




            ],
          ))
    ],),


    );
  }
}
