import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:spacerent_app/models/Booking.dart';

class HomeController extends GetxController {
  var isNextLoading = true.obs;
  final Rx<Booking?> nextBooking = Rx<Booking?>(null);

  void init() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final ref = FirebaseDatabase.instance.ref('');
    await ref.child('nexts/' + user.uid).onValue.listen((DatabaseEvent event) {
      if (event.snapshot.exists) {
        nextBooking.value = Booking.fromJson(new Map<String, dynamic>.from(event.snapshot.value as Map));
      }
      isNextLoading.value = false;
    });
  }
}
