import 'package:get/get.dart';

import 'my_appointment_controller.dart';

class MyAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAppointmentController>(
          () => MyAppointmentController(),
    );
  }
}