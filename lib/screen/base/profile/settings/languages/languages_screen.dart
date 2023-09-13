import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/res_dimens.dart';

import 'languages_controller.dart';

class LanguageScreen extends GetView<LanguagesController> {
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
            title: Text("languages".tr,
                style: AppStyles.textStyle(
                    fontSize: dimen15, weight: FontWeight.normal)),
            automaticallyImplyLeading: false,
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              SizedBox(height:30),
              ListView.builder(
                // scrollDirection: Axis.vertical,
                shrinkWrap: true,
                reverse: false,
                itemCount: controller.languageList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return language(index);
                },
              ),
            ],
          ),
        ));
  }

  language(index) {
    return GestureDetector(
      onTap: () {
        controller.selectLang.value =
            controller.languageList[index].text.toString();
      },
      child:
      Obx(()=>

      Container(
        // height: 100,
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
        width: Get.size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: controller.selectLang.value ==
                    controller.languageList[index].text
                ? AppColors.color7C
                : AppColors.black,
            // style: BorderStyle.solid,
            width: 1.0,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Expanded(
                child: Text(
              controller.languageList[index].text.toString(),
              style: AppStyles.textStyle(
                color: controller.selectLang.value == controller.languageList[index].text
                    ? AppColors.color7C
                    : AppColors.black,
                fontSize: dimen12,
                weight: FontWeight.normal,
              ),
            )),
            controller.selectLang.value ==
                controller.languageList[index].text?Image.asset(Assets.click):SizedBox()
          ],
        ),
      )),
    );
  }
}
