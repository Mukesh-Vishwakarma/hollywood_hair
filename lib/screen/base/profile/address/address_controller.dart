import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/model/get_address_by_id.dart';
import 'package:hollywood_hair/model/get_all_address_model.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/util/common_function.dart';

class AddressController extends GetxController {
  var getAddress = <AllAddressData>[].obs;
  final formLoginKey = GlobalKey<FormState>();

  // var addressTypeController = TextEditingController();
  var addressController = TextEditingController();
  var recipientNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var floorController = TextEditingController();
  var zipCodeController = TextEditingController();
  var fullAddressController = TextEditingController();

  var selectAddress = "".obs;
  var addressType = "Home".obs;
  var address = "".obs;
  var recipientName = "".obs;
  var phoneNumber = "".obs;
  var floor = "".obs;
  var zipCode = "".obs;
  var fullAddress = "".obs;
  var selectAddressType = 0.obs;

  var isPageLoad = true.obs;
  var checkAddress = RxInt(-1);
  var addressTypeList = ['Home', 'Office', 'Other'].obs;

  @override
  void onInit() {
    getAllAddressApi();
    super.onInit();
  }

  //  ****** clear text field
  clearTextFiled() {
    selectAddress.value = "";
    addressController.text = "";
    recipientNameController.text = "";
    floorController.text = "";
    zipCodeController.text = "";
    fullAddressController.text = "";
    phoneNumberController.text = "";
  }

  //  ****** api get all address

  getAllAddressApi() async {
    // isPageLoad.value = true;
    var userId = GetStorage().read(AppConstants.userId).toString() ?? "";

    print("User ID>>>>>${userId}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_id': userId,
      });
      print('create Data');
      print(params.toString());
      GetAllAddressModel getAllAddressModel =
          await ApiProvider.base().funGetAllAddress(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(getAllAddressModel.result);
      if (getAllAddressModel.result == "1") {
        // successToast(getAllAddressModel.msg!);
        getAddress.value = getAllAddressModel.data!;

        // Get.back();
      } else {
        // successToast(getAllAddressModel.msg!);
        // isPageLoad.value = false;
        // failedToast(userBean.msg!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }

  //  ****** api add address

  addAddressApi() async {
    isPageLoad.value = true;
    var userId = GetStorage().read(AppConstants.userId).toString() ?? "";

    print("customer_id>>>>>${userId}");
    print("address>>>>>${addressController.text}");
    print("floor_number>>>>>${floor.value}");
    print("zip_code>>>>>${zipCode.value}");
    print("phone>>>>>${phoneNumberController.text}");
    print("recipient_name>>>>>${recipientNameController.text}");
    print("address_type>>>>>${addressType.value}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_id': userId,
        'address': fullAddressController.text.toString(),
        'floor_number': floor.value,
        'zip_code': zipCode.value,
        'phone': phoneNumberController.text.toString(),
        'recipient_name': recipientNameController.text.toString(),
        'address_type': addressType.value
      });
      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funAddAddress(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == "1") {
        // getAddress.refresh();
        getAllAddressApi();
        Get.back();

        successToast(baseModel.message!);

        // Get.back();
      } else {
        successToast(baseModel.message!);
        // isPageLoad.value = false;
        // failedToast(userBean.msg!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }

  //  ****** api update address

  updateAddressApi(id) async {
    // isPageLoad.value = true;
    var userId = GetStorage().read(AppConstants.userId).toString() ?? "";

    print("customer_id>>>>>${userId}");
    print("address>>>>>${addressController.text}");
    print("floor_number>>>>>${floorController.value}");
    print("zip_code>>>>>${zipCodeController.value}");
    print("phone>>>>>${phoneNumberController.text}");
    print("recipient_name>>>>>${recipientNameController.text}");
    print("address_type>>>>>${addressType.value}");
    try {
      //customer_id:14
      // address:Punjab
      // floor_number:56
      // zip_code:564564
      // phone:12345
      // recipient_name:khan
      // address_type:Home
      // id:1
      dio.FormData params = dio.FormData.fromMap({
        'customer_id': userId,
        'address': fullAddressController.text.toString(),
        'floor_number': floorController.text.toString(),
        'zip_code': zipCodeController.text.toString(),
        'phone': phoneNumberController.text.toString(),
        'recipient_name': recipientNameController.text.toString(),
        'address_type': addressType.value,
        'id': id.toString()
      });
      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funUpdateAddress(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == "1") {
        // getAddress.refresh();
        Get.back();
        getAllAddressApi();


        successToast(baseModel.message!);

        // Get.back();
      } else {
        successToast(baseModel.message!);
        // isPageLoad.value = false;
        // failedToast(userBean.msg!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }

  //  ****** api delete address

  deleteAddressApi(id) async {
    try {
      dio.FormData params = dio.FormData.fromMap({
        'id': id,
      });
      print('create Data');
      print(params.toString());
      BaseModel baseModel = await ApiProvider.base().funDeleteAddress(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(baseModel.result);
      if (baseModel.result == "1") {
        // getAddress.refresh();
        getAllAddressApi();
        // Get.back();

        successToast(baseModel.message!);

        // Get.back();
      } else {
        successToast(baseModel.message!);
        // isPageLoad.value = false;
        // failedToast(userBean.msg!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }

  // ****** api get address by id
  getAddressByIdApi(addressType, id) async {
    // isPageLoad.value = true;
    var userId = GetStorage().read(AppConstants.userId).toString() ?? "";

    print("User ID>>>>>${userId}");
    try {
      dio.FormData params = dio.FormData.fromMap({
        "customer_id": userId,
        "address_type": addressType,
        "id": id
        // 'customer_id':userId,
      });
      print('create Data');
      print(params.toString());
      GetAddressByIdModel getAddressByIdModel =
          await ApiProvider.base().funGetAddressById(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(getAddressByIdModel.result);
      if (getAddressByIdModel.result == "1") {
        selectAddress.value = getAddressByIdModel.data!.addressType.toString();
        addressController.text = getAddressByIdModel.data!.address.toString();
        zipCodeController.text = getAddressByIdModel.data!.zipCode.toString();
        recipientNameController.text =
            getAddressByIdModel.data!.recipientName.toString();
        floorController.text = getAddressByIdModel.data!.floorNumber.toString();
        fullAddressController.text =
            getAddressByIdModel.data!.address.toString();
        phoneNumberController.text = getAddressByIdModel.data!.phone.toString();
        // successToast(getAllAddressModel.msg!);

        // Get.back();
      } else {
        // successToast(getAllAddressModel.msg!);
        // isPageLoad.value = false;
        // failedToast(userBean.msg!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      isPageLoad.value = false;
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      isPageLoad.value = false;
      // failedToast(exception.toString());
    }
  }

  addAddressBottomSheet(context) {
    return Get.bottomSheet(Wrap(children: <Widget>[
      Container(
          margin: EdgeInsets.only(bottom: 30),
          color: AppColors.lightBackgroundColor,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8, bottom: 30),
                  child: Image.asset(
                    Assets.imagesIcLine,
                    height: 36,
                    width: 36,
                    // color: Colors.grey,
                  ),
                )
              ]))
    ]));
  }
}
