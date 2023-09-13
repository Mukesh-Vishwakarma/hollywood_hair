import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/res_dimens.dart';

import 'booking_confirm_controller.dart';

class BookingConfirmScreen extends GetView<BookingConfirmController> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: <Widget>[
    Image.asset(
      Assets.demo3,
      height: MediaQuery.of(context).size.height/1.3,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
    ),


      Scaffold(
        backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 40),
            child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Image.asset(Assets.backBackground,height: 50,width:50,)),
          ),
          Align(alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(left: 0, right: 0, top: 10),
              padding: EdgeInsets.only(left: 0, right: 0, top: 15, bottom: 15),
              width: Get.size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  // topRight: Radius.circular(0.0),
                ),
                border: Border.all(
                  color: AppColors.colorD3,
                  // style: BorderStyle.solid,
                  // width: 1.0,
                ),
                color: AppColors.lightBackgroundColor,
                // borderRadius: BorderRadius.circular(10.0),
              ),child: Column(children: [

                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 20),
                  child: Text("Style Selection Consultation",
                      style: AppStyles.textStyle(
                          color: AppColors.black,
                          fontSize: dimen18,
                          weight: FontWeight.w500)

                  ),
                ),

            Padding(
              padding: const EdgeInsets.only(left: 40,right:40),
              child: Text("Get expert advice on your hair styling! Book an online consultation with our hair experts to find your perfect look.",
                 textAlign: TextAlign.center,

                  style: AppStyles.textStyle(
                      color: AppColors.gray99,
                      fontSize: dimen12,
                      weight: FontWeight.w500)

              ),
            ),

            GestureDetector(
              onTap: (){
                Get.back();

              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 15,bottom: 20),
                padding: EdgeInsets.only(left: 8, right: 8, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.color7C,
                ),
                child: Row(
                  children: [
                    // Expanded(child: Container(),),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: Text(
                            "Book consultation",
                            style: AppStyles.textStyle(
                              color: AppColors.lightBackgroundColor,
                              fontSize: dimen12,
                              weight: FontWeight.normal,
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset(
                        Assets.whiteArrow,
                        height:15,
                        width: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],)),

          ),
        ],
      ),
    )]);
  }
}
