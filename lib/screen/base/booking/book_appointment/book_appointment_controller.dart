import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookAppointmentController extends GetxController {
  var nameController = TextEditingController();
  var dateTimeController = TextEditingController();

  var dateFocusNode = FocusNode();

  var timeList = ['10:00 AM','10:30 AM','11:00 AM','11:30 AM','12:00 AM','12:30 AM','01:00 AM','01:30 AM','02:00 AM'].obs;


  var name ="".obs;
  var dateTime ="".obs;
  var selectTime = "".obs;



}