import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/static_model.dart';
import 'package:hollywood_hair/util/common_function.dart';
import 'package:html/parser.dart';

class StaticController extends GetxController {
  var title = "".obs;
  var apiType = ''.obs;
  var appContentText = ''.obs;
  var appContentTextHtml = ''.obs;
  var isPageLoad = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    title.value = Get.arguments??"";
    print("ScreenTypee>>>$title");

    if(title.value =='Terms & condition'){
      apiType.value ='Terms';
    }else{
      apiType.value ='Privacy';

    }
    staticApi();
    super.onInit();
  }

  //here goes the function
  String? parseHtmlString(String htmlString) {

    final document = parse(htmlString);
    final String? parsedString =
        parse(document.body?.text).documentElement?.text;

    return appContentText.value = parsedString.toString();
  }


  staticApi() async {
    appContentTextHtml.value = '';
    try {
      dio.FormData params = dio.FormData.fromMap({
        'type':apiType.value.toString(),

      });
      print('create Data');
      print(params.toString());
      StaticModel staticModel = await ApiProvider.base().funStaticPage(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();

      print(staticModel.result);
      if (staticModel.result == 1) {
        parseHtmlString(staticModel.data!.description.toString());
        appContentTextHtml.value = staticModel.data!.description.toString();


      } else {
        successToast(staticModel.msg!);
      }
    } on HttpException catch (exception) {
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print(exception.message);
      // failedToast(exception.message);
    } catch (exception) {
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print(exception.toString());
      // failedToast(exception.toString());
    }
  }


}