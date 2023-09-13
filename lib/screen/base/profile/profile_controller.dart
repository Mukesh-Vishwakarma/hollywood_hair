import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/user_model.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:hollywood_hair/util/route/app_pages.dart';
import 'package:dio/dio.dart' as dio;

class ProfileController extends GetxController {
  var urlImage = "".obs;
  var fileImage = "".obs;
  Future<File>? imageFile;
  var userName = "".obs;
  var phoneNumber = "".obs;
  var userID ="".obs;
  @override
  void onInit() {
    getProfileApi();
    // userID.value = GetStorage().read(AppConstants.userId)??"";
    //
    // phoneNumber.value = "${GetStorage().read(AppConstants.phoneCode) ?? ""   "${GetStorage().read(AppConstants.phoneNumber) ?? ""
    // }"}";
    // userName.value = "${GetStorage().read(AppConstants.userName) ?? ""}";
    // urlImage.value = "${GetStorage().read(AppConstants.profileImage) ?? ""}";
    //
    // print("phoneNumber.value>>>${phoneNumber.value}");
    // print("phoneCode.value>>>${GetStorage().read(AppConstants.phoneCode)}");
    // print("phoneNumber>>>${GetStorage().read(AppConstants.phoneNumber)}");
    // print("UserId>>>${userID.value}");

    super.onInit();
  }

  editScreenRoute() async {
    var result = await Get.toNamed(AppPages.editProfileScreen);
    print("result>>>$result");

    if (result != null) {
      if (result == true) {
        await getProfileApi();

      }
    }
  }
//**** api for get profile

  getProfileApi() async {
    userID.value = GetStorage().read(AppConstants.userId)??"";

    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_id':userID.value,

      });
      print('create Data');
      print(params.toString());
      UserModel userModel = await ApiProvider.base().funGetProfile(params);
      // progressDialog.dismiss();
      print('create Data');
      print(userModel.result);
      if (userModel.result == "1") {
        userID.value = GetStorage().read(AppConstants.userId)??"";
        userName.value =  userModel.data!.customerName?? "";
        phoneNumber.value = "${userModel.data!.customerCountryCode?? ""}"   "${userModel.data!.customerPhone?? ""
        }";
        urlImage.value = userModel.data!.profileImage??"";
        print("phone number >>> ${phoneNumber.value}");

        // successToast(userModel.message!);


      } else {
        // successToast(userModel.message!);
      }
    } on HttpException catch (exception) {
      // progressDialog.dismiss();
      print(exception.message);
      // failedToast(exception.message);
    } catch (exception) {
      // progressDialog.dismiss();
      print(exception.toString());
      // failedToast(exception.toString());
    }
  }

}
