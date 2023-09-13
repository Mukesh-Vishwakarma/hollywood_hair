
import 'package:get/get.dart';

import 'booking_form_controller.dart';

class BookingFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingFormController>(
          () => BookingFormController(),
    );
  }
}