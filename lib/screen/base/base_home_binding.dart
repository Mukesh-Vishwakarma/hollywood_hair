import 'package:get/get.dart';


import 'base_home_controller.dart';
import 'booking/booking_controller.dart';
import 'cart_screen/cart_controller.dart';
import 'home_screen/home_controller.dart';
import 'profile/profile_controller.dart';

class BaseHomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<BaseHomeController>(
          () => BaseHomeController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );

    Get.lazyPut<BookingController>(
          () => BookingController(),
    );

    Get.lazyPut<CartController>(
          () => CartController(),
    );  Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
