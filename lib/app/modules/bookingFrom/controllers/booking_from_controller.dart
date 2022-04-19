import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingFromController extends GetxController {
  final selected = "satu jam".obs;
  var time = TimeOfDay.now().obs;
  var calender = DateTime.now().obs;

  List<String> listType = ['satu jam', 'dua jam', 'tiga jam', 'empat jam'];

  void setSelected(String value) {
    selected.value = value;
  }

  void chosetime() async {
    TimeOfDay? pickedtime = await showTimePicker(
      context: Get.context!,
      initialTime: time.value,
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (pickedtime != null && pickedtime != time.value) {
      time.value = pickedtime;
    }
  }

  void kalender() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: calender.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );

    if (picked != null && picked != calender.value) {
      calender.value = picked;
    }
  }
}
