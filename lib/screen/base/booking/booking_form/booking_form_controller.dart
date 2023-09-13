import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingFormController extends GetxController {
  final formLoginKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var ageController = TextEditingController();
  var genderController = TextEditingController();
  var serviceController = TextEditingController();
  var locationController = TextEditingController();



  var name ="".obs;
  var phoneNumber ="".obs;
  var age ="".obs;
  var gender ="".obs;
  var service ="".obs;
  var location ="".obs;




}