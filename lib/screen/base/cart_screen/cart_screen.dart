import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:sizer/sizer.dart';

import 'cart_controller.dart';

class CartScreen extends GetView<CartController> {
  CartScreen({super.key});

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
          title: Text(
            'cart'.tr,
            style: AppStyles.textStyle(
              weight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: () {
                    Get.toNamed(AppPages.favouriteScreen);
                  },
                  child: SvgPicture.asset(Assets.searchIcon)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: InkWell(
                  onTap: () {},
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
                    cartWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    promoCodeWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    priceDetailWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    orderButton(),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  cartWidget() {
    return Obx(() => ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.cartList.value.length,
        itemBuilder: (context, index) {
          return cartitemWidget(index);
        }));
  }

  cartitemWidget(index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                controller.cartList[index].image.toString(),
                width: 22.w,
                height: 10.h,
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Container(
              width: 55.w,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.cartList[index].title.toString(),
                    style: AppStyles.textStyle(
                      weight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    controller.cartList[index].price.toString(),
                    style: AppStyles.textStyle(
                      weight: FontWeight.w400,
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    controller.cartList[index].grams.toString(),
                    style: AppStyles.textStyle(
                      weight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: AppColors.grayDA)),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                  child: SvgPicture.asset(Assets.minusIcon),
                ),
                Text(
                    controller.price(controller.cartList[index].quantity.toString(),),
                    // controller.cartList[index].quantity.toString(),
                    style: AppStyles.textStyle(
                      weight: FontWeight.w500,
                      fontSize: 12.0,
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                  child: SvgPicture.asset(Assets.plusIcon),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  promoCodeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('promo_code'.tr,
            style: AppStyles.textStyle(
              weight: FontWeight.w600,
              fontSize: 16.0,
            )),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 70.w,
              height: 49,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.promoborder, width: 1.0),
                color: AppColors.promofilled,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: TextFormField(
                  controller: controller.promoCodeController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    hintText: "HHGLAMOUR15",
                    hintStyle: AppStyles.textStyle(
                        // fontStyle: FontStyle.italic,
                        color: AppColors.promoHint.withOpacity(0.34),
                        fontSize: 14.0,
                        weight: FontWeight.w400),
                    border: InputBorder.none,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  cursorColor: AppColors.primaryColor,
                  style: AppStyles.textStyle(
                      // fontStyle: FontStyle.italic,
                      color: AppColors.promoHint,
                      fontSize: 14.0,
                      weight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black84, width: 1.0),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text('apply'.tr,
                    style: AppStyles.textStyle(
                      weight: FontWeight.w500,
                      fontSize: 14.0,
                    )),
              ),
            )
          ],
        )
      ],
    );
  }

  priceDetailWidget() {
    return
      Obx(()=>

      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('price_details'.tr,
            style: AppStyles.textStyle(
              weight: FontWeight.w600,
              fontSize: 16.0,
            )),
        const SizedBox(height: 20),
        priceitemWidget(title: "subtotal".tr, value: "zł ${controller.cardModel.value.itemsSubtotalPrice.toString()}"),
        const SizedBox(height: 10),
        priceitemWidget(title: 'discount'.tr, value:controller.cardModel.value.totalDiscount.toString()),
        const SizedBox(height: 10),
        priceitemWidget(title: "shipping_cost".tr, value:controller.cardModel.value.totalPrice.toString()),
        // const SizedBox(height: 10),
        // priceitemWidget(title: "tax".tr, value: "zł 3"),
        // const SizedBox(height: 10),
        // priceitemWidget(title: "promo_code".tr, value: "zł 3"),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'grand_total'.tr,
              style: AppStyles.textStyle(
                weight: FontWeight.w500,
                fontSize: 12.0,
              ),
            ),
            Text(
              "zł ${controller.cardModel.value.totalPrice.toString()}",
              style: AppStyles.textStyle(
                weight: FontWeight.w600,
                fontSize: 12.0,
              ),
            ),
          ],
        )
      ],
    ));
  }

  priceitemWidget({title, value}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle(
            weight: FontWeight.w400,
            fontSize: 12.0,
          ),
        ),
        Text(
          value,
          style: AppStyles.textStyle(
            weight: FontWeight.w500,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  orderButton() {
    return Obx(()=>

      Container(
      color: AppColors.lightBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(controller.cardModel.value.totalPrice.toString(),
                  style: AppStyles.textStyle(
                    weight: FontWeight.w700,
                    fontSize: 17.0,
                  )),
              Text('PLN',
                  style: AppStyles.textStyle(
                    weight: FontWeight.w500,
                    fontSize: 12.0,
                  )),
            ],
          ),
          Container(
            width: 70.w,
            height: 52,
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primaryColor, width: 1.0)),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Center(
              child: Text(
                'order_now'.tr,
                style: AppStyles.textStyle(
                    weight: FontWeight.w500,
                    fontSize: 16.0,
                    color: AppColors.lightBackgroundColor),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
