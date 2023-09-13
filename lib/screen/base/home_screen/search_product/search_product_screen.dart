import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/no_data.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'search_product_controller.dart';

class SearchProductScreen extends GetView<SearchProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            width: Get.size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 5,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  child: Image.asset(
                    Assets.back,
                    height: 20,
                    width: 15,
                  ),
                ),
                Container(
                  height: 52,
                  width: 80.w,
                  margin: EdgeInsets.only(top: 40, left: 15),
                  decoration: BoxDecoration(
                      color: AppColors.backGroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          color: AppColors.searchBorderColor, width: 1.0)),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Container(
                    height: 52,
                    width: 100.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onTap: () {},
                            controller: controller.searchController,
                            onChanged: (value) {
                              controller.searchProduct.value = value;
                              controller.allProductApi(value);
                              // text = value;
                            },
                            readOnly: false,
                            decoration: InputDecoration(
                              isDense: true,
                              // contentPadding: const EdgeInsets.all(15),
                              hintText: "search here",
                              hintStyle: AppStyles.textStyle(
                                  weight: FontWeight.w400,
                                  fontSize: 12.0,
                                  color: AppColors.searchHintColor),
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            style: AppStyles.textStyle(
                              weight: FontWeight.w400,
                              fontSize: 16.0,
                            ),
                            cursorColor: AppColors.primaryColor,
                          ),
                        ),
                        Obx(() => controller.searchProduct.value.isEmpty
                            ? Container()
                            : GestureDetector(
                                onTap: () {
                                  controller.searchProduct.value = "";
                                  controller.searchController.clear();
                                },
                                child: SvgPicture.asset(Assets.cross))),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0),
                  Obx(() => !controller.isLoadPage.value
                      ? controller.productList.isEmpty
                          ? Center(
                              child: NoDataScreen(
                              title: "No Product Found",
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              controller: controller.listScrollController.value,
                              itemCount: controller.productList.length,
                              itemBuilder: (context, index) {

                                if (index < controller.productList.length) {
                                  return historyText(index);
                                } else if (index == controller.productList.length) {
                                  return buildLoader(); // Display a loading indicator at the end
                                } else {
                                  return buildEndMessage(); // Display a message when all items are loaded
                                }


                                // return historyText(index);
                              })
                      : shimmerDemo()),
                  Obx(() => Visibility(
                        visible: controller.isPageLoad.value ? true : false,
                        child: Container(
                          child: const Text("Loading..."),
                        ).marginOnly(top: 30, bottom: 30),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget buildLoader() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildEndMessage() {
    return Center(
      child: Text('No more items to load.'),
    );
  }

  shimmerDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: Get.size.width,
          height: Get.size.height,
          margin:
              const EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListView.builder(
              itemBuilder: (__, _) => Padding(
                padding:
                    const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
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
        ),
        Divider()
      ],
    );
  }

  historyText(index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPages.allProductDetailsScreen, arguments: {
          "product_id": controller.productList[index].id.toString()
        });
      },
      child: Container(
          margin: EdgeInsets.only(left: 10, right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                child: Text(
                  controller.productList[index].title.toString(),
                  style: AppStyles.textStyle(
                    weight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
              )),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Image.asset(
              //     Assets.cancel,
              //     height: 15,
              //     width: 15,
              //   ),
              // )
            ],
          )),
    );
  }

  searchText() {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Hair Spray",
                style: AppStyles.textStyle(
                  weight: FontWeight.w400,
                  fontSize: 16.0,
                ),
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                Assets.cancel,
                height: 15,
                width: 15,
              ),
            )
          ],
        ));
  }
}
