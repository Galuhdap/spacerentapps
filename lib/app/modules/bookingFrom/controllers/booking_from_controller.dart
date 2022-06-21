import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';
import 'package:spacerent_app/models/Booking.dart';
import 'package:spacerent_app/models/Room.dart';

class BookingFromController extends GetxController {
  Room data = Get.arguments;

  final selected = "1 hours".obs;
  var time = TimeOfDay.now().obs;
  var calender = DateTime.now().add(Duration(days: 1)).obs;

  var isLoading = false.obs;

  List<String> listType = ['1 hours', '2 hours', '3 hours', '4 hours'];

  String displayDate() {
    return '${calender.value.day.toString().padLeft(2, '0')}/${calender.value.month.toString().padLeft(2, '0')}/${calender.value.year}';
  }

  String displayTime() {
    return '${time.value.hour.toString().padLeft(2, '0')}:${time.value.minute.toString().padLeft(2, '0')}';
  }

  void setSelected(String value) {
    selected.value = value;
  }

  void submit() async {
    isLoading.value = true;
    User user = FirebaseAuth.instance.currentUser!;
    final ref = FirebaseDatabase.instance.ref("bookings/" + user.uid);

    int nextRentalAt = new DateTime(calender.value.year, calender.value.month,
            calender.value.day, time.value.hour, time.value.minute)
        .millisecondsSinceEpoch;

    final payload = {
      "room": data.toJson(),
      "detail":
          "${displayDate()}, ${displayTime()} (${selected.value.toString()})",
      "status": "pending",
      "qr_code": "",
      "message": "Your booking is still processed",
      "booked_at": DateTime.now().millisecondsSinceEpoch,
      "rental_at": nextRentalAt,
    };

    print(payload);

    final pushRef = ref.push();

    await pushRef.set(payload);

    Future.delayed(Duration(seconds: 10), (() async {
      if (data.title == "Rome Space") {
        await pushRef.update({
          "status": "rejected",
          "qr_code": "",
          "message": "Your booking has been rejected because the room is full",
        });
      } else {
        await pushRef.update({
          "status": "confirmed",
          "qr_code": DateTime.now().millisecondsSinceEpoch.toString(),
          "message": "Your booking has been confirmed",
        });

        final nextRef = FirebaseDatabase.instance.ref('nexts/' + user.uid);
        final snapshot = await nextRef.get();

        int prevRentalAt = 9999999999999;
        if (snapshot.exists) {
          var nextBooking = Booking.fromJson(
              new Map<String, dynamic>.from(snapshot.value as Map));
          prevRentalAt = nextBooking.rental_at;
        }

        if (prevRentalAt > nextRentalAt) {
          final finalData = await pushRef.get();
          await nextRef.set(finalData.value);
        }
      }
    }));

    isLoading.value = false;

    Get.showSnackbar(
      GetSnackBar(
        title: "Thank You",
        message: "Your booking is still processed",
        isDismissible: true,
        duration: Duration(seconds: 5),
      ),
    );

    Get.offAllNamed(Routes.DASBOARD);
  }

  void chosetime() async {
    TimeOfDay? pickedtime = await showTimePicker(
        context: Get.context!,
        initialTime: time.value,
        initialEntryMode: TimePickerEntryMode.input,
        builder: (context, childWidget) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                  // Using 24-Hour format
                  alwaysUse24HourFormat: true),
              // If you want 12-Hour format, just change alwaysUse24HourFormat to false or remove all the builder argument
              child: childWidget!);
        });
    if (pickedtime != null && pickedtime != time.value) {
      time.value = pickedtime;
    }
  }

  void kalender() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: calender.value,
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (picked != null && picked != calender.value) {
      calender.value = picked;
    }
  }
}
