import 'package:get/get.dart';

import 'languages_controller.dart';

class LanguagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguagesController>(
      () => LanguagesController(),
    );
  }
}
