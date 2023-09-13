import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:sizer/sizer.dart';

import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
    ));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.h),
        child: AppBar(
          elevation: 0.4,
          backgroundColor: AppColors.colorFF,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 15,
              ),
              Image.asset(Assets.appLogo),
              const SizedBox(
                width: 10,
              ),
              Image.asset(Assets.appNameVertical),
            ],
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: () {}, child: SvgPicture.asset(Assets.favouriteIcon)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: () {
                    Get.toNamed(AppPages.notificationScreen);
                  },
                  child: SvgPicture.asset(Assets.notificationIcon)),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.lightBackgroundColor,
      body: bodyWidget(),
    );
  }

  bodyWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              color: AppColors.backGroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  searchBar(),
                  const SizedBox(height: 20),
                  Image.asset(
                    Assets.dummyBanner,
                    fit: BoxFit.cover,
                    width: 100.w,
                  ),
                  const SizedBox(height: 20),
                  categoriesListWidget(),
                  const SizedBox(height: 20),
                  productsWidget(),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  searchBar() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.searchBorderColor, width: 1.0)),
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 14),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Assets.searchIcon),
            const SizedBox(width: 10),
            Container(
              height: 52,
              width: 80.w,
              child: Center(
                child: TextFormField(
                  onTap: () {
                    Get.toNamed(AppPages.searchProductScreen);
                  },
                  controller: controller.searchController,
                  onChanged: (value) {
                    // text = value;
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    isDense: true,
                    // contentPadding: const EdgeInsets.all(15),
                    hintText: "Search for “Shampoo”",
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
            ),
          ],
        ),
      ),
    );
  }

  productsWidget() {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'popular_product'.tr,
            style: AppStyles.textStyle(
              weight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 100.w,
            width: double.infinity,
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.productList.length,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 270,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return commonProductWidget(
                      productList: controller.productList[index]);
                }),
          ),
        ]);
  }

  commonProductWidget({productList}) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(AppPages.allProductDetailsScreen);
      },
      child: Container(
        width: 50.w,
        height: 20.h,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      productList.image,
                      fit: BoxFit.cover,
                      width: 50.w,
                      height: 16.h,
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
            const SizedBox(height: 5),
            Text(
              productList.title,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.textStyle(
                weight: FontWeight.w500,
                fontSize: 14.0,
              ),
            ),
            Row(
              children: [
                Text(
                  productList.price,
                  style: AppStyles.textStyle(
                    weight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  productList.oldPrice,
                  style: AppStyles.textStyle(
                    weight: FontWeight.w300,
                    fontSize: 11.0,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  categoriesListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'explore_by_categories'.tr,
          style: AppStyles.textStyle(
            weight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 20),
        Obx(
          () => Container(
            height: 35,
            child:
            // categoriesWidget(controller.collectionsModel.value)


         ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return Obx(() => categoriesWidget(index));
              },
            ),
          ),
        ),
      ],
    );
  }

  categoriesWidget(categoryItem) {
    return InkWell(
      onTap: () {
        controller.selectCategories.value = categoryItem;
        Get.toNamed(AppPages.allProductScreen, arguments: {
          "categoryName": controller.categories.value[categoryItem].title.toString(),
          "categoryId":controller.categories.value[categoryItem].id.toString(),
        
        });
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        width: 130,
        decoration: BoxDecoration(
            color: controller.selectCategories.value ==categoryItem
                ? AppColors.primaryColor
                : AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryColor, width: 1.0)),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        padding: EdgeInsets.only(left: 5,right: 5),
        child: Center(
          child: Text(
    capitalizeWords(controller.categories.value[categoryItem].title.toString()),
            // controller.categories.value[categoryItem].title.toString().capitalizeFirst!,
            style: AppStyles.textStyle(
                weight: FontWeight.w500,
                fontSize: 14.0,
                color: controller.selectCategories.value ==categoryItem
                    ? AppColors.lightBackgroundColor
                    : AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
