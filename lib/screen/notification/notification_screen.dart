import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/res_dimens.dart';

import 'notification_controller.dart';

class NotificationScreen extends GetView<NotificationController> {
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
          title: Text("notification".tr,
              style: AppStyles.textStyle(
                  fontSize: dimen15, weight: FontWeight.normal)),
          automaticallyImplyLeading: false,
        ),
      ),
    body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: 10,),
        ListView.builder(
          // scrollDirection: Axis.vertical,
            shrinkWrap: true,
            reverse: false,
            itemCount: controller.notificationList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return notificationList(index);
            }),
      ],),
    ),



    );}

notificationList(index){
    return  Padding(
      padding: const EdgeInsets.only(left: 20,top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset(controller.notificationList[index].image.toString(),height: 50,width: 50,),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(controller.notificationList[index].title.toString(),

                      style: AppStyles.textStyle(
                          fontSize: dimen12,
                          weight: FontWeight.w500)

                  ),
                  Text(controller.notificationList[index].dis.toString(),

                      style: AppStyles.textStyle(
                          fontSize: dimen12,
                          color: AppColors.gray99,
                          weight: FontWeight.normal)
                  )
                ],),
            ),
          )


        ],),
    );
}
}