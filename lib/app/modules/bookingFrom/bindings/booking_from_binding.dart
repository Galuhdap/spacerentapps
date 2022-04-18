import 'package:get/get.dart';

import '../controllers/booking_from_controller.dart';

class BookingFromBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingFromController>(
      () => BookingFromController(),
    );
  }
}
