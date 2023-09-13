
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hollywood_hair/util/app_constants.dart';
import 'package:hollywood_hair/util/common_function.dart';

class AuthServices extends GetxService {
  GetStorage box = GetStorage();

  Future<AuthServices> init() async {
    saveDeviceType();
    // saveDeviceToken();
    checkInternetConnection();

    return this;
  }

  saveDeviceType() {
    if (GetPlatform.isAndroid) {
      GetStorage().write(AppConstants.deviceType, 'Android');
    } else {
      GetStorage().write(AppConstants.deviceType, 'iOS');
    }
  }

  getDeviceType() {
    if (box.read(AppConstants.deviceType) == null) {
      saveDeviceType();
      return box.read(AppConstants.deviceType);
    } else {
      return box.read(AppConstants.deviceType);
    }
  }


  // saveDeviceToken() async {
  //   try {
  //     var token = await FirebaseMessaging.instance.getToken();
  //     print('fcmToken:>>>$token');
  //     box.write(AppConstants.deviceToken, token);
  //     GetStorage().write(AppConstants.firebaseToken, token);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
  //
  // getDeviceToken() async {
  //   var deviceToken = box.read(AppConstants.deviceToken);
  //
  //   if (deviceToken == null) {
  //     try {
  //       var token = await FirebaseMessaging.instance.getToken();
  //       box.write(AppConstants.deviceToken, token);
  //       print('fcmNewToken:>>>$token');
  //       return token;
  //     } catch (e) {
  //       debugPrint(e.toString());
  //       return '';
  //     }
  //   } else {
  //     print('fcmToken:>>>$deviceToken');
  //     return deviceToken;
  //   }
  // }

  checkInternetConnection()async{

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult ==ConnectivityResult.none) {
      failedToast('Internet connection failed');
      print("notConnection");
    }
    else{
      print("Connection");
    }
  }

  // void isLogout(context) {
  //   Navigator.pop(context);
  //   ProgressDialog progressDialog = ProgressDialog();
  //   progressDialog.show();
  //   Future.delayed(const Duration(seconds: 1), () {
  //     GetStorage().remove(AppConstants.loginUser);
  //     GetStorage().remove(AppConstants.accessToken);
  //     GetStorage().remove(AppConstants.deviceToken);
  //     GetStorage().remove(AppConstants.deviceType);
  //     GetStorage().remove(AppConstants.isLogged);
  //     GetStorage().remove(AppConstants.profileStep);
  //     GetStorage().remove(AppConstants.userImage);
  //     GetStorage().remove(AppConstants.userName);
  //     progressDialog.dismiss();
  //     Get.offAllNamed(AppRoutes.welcomeScreen);
  //   });
  // }
}
