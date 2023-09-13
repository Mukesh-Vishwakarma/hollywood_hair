import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:sizer/sizer.dart';

import 'product_details_controller.dart';

class ProductDetailsScreen extends GetView<ProductDetailsController> {
  ProductDetailsScreen({super.key});

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
            title: Text("Product details",
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Obx(() => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 320,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 320,
                              child: CarouselSlider(
                                // items: controller.imageSliders,
                                carouselController: controller.controller,
                                options: CarouselOptions(
                                    autoPlay: true,
                                    disableCenter: true,
                                    viewportFraction: 1,
                                    onPageChanged: (index, reason) {
                                      controller.current.value = index;
                                    }),
                                items: controller.imageProductList.map((url) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                        ),
                                        child: Image.network(url.src.toString(),
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: 320),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                            Obx(() => Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: controller.imageProductList.value
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () {
                                          controller.controller
                                              .animateToPage(entry.key);
                                        },
                                        child: Container(
                                          width: (controller.current.value ==
                                                  entry.key
                                              ? 15.0
                                              : 6.0),
                                          height: 6.0,
                                          margin: const EdgeInsets.symmetric(
                                            vertical: 0.0,
                                            horizontal: 2.0,
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: controller.current.value ==
                                                      entry.key
                                                  ? AppColors.primaryColorDark
                                                  : Colors.white,
                                              border: Border.all(
                                                  color: AppColors.color61,
                                                  width: 0.1)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                )),
                          ],
                        ),
                      ),

                      Obx(() =>
                          controller.productDetails.value.product?.title != null
                              ? Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10),
                                  child:


                                  Text(
                                    capitalizeWords(controller.productDetails.value.product!.title ??
                                        "",),


                                    // "Scalp Peeling - Cleansing peeling for the scalp",
                                    style: AppStyles.textStyle(
                                      weight: FontWeight.w500,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                )
                              : SizedBox()),

                      Obx(() => controller.productDetails.value.product != null
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 10),
                              child: Text(
                                controller.productDetails.value.product!
                                        .variants![0].price ??
                                    "",
                                // "Scalp Peeling - Cleansing peeling for the scalp",
                                style: AppStyles.textStyle(
                                  weight: FontWeight.w500,
                                  fontSize: 16.0,
                                ),
                              ),
                            )
                          : SizedBox()),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => controller.productDetails.value.product
                                        ?.variants !=
                                    null
                                ? Text(
                                    "zł ${controller.productDetails.value.product!.variants![0].price.toString()}",
                                    style: AppStyles.textStyle(
                                      weight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  )
                                : Container())
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RatingBar.builder(
                              initialRating: 1,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemSize: 15.5,
                              itemCount: 1,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 2.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 2,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, top: 0),
                              child: Text("4.5",
                                  style: AppStyles.textStyle(
                                    weight: FontWeight.w500,
                                    fontSize: dimen12,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7, top: 0),
                              child: Text('(132 Rating)',
                                  style: AppStyles.textStyle(
                                    weight: FontWeight.normal,
                                    color: AppColors.gray99,
                                    fontSize: dimen12,
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      controller.productDetails.value.product?.bodyHtml == null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 0),
                                  child: Text(
                                    "Product Details",
                                    style: AppStyles.textStyle(
                                      weight: FontWeight.w500,
                                      fontSize: dimen15,
                                    ),
                                  ),
                                ),
                                controller.productDetails.value.product
                                            ?.bodyHtml !=
                                        null
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15, top: 10),
                                        child: Text(
                                          controller.productDetails.value
                                              .product!.bodyHtml
                                              .toString(),
                                          style: AppStyles.textStyle(
                                              weight: FontWeight.normal,
                                              fontSize: dimen12,
                                              color: AppColors.gray99),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            )
                          : Container(),
                      controller.productDetails.value.product?.variants == null
                          ? Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 0),
                              child: Text(
                                "Specification",
                                style: AppStyles.textStyle(
                                  weight: FontWeight.w500,
                                  fontSize: dimen15,
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 0),
                        child: Text(
                          "Reviews",
                          style: AppStyles.textStyle(
                            weight: FontWeight.w500,
                            fontSize: dimen15,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     controller.productDetails.value.rating![0].rating !=
                      //             null
                      //         ? Padding(
                      //             padding: const EdgeInsets.only(
                      //                 left: 15, right: 10),
                      //             child: RatingBar.builder(
                      //               initialRating: controller.productDetails
                      //                       .value.rating![0].rating
                      //                       .toDouble() ??
                      //                   0.toDouble(),
                      //               minRating: 1,
                      //               direction: Axis.horizontal,
                      //               allowHalfRating: true,
                      //               itemCount: 5,
                      //               itemSize: 15.5,
                      //               itemPadding: EdgeInsets.symmetric(
                      //                 horizontal: 2.0,
                      //               ),
                      //               itemBuilder: (context, _) => Icon(
                      //                 Icons.star,
                      //                 color: Colors.amber,
                      //                 size: 2,
                      //               ),
                      //               onRatingUpdate: (rating) {
                      //                 print(rating);
                      //               },
                      //             ),
                      //           )
                      //         : Padding(
                      //             padding: const EdgeInsets.only(
                      //                 left: 15, right: 10),
                      //             child: RatingBar.builder(
                      //               initialRating: 5,
                      //               minRating: 1,
                      //               direction: Axis.horizontal,
                      //               allowHalfRating: true,
                      //               itemCount: 0,
                      //               itemSize: 15.5,
                      //               itemPadding: EdgeInsets.symmetric(
                      //                 horizontal: 2.0,
                      //               ),
                      //               itemBuilder: (context, _) => Icon(
                      //                 Icons.star,
                      //                 color: Colors.white,
                      //                 size: 2,
                      //               ),
                      //               onRatingUpdate: (rating) {
                      //                 print(rating);
                      //               },
                      //             ),
                      //           ),
                      //     Text(
                      //       '${controller.productDetails.value.product.variants![p].rating.toString()}/5',
                      //       style: AppStyles.textStyle(
                      //         weight: FontWeight.w500,
                      //         fontSize: dimen12,
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),
                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     physics: const BouncingScrollPhysics(),
                          //     // scrollDirection: Axis.horizontal,
                          //     itemCount: controller.productReviewsList.length,
                          //     itemBuilder: (context, index) {
                          //       return reviewList(index);
                          //     })
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  )),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.size.width,
                  color: AppColors.lightBackgroundColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            // color:  AppColors.primaryColor,

                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors.primaryColor, width: 1.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5, bottom: 5),
                          child: Image.asset(
                            Assets.likeCard,
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            controller.addToCart();
                          },
                          child: Container(
                            // width:200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.color7C,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Image.asset(
                                    Assets.bag,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, bottom: 15, left: 10),
                                  child: Text(
                                    "Add to cart",
                                    style: AppStyles.textStyle(
                                      color: AppColors.lightBackgroundColor,
                                      fontSize: dimen12,
                                      weight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }

// reviewList(index) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Padding(
//         padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               controller.productDetailsList[index].title.toString() ??
//                   "".toString(),
//               style: AppStyles.textStyle(
//                 weight: FontWeight.w500,
//                 fontSize: dimen15,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 7, top: 5),
//               child: Text(
//                 "${controller.productReviewsList[index].rating.toString()}/5",
//                 style: AppStyles.textStyle(
//                     weight: FontWeight.normal,
//                     fontSize: dimen12,
//                     color: AppColors.gray99),
//               ),
//             ),
//           ],
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 15, right: 15, top: 0),
//         child: Text(
//           controller.productReviewsList[index].review.toString(),
//           style: AppStyles.textStyle(
//               weight: FontWeight.normal,
//               fontSize: dimen12,
//               color: AppColors.gray99),
//         ),
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15, right: 10),
//             child: RatingBar.builder(
//               initialRating:controller.productReviewsList[index].rating!.toDouble()??0.0,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 15.5,
//               itemPadding: EdgeInsets.symmetric(
//                 horizontal: 2.0,
//               ),
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.black,
//                 size: 2,
//               ),
//               onRatingUpdate: (rating) {
//                 print(rating);
//               },
//             ),
//           ),
//           Text(
//             '${controller.productReviewsList[index].rating.toString()}/5',
//             style: AppStyles.textStyle(
//               weight: FontWeight.w500,
//               fontSize: dimen12,
//             ),
//           )
//         ],
//       ),
//     ],
//   );
// }
}
