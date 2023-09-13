import 'dart:io';

import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:hollywood_hair/api_provider/api_provider.dart';
import 'package:hollywood_hair/model/faq_model.dart';

class FaqController extends GetxController {


  var isPageLoad = true.obs;
 var faqList = <FaqData>[].obs;



  @override
  void onInit() {
    faqApi();
    super.onInit();
  }





  //**** faq api

  faqApi() async {

    try {
      dio.FormData params = dio.FormData.fromMap({
        'type': 'Faqs',
      });
      print('create Data');
      print(params.toString());
      FaqModel faqModel = await ApiProvider.base().funFaq(params);
      isPageLoad.value = false;
      // progressDialog.dismiss();
      print('create Data');
      print(faqModel.result);
      if (faqModel.result == "1") {
        faqList.value = faqModel.data!;


      } else {
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








}