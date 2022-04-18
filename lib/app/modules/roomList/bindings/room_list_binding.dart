import 'package:get/get.dart';

import '../controllers/room_list_controller.dart';

class RoomListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomListController>(
      () => RoomListController(),
    );
  }
}
