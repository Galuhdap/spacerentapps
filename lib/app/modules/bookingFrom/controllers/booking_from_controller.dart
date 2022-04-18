import 'package:get/get.dart';

class BookingFromController extends GetxController {
  final selected = "satu".obs;

  List<String> listType = ['satu', 'dua'];

  void setSelected(String value) {
    selected.value = value;
  }
}
