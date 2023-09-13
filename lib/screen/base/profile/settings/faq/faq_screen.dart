import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/no_data.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:shimmer/shimmer.dart';

import 'faq_controller.dart';

class FaqScreen extends GetView<FaqController> {
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
            title: Text('FAQs'.tr,
                style: AppStyles.textStyle(
                    fontSize: dimen18, weight: FontWeight.normal)),
            automaticallyImplyLeading: false,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() => !controller.isPageLoad.value
                  ? controller.faqList.isEmpty
                      ? NoDataScreen(
                          title: "No '${'FAQs'.tr}' Data ",
                        )
                      : ListView.builder(
                          // scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          reverse: false,
                          itemCount: controller.faqList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return faqWidget(index, context);
                          })
                  : shimmerDemo()),
            ],
          ),
        ));
  }

  shimmerDemo() {
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      margin: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
          itemBuilder: (__, _) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0),
                      ),
                      Container(
                        
                        width: Get.size.width,
                        height: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 3,
        ),
      ),
    );
  }

  faqWidget(index, context) {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
        width: MediaQuery.of(context).size.width,
        child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.grey),
            child: ExpansionTile(
                onExpansionChanged: ((newState) {
                  debugPrint("newState");

                  if (newState) {
                    // controller.changeColor.value = index;
                  } else {
                    // controller.changeColor.value = -1;
                  }
                }),
                title: Text(
                    "Que.  ${controller.faqList[index].ques}",
                    style: AppStyles.textStyle(
                      color: AppColors.black,
                      fontSize: dimen10,
                      weight: FontWeight.w500,
                    )),
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Text(
                      "Ans.  ${controller.faqList[index].ans.toString()}",
                        style: AppStyles.textStyle(
                          color: AppColors.gray99,
                          fontSize: dimen10,
                          weight: FontWeight.w400,

                        ) // style:AppStyles.textStyle(
                    ),
                  ),
                ])));
  }
}
