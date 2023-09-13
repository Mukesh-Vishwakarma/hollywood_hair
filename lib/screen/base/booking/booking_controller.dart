import 'package:get/get.dart';
import 'package:hollywood_hair/util/assets.dart';

class BookingController extends GetxController {
  var bookingList = <BookingModel>[];

  @override
  void onInit() {
    // TODO: implement onInit
    bookingList = [
      BookingModel(
          text: "Style Selection Consultation",
          description: "Consult with experts",
      image: Assets.demo1),
      BookingModel(
          text: "Book In-Store Appointment",
          description: "Unlock your perfect look",
          image: Assets.demo2),
    ];
    super.onInit();
  }
}

class BookingModel {
  final String? text;
  final String? description;
  final String? image;

  BookingModel({this.text, this.description, this.image});
}
