import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  void loading() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 3), () {
      isLoading.value = false;
      Get.toNamed('/dasboard');
    });
  }
}
