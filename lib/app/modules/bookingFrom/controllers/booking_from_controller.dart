import 'package:get/get.dart';

class BookingFromController extends GetxController {
  final selected = "some book type".obs;

  void setSelected(String value) {
    selected.value = value;
  }
}
