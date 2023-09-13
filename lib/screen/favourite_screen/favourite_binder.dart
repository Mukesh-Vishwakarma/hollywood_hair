import 'package:get/get.dart';
import 'package:hollywood_hair/screen/favourite_screen/favourite_controller.dart';

class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouriteController>(
      () => FavouriteController(),
    );
  }
}
