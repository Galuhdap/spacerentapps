import 'package:get/get.dart';
import 'package:spacerent_app/models/Room.dart';

class RoomController extends GetxController {
  //TODO: Implement RoomController

  Room data = Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
