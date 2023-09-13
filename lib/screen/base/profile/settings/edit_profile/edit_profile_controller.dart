import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/base_model.dart';
import 'package:hollywood_hair/model/user_model.dart';
import 'package:hollywood_hair/util/app_colors.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/assets.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

class EditProfileController extends GetxController {

  final formLoginKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var contactController = TextEditingController();

  var name ="".obs;
  var email ="".obs;
  var contact ="".obs;
  var countryCode ="+91".obs;
  var userID ="".obs;


  var fileImage = "".obs;
  var fileCompressImage = "".obs;
  var urlImage = "".obs;
  var isPageLoad = false.obs;


  @override
  void onInit() {
    // getUserData();
    getProfileApi();
    super.onInit();
  }


  getUserData() async {

    nameController.text = await GetStorage().read(AppConstants.userName) ?? "";
    emailController.text = await GetStorage().read(AppConstants.email) ?? "";
    contactController.text = await GetStorage().read(AppConstants.phoneNumber) !=null? GetStorage().read(AppConstants.phoneCode).toString(): "";
    urlImage.value = await GetStorage().read(AppConstants.profileImage)??"";
    countryCode.value = await GetStorage().read(AppConstants.phoneCode) ==null? GetStorage().read(AppConstants.phoneCode).toString(): "+91";
    print("imagee>>>${urlImage.value}");
  }



    imageBottomSheet(context) {
    return Get.bottomSheet(
      Wrap(children: <Widget>[
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
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          getImageFormDevice(
                            ImageSource.camera,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 40,
                                width: 40,
                                margin: EdgeInsets.only(bottom: 8),
                                child: Image.asset(
                                  Assets.cameraPng,
                                  color: AppColors.primaryColor,
                                )),
                            Container(
                              child: Text(
                                "camera".tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            // ,SizedBox(height: 30,)
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.back();
                          Navigator.pop(context);
                          getImageFormDevice(
                            ImageSource.gallery,
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                margin: EdgeInsets.only(bottom: 8),
                                child: Image.asset(
                                  Assets.upload,
                                  color: AppColors.primaryColor,
                                )),
                            Container(
                              child: Text(
                                "gallery".tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                            // ,SizedBox(height: 30,)
                          ],
                        ),
                      )
                    ]),
                SizedBox(
                  height: 15,
                )
              ]),
        )
      ]),
      isScrollControlled: false,
      backgroundColor: AppColors.lightBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          )),
    );
  }



  getImageFormDevice(sourceType) async {
    var pickedFile =
    await ImagePicker().pickImage(source: sourceType, imageQuality: 50);
    print(pickedFile);
    if (pickedFile != null) {
      fileImage.value = pickedFile.path;
      getImageAfterCompress();
    } else {
      print('No image selected.');
    }
  }

  getImageAfterCompress() async {
    var date = DateTime.now();
    String imgPath = date.millisecondsSinceEpoch.toString();
    final dir = Directory.systemTemp;
    final targetPath = dir.absolute.path + "/$imgPath.jpg";
    var compressedFile = await FlutterImageCompress.compressAndGetFile(
        fileImage.value, targetPath,
        quality: 90);
    fileCompressImage.value = compressedFile!.path;
    print('profileImageCompressFile:---$fileCompressImage');
  }

  getProfileImage() {
    if (fileImage.isNotEmpty) {
      return ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(50), // Image radius
          child: Image.file(
            File(fileImage.value),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else if (urlImage.isNotEmpty) {
      return ClipOval(
          child: SizedBox.fromSize(
              size: const Size.fromRadius(90),
              child: Image.network(
                urlImage.value.toString(),
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    // Image has finished loading
                    return child;
                  } else {
                    // Image is still loading, show a placeholder or loading indicator
                    return Image.asset(
                      Assets.imagesIcUser,
                      fit: BoxFit.cover,
                    ); // Replace Placeholder with your desired loading widget
                  }
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Image.asset(
                    Assets.imagesIcUser,
                    fit: BoxFit.cover,
                  );
                },
              )));
    } else {
      return Image.asset(
        Assets.imagesIcUser,
      );
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
        nameController.text =  userModel.data!.customerName?? "";
        emailController.text =userModel.data!.customerEmail ?? "";
        contactController.text = userModel.data!.customerPhone!=null? userModel.data!.customerPhone.toString(): "";
        urlImage.value = userModel.data!.profileImage??"";
        countryCode.value = userModel.data!.customerCountryCode !=null? userModel.data!.customerCountryCode.toString(): "+91";

      } else {
        successToast(userModel.message!);
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


//  ***** update profile

  updateProfileApi() async {

    isPageLoad.value = true;
    print("UserID>>>>>${userID.value}");
    print("Name>>>>>${nameController.text}");
    print("email>>>>>${emailController.text}");
    print("phone>>>>>${contactController.text}");
    print("phone code>>>>>${countryCode.value}");

    try {
      dio.FormData params = dio.FormData.fromMap({
        'customer_id':  userID.value.toString(),
        'customer_name': nameController.text.toString(),
        'customer_email': emailController.text.toString(),
        'customer_phone':contactController.text.toString(),
        'country_code': countryCode.value.toString(),
      });
      if (fileCompressImage.toString().isNotEmpty) {
        params.files.add(MapEntry("profile_image", await dio.MultipartFile.fromFileSync(fileCompressImage.toString())));
      }

      print('Update Data');

      BaseModel userModel = await ApiProvider.baseWithToken().funUpdateProfile(params);
      // progressDialog.dismiss();
      isPageLoad.value = false;
      print('Update Data after api hit');
      print(userModel.message);
      if (userModel.result == 1) {
        successToast(userModel.message!);
        isPageLoad.value = false;
        print("UserIddd");
        Get.back(result:true);
      } else {
        successToast(userModel.message!);
        isPageLoad.value = false;
      }
    } on HttpException catch (exception) {
      print(exception.message);
      isPageLoad.value = false;
    } catch (exception) {
      print(exception.toString());
      isPageLoad.value = false;
    }
  }



}