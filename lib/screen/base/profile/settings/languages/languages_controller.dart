import 'package:get/get.dart';
import 'package:hollywood_hair/model/lang_model.dart';

class LanguagesController extends GetxController {
  var languageList = <LanguageModel>[].obs;
var selectLang = "".obs;
  @override
  void onInit() {
    // TODO: implement onInit
    languageList.value = [
      LanguageModel(text: "English"),
      LanguageModel(text: "Polski"),
      LanguageModel(text: "española"),
    ];
    super.onInit();


  }
}
