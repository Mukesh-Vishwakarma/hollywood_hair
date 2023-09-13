import 'package:get/get.dart';


import 'signUp_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(
          () => SignUpController(),
    );
  }
}
