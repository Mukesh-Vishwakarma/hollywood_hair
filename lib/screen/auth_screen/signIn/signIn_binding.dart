import 'package:get/get.dart';


import 'signIn_controller.dart';

class SignINBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(
          () => SignInController(),
    );
  }
}
