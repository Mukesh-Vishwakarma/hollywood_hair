import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_style.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/res_dimens.dart';
import 'package:shimmer/shimmer.dart';

import 'address_controller.dart';

class AddressScreen extends GetView<AddressController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: AppColors.colorFF,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
              )),
          title: Text("select_address".tr,
              style: AppStyles.textStyle(
                  fontSize: dimen15, weight: FontWeight.normal)),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => !controller.isPageLoad.value
                ? controller.getAddress.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: GestureDetector(
                          onTap: () {
                            controller.clearTextFiled();
                            addAddress();
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Image.asset(
                                  Assets.add,
                                  height: 15,
                                  width: 20,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Add New Address",
                                  style: AppStyles.textStyle(
                                    color: AppColors.black,
                                    fontSize: dimen12,
                                    weight: FontWeight.normal,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    : ListView.builder(
                        // scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        reverse: false,
                        itemCount: controller.getAddress.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return getAddress(index);
                        })
                : shimmerDemo()),
            Obx(() => controller.getAddress.isEmpty
                ? SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      DottedLine(
                        dashColor: AppColors.gray99,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                   controller.clearTextFiled();
                          addAddress();
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Image.asset(
                                Assets.add,
                                height: 15,
                                width: 20,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Add New Address",
                                style: AppStyles.textStyle(
                                  color: AppColors.black,
                                  fontSize: dimen12,
                                  weight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }

  getAddress(index) {
    return GestureDetector(
      onTap: () {
        controller.checkAddress.value = index;
      },
      child: Obx(() => Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: controller.checkAddress.value == index
                    ? AppColors.color7C
                    : AppColors.black,
                // style: BorderStyle.solid,
                width: 1.0,
              ),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Assets.house,
                    height: 30,
                    width: 30,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            controller.getAddress[index].addressType.toString(),
                            style: AppStyles.textStyle(
                              color: controller.checkAddress.value == index
                                  ? AppColors.color7C
                                  : AppColors.black,
                              fontSize: dimen12,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            controller.getAddress[index].name.toString(),
                            style: AppStyles.textStyle(
                              color: AppColors.black,
                              fontSize: dimen12,
                              weight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            controller.getAddress[index].phone.toString(),
                            style: AppStyles.textStyle(
                              color: AppColors.black,
                              fontSize: dimen12,
                              weight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            controller.getAddress[index].email.toString(),
                            style: AppStyles.textStyle(
                              color: AppColors.black,
                              fontSize: dimen12,
                              weight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            controller.getAddress[index].address.toString(),
                            style: AppStyles.textStyle(
                              color: AppColors.black,
                              fontSize: dimen12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.getAddressByIdApi(controller.getAddress[index].addressType.toString(),controller.getAddress[index].id.toString());
                    editAddress(controller.getAddress[index].id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Assets.edit,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.deleteAddressApi(controller.getAddress[index].id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Assets.delete,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  addAddress() {
    return Get.bottomSheet(
        Wrap(children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 0),
              color: Colors.transparent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8, bottom: 0),
                      child: Image.asset(
                        Assets.imagesIcLine,
                        height: 36,
                        width: 36,
                        // color: Colors.grey,
                      ),
                    ),
                    Container(
                        width: Get.size.width,
                        decoration: new BoxDecoration(
                            color: AppColors.lightBackgroundColor,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 40, top: 20),
                                  child: Image.asset(
                                    Assets.dropDown,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 80, top: 20),
                                  child: Text("Add address",
                                      style: AppStyles.textStyle(
                                        color: AppColors.black,
                                        fontSize: dimen12,
                                        weight: FontWeight.w500,
                                      )),
                                )
                              ],
                            ),
                            Form(
                                key: controller.formLoginKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 20,
                                            top: 10,
                                            bottom: 20),
                                        child: Text(
                                          "Select address type",
                                          style: AppStyles.textStyle(
                                            fontSize: dimen12,
                                            weight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                        () => Container(
                                          height: 35,
                                          margin: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .addressTypeList.length,
                                            itemBuilder: (context, index) {
                                              return Obx(
                                                  () => addressType(index));
                                            },
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //       left: 20, right: 20, top: 20),
                                      //   child: textField(
                                      //       controller.addressController,
                                      //       "address_name".tr,
                                      //       controller.address,
                                      //       'address_name'.tr,
                                      //       "address name"),
                                      // ),


                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 20),
                                        child: textField(
                                            controller.recipientNameController,
                                            "recipient_name".tr,
                                            controller.recipientName,
                                            'recipient_name'.tr,
                                            "recipient_name"),
                                      ),

                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 20),
                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  10),
                                            ],
                                            controller: controller.phoneNumberController,
                                            style: AppStyles.textStyle(
                                              fontSize: dimen12,
                                              weight: FontWeight.normal,
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'phone_number'.tr;
                                              }

                                              return null;
                                            },
                                            onChanged: (value) {
                                              controller.phoneNumber.value =
                                                  value;
                                            },
                                            decoration: InputDecoration(
                                              isDense: false,
                                              contentPadding:
                                              const EdgeInsets.all(
                                                  15),

                                              hintText: 'phone_number'.tr,
                                              hintStyle:
                                              AppStyles.textStyle(
                                                color: AppColors.black,
                                                fontSize: dimen12,
                                                weight: FontWeight.normal,
                                              ),

                                              labelText: 'phone_number'.tr,
                                              labelStyle:
                                              AppStyles.textStyle(
                                                color: AppColors.black,
                                                fontSize: dimen12,
                                                weight: FontWeight.normal,
                                              ),

                                              // const TextStyle(
                                              //     color: AppColors.color3D,
                                              //     fontSize: 14,
                                              //     fontWeight: FontWeight.w400),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                                borderSide:
                                                const BorderSide(
                                                    color: AppColors
                                                        .colorCD,
                                                    width: 0.99),
                                              ),
                                              errorBorder:
                                              const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              const OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        8)),
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),

                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                                borderSide:
                                                const BorderSide(
                                                    color: AppColors
                                                        .colorCD,
                                                    width: 0.99),
                                              ),

                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                                borderSide:
                                                const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                              ),
                                            ),
                                          )),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        2),
                                                  ],
                                                  controller: controller
                                                      .floorController,
                                                  style: AppStyles.textStyle(
                                                    fontSize: dimen12,
                                                    weight: FontWeight.normal,
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'floor'.tr;
                                                    }

                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    controller.floor.value =
                                                        value;
                                                  },
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            15),

                                                    hintText: 'floor'.tr,
                                                    hintStyle:
                                                        AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    labelText: 'floor'.tr,
                                                    labelStyle:
                                                        AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    // const TextStyle(
                                                    //     color: AppColors.color3D,
                                                    //     fontSize: 14,
                                                    //     fontWeight: FontWeight.w400),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: AppColors
                                                                  .colorCD,
                                                              width: 0.99),
                                                    ),
                                                    errorBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),

                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: AppColors
                                                                  .colorCD,
                                                              width: 0.99),
                                                    ),

                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.grey,
                                                        width: 0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: TextFormField(
                                                  controller: controller
                                                      .zipCodeController,
                                                  keyboardType:
                                                      TextInputType.number,

                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        4),
                                                  ],
                                                  style: AppStyles.textStyle(
                                                    fontSize: dimen12,
                                                    weight: FontWeight.normal,
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'zip_code'.tr;
                                                    }

                                                    return null;
                                                  },
                                                  //   if (value.toString().isEmpty) {
                                                  //     return validationMsg;
                                                  //   }
                                                  //   return null;
                                                  // },
                                                  onChanged: (value) {
                                                    controller.zipCode.value =
                                                        value;
                                                  },
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    contentPadding:
                                                        const EdgeInsets.all(
                                                            15),

                                                    hintText: 'zip_code'.tr,
                                                    hintStyle:
                                                        AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    labelText: 'zip_code'.tr,
                                                    labelStyle:
                                                        AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    // const TextStyle(
                                                    //     color: AppColors.color3D,
                                                    //     fontSize: 14,
                                                    //     fontWeight: FontWeight.w400),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: AppColors
                                                                  .colorCD,
                                                              width: 0.99),
                                                    ),
                                                    errorBorder:
                                                        const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),

                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                              color: AppColors
                                                                  .colorCD,
                                                              width: 0.99),
                                                    ),

                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: Colors.grey,
                                                        width: 0,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                // textField(
                                                //     controller.zipCodeController,
                                                //     "zip_code".tr,
                                                //     controller.zipCode,
                                                //     'zip_code'.tr,
                                                //     "zip_code"),

                                                ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 20),
                                        child: textField(
                                            controller.fullAddressController,
                                            "full_address".tr,
                                            controller.fullAddress,
                                            'full_address'.tr,
                                            "full address"),
                                      ),

                        Obx(() => !controller.isPageLoad.value
                            ? GestureDetector(
                            onTap: () {
                              if (!controller.formLoginKey.currentState!.validate()) {
                                print("not validate");
                              } else {
                                controller.addAddressApi();
                                // controller.loginApi();
                              }
                            },
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 80,
                                    bottom: 40),
                                child: buttom(
                                    "add_new_address".tr)))
                            : Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 80,
                              bottom: 40),
                          child: Container(
                            width: Get.size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.color7C,
                            ),
                            child: const Center(
                              child: Padding(
                                padding:
                                EdgeInsets.only(top: 15, bottom: 15),
                                child: SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ) ),




                                    ]))
                          ],
                        ))
                  ]))
        ]),
        isScrollControlled: true);
  }

  addressType(index) {
    return InkWell(
      onTap: () {
        // print(categoryItem.selected);
        controller.selectAddressType.value = index;
        controller.addressType.value =
            controller.addressTypeList.value[index].toString();
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: controller.selectAddressType.value == index
                ? AppColors.primaryColor
                : AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primaryColor, width: 1.0)),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Center(
          child: Text(
            controller.addressTypeList.value[index].toString(),
            style: AppStyles.textStyle(
                weight: FontWeight.w500,
                fontSize: 14.0,
                color: controller.selectAddressType.value == index
                    ? AppColors.lightBackgroundColor
                    : AppColors.primaryColor),
          ),
        ),
      ),
    );
  }

  editAddress(id) {
    return Get.bottomSheet(
        Wrap(children: <Widget>[
          Container(
              margin: EdgeInsets.only(bottom: 0),
              color: Colors.transparent,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8, bottom: 0),
                      child: Image.asset(
                        Assets.imagesIcLine,
                        height: 36,
                        width: 36,
                        // color: Colors.grey,
                      ),
                    ),
                    Container(
                        width: Get.size.width,
                        decoration: new BoxDecoration(
                            color: AppColors.lightBackgroundColor,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(40.0),
                                topRight: const Radius.circular(40.0))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 40, top: 20),
                                  child: Image.asset(
                                    Assets.dropDown,
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 80, top: 20),
                                  child: Text("edit_address".tr,
                                      style: AppStyles.textStyle(
                                        color: AppColors.black,
                                        fontSize: dimen12,
                                        weight: FontWeight.w500,
                                      )),
                                )
                              ],
                            ),
                            Form(
                                key: controller.formLoginKey,
                                child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 20,
                                            top: 10,
                                            bottom: 20),
                                        child: Text(
                                          "Select address type",
                                          style: AppStyles.textStyle(
                                            fontSize: dimen12,
                                            weight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Obx(
                                            () => Container(
                                          height: 35,
                                          margin: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                            const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .addressTypeList.length,
                                            itemBuilder: (context, index) {
                                              return Obx(
                                                      () => addressType(index));
                                            },
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   margin: EdgeInsets.only(
                                      //       left: 20, right: 20, top: 20),
                                      //   child: textField(
                                      //       controller.addressController,
                                      //       "address_name".tr,
                                      //       controller.address,
                                      //       'address_name'.tr,
                                      //       "address name"),
                                      // ),


                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 20),
                                        child: textField(
                                            controller.recipientNameController,
                                            "recipient_name".tr,
                                            controller.recipientName,
                                            'recipient_name'.tr,
                                            "recipient_name"),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 20),
                                          child: TextFormField(
                                            keyboardType:
                                            TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  10),
                                            ],
                                            controller: controller.phoneNumberController,
                                            style: AppStyles.textStyle(
                                              fontSize: dimen12,
                                              weight: FontWeight.normal,
                                            ),
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'phone_number'.tr;
                                              }

                                              return null;
                                            },
                                            onChanged: (value) {
                                              controller.phoneNumber.value =
                                                  value;
                                            },
                                            decoration: InputDecoration(
                                              isDense: false,
                                              contentPadding:
                                              const EdgeInsets.all(
                                                  15),

                                              hintText: 'phone_number'.tr,
                                              hintStyle:
                                              AppStyles.textStyle(
                                                color: AppColors.black,
                                                fontSize: dimen12,
                                                weight: FontWeight.normal,
                                              ),

                                              labelText: 'phone_number'.tr,
                                              labelStyle:
                                              AppStyles.textStyle(
                                                color: AppColors.black,
                                                fontSize: dimen12,
                                                weight: FontWeight.normal,
                                              ),

                                              // const TextStyle(
                                              //     color: AppColors.color3D,
                                              //     fontSize: 14,
                                              //     fontWeight: FontWeight.w400),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                                borderSide:
                                                const BorderSide(
                                                    color: AppColors
                                                        .colorCD,
                                                    width: 0.99),
                                              ),
                                              errorBorder:
                                              const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                              const OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.all(
                                                    Radius.circular(
                                                        8)),
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),

                                              enabledBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                                borderSide:
                                                const BorderSide(
                                                    color: AppColors
                                                        .colorCD,
                                                    width: 0.99),
                                              ),

                                              focusedBorder:
                                              OutlineInputBorder(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    8),
                                                borderSide:
                                                const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                              ),
                                            ),
                                          )),

                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: TextFormField(
                                                  keyboardType:
                                                  TextInputType.number,
                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        2),
                                                  ],
                                                  controller: controller
                                                      .floorController,
                                                  style: AppStyles.textStyle(
                                                    fontSize: dimen12,
                                                    weight: FontWeight.normal,
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'floor'.tr;
                                                    }

                                                    return null;
                                                  },
                                                  onChanged: (value) {
                                                    controller.floor.value =
                                                        value;
                                                  },
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    contentPadding:
                                                    const EdgeInsets.all(
                                                        15),

                                                    hintText: 'floor'.tr,
                                                    hintStyle:
                                                    AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    labelText: 'floor'.tr,
                                                    labelStyle:
                                                    AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    // const TextStyle(
                                                    //     color: AppColors.color3D,
                                                    //     fontSize: 14,
                                                    //     fontWeight: FontWeight.w400),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      borderSide:
                                                      const BorderSide(
                                                          color: AppColors
                                                              .colorCD,
                                                          width: 0.99),
                                                    ),
                                                    errorBorder:
                                                    const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                    const OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8)),
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),

                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      borderSide:
                                                      const BorderSide(
                                                          color: AppColors
                                                              .colorCD,
                                                          width: 0.99),
                                                    ),

                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      borderSide:
                                                      const BorderSide(
                                                        color: Colors.grey,
                                                        width: 0,
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          Expanded(
                                            child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 20),
                                                child: TextFormField(
                                                  controller: controller
                                                      .zipCodeController,
                                                  keyboardType:
                                                  TextInputType.number,

                                                  inputFormatters: [
                                                    LengthLimitingTextInputFormatter(
                                                        4),
                                                  ],
                                                  style: AppStyles.textStyle(
                                                    fontSize: dimen12,
                                                    weight: FontWeight.normal,
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'zip_code'.tr;
                                                    }

                                                    return null;
                                                  },
                                                  //   if (value.toString().isEmpty) {
                                                  //     return validationMsg;
                                                  //   }
                                                  //   return null;
                                                  // },
                                                  onChanged: (value) {
                                                    controller.zipCode.value =
                                                        value;
                                                  },
                                                  decoration: InputDecoration(
                                                    isDense: false,
                                                    contentPadding:
                                                    const EdgeInsets.all(
                                                        15),

                                                    hintText: 'zip_code'.tr,
                                                    hintStyle:
                                                    AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    labelText: 'zip_code'.tr,
                                                    labelStyle:
                                                    AppStyles.textStyle(
                                                      color: AppColors.black,
                                                      fontSize: dimen12,
                                                      weight: FontWeight.normal,
                                                    ),

                                                    // const TextStyle(
                                                    //     color: AppColors.color3D,
                                                    //     fontSize: 14,
                                                    //     fontWeight: FontWeight.w400),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      borderSide:
                                                      const BorderSide(
                                                          color: AppColors
                                                              .colorCD,
                                                          width: 0.99),
                                                    ),
                                                    errorBorder:
                                                    const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                    const OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8)),
                                                      borderSide: BorderSide(
                                                        color: Colors.red,
                                                      ),
                                                    ),

                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      borderSide:
                                                      const BorderSide(
                                                          color: AppColors
                                                              .colorCD,
                                                          width: 0.99),
                                                    ),

                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          8),
                                                      borderSide:
                                                      const BorderSide(
                                                        color: Colors.grey,
                                                        width: 0,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              // textField(
                                              //     controller.zipCodeController,
                                              //     "zip_code".tr,
                                              //     controller.zipCode,
                                              //     'zip_code'.tr,
                                              //     "zip_code"),

                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20, top: 20),
                                        child: textField(
                                            controller.fullAddressController,
                                            "full_address".tr,
                                            controller.fullAddress,
                                            'full_address'.tr,
                                            "full address"),
                                      ),

                                      Obx(() => !controller.isPageLoad.value
                                          ? GestureDetector(
                                          onTap: () {
                                            if (!controller.formLoginKey.currentState!.validate()) {
                                              print("not validate");
                                            } else {
                                              controller.updateAddressApi(id);
                                              // controller.loginApi();
                                            }
                                          },
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 80,
                                                  bottom: 40),
                                              child: buttom(
                                                  "add_new_address".tr)))
                                          : Padding(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 80,
                                            bottom: 40),
                                        child: Container(
                                          width: Get.size.width,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                            color: AppColors.color7C,
                                          ),
                                          child: const Center(
                                            child: Padding(
                                              padding:
                                              EdgeInsets.only(top: 15, bottom: 15),
                                              child: SpinKitThreeBounce(
                                                color: Colors.white,
                                                size: 20.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ) ),




                                    ]))

                          ],
                        ))
                  ]))
        ]),
        isScrollControlled: true);
  }

  shimmerDemo() {
    return Container(
      width: Get.size.width,
      height: Get.size.height,
      margin: EdgeInsets.only(left: 0, right: 0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: ListView.builder(
          itemBuilder: (__, _) => Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 10, right: 10),
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
                        height: 150,
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
}
