import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/no_data.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:shimmer/shimmer.dart';

import 'static_controller.dart';

class StaticScreen extends GetView<StaticController> {
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
            // title: Text("setting".tr,
            //     style: AppStyles.textStyle(
            //         fontSize: dimen18, weight: FontWeight.w600)),
            title: Text(controller.title.value,
                style: AppStyles.textStyle(
                    fontSize: dimen18, weight: FontWeight.normal)),
            automaticallyImplyLeading: false,
          ),
        ),
        body:





        Obx(() => !controller.isPageLoad.value
              ? controller.appContentTextHtml.value.isEmpty
            ?  Center(
          child: NoDataScreen(
            title: "No Data Found",
          ),
        )
            :



        Html(data: controller.appContentTextHtml.value.toString(),
          ).marginOnly(top: 10, left:15,right: 15)
              :shimmerDemo()
        ),




    );
  }
  shimmerDemo() {
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      margin: EdgeInsets.only(left: 10, right: 10,top: 20),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
          itemBuilder: (__, _) => Padding(
            padding: const EdgeInsets.only(bottom: 0.0, left: 10, right: 10),
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
                        height: 10,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          itemCount: 10,
        ),
      ),
    );
  }
}
