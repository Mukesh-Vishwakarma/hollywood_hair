import 'package:get/get.dart';
import 'package:hollywood_hair/model/notification_model.dart';
import 'package:hollywood_hair/util/assets.dart';

class NotificationController extends GetxController {
  var notificationList = <NotificationModel>[];

  @override
  void onInit() {
    // TODO: implement onInit
    notificationList = [
      NotificationModel(
          title: "Your Password Has been changed.",
          dis: "password update successful",
          image: Assets.notification1),


      NotificationModel(
          title: "Your cart is getting heavy!",
          dis: "Time to checkout and enjoy your selections",
          image: Assets.notification2),



      NotificationModel(
          title: "Booking Confirmed!",
          dis: "Dear Alicja Nowak, your appointment at Hollywood Hair is confirmed for 1 Aug, 2023 at 10:15 AM",
          image: Assets.notification1),

      NotificationModel(
          title: "Embrace Self-Care Sundays! 🌼",
          dis: "Refer a friend to Hollywood hair, and you both get 10% OFF on your next visit.",
          image: Assets.notification3),



    ];
    super.onInit();
  }
}
