import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/no_data.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'all_product_controller.dart';

class AllProductScreen extends GetView<AllProductController> {
  AllProductScreen({super.key});

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
          title: Text("all_products".tr,
              style:
                  AppStyles.textStyle(fontSize: 14.0, weight: FontWeight.w500)),
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
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return SafeArea(
      child: Obx(() => !controller.isPageLoad.value
          ? controller.productList.isEmpty
              ? Center(
                child: NoDataScreen(
                    title: "No ${'all_products'.tr} Data ",
                  ),
              )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color: AppColors.lightBackgroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [productsWidget()],
                        ),
                      )
                    ],
                  ),
                )
          : shimmerDemo()),
    );
  }

  shimmerDemo() {
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      color: Colors.white,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 2.8,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (__, _) => Container(
            width: Get.size.width,
            height: 150,
            color: Colors.white,
          ),
          // ListView.builder(
          //   itemBuilder: (__, _) =>
        ),
      ),
    );
  }

  productsWidget() {
    return Container(
      // color: AppColors.dividerColor,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 2.8,
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1),
          itemBuilder: (context, index) {
            return commonProductWidget(index);
          }),
    );
  }

  commonProductWidget(index) {
    return GestureDetector(
      onTap: () {
        print("varient id >>> ${controller.productList[index].id}");
        Get.toNamed(AppPages.allProductDetailsScreen, arguments: {
          "product_id": controller.productList[index].id.toString()
        });
      },
      child: Container(
        width: 47.w,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        color: AppColors.lightBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppColors.blueFC,
                        image: DecorationImage(
                          image: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: Assets.upload,
                            image: controller
                                    .productList[index].images!.isNotEmpty
                                ? controller.productList[index].images![0].src
                                    .toString()
                                : Assets.upload,
                          ).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: AppColors.lightBackgroundColor,
                          shape: BoxShape.circle),
                      child: SvgPicture.asset(Assets.favouriteIcon),
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Text(
    capitalizeWords(controller.productList[index].title.toString(),),

              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle(
                weight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            Row(
              children: [
                Text(
                  "0",
                  // controller.productList[index].variants![0].price.toString(),
                  style: AppStyles.textStyle(
                    weight: FontWeight.w500,
                    color: AppColors.black84,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  "0",
                  // controller.productList[index]..toString(),
                  style: AppStyles.textStyle(
                    weight: FontWeight.w400,
                    fontSize: 11.0,
                    color: AppColors.grayC4,
                    decoration: TextDecoration.lineThrough,
                    // decorationColor: AppColors.gray95
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
