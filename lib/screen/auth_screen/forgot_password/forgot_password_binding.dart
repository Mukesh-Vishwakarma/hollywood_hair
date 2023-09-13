import 'package:get/get.dart';

import 'forgot_password_controller.dart';



class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotScreenController>(
          () => ForgotScreenController(),
    );
  }
}
