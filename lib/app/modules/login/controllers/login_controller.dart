import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:spacerent_app/utils/authentication.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  void loading() async {
    isLoading.value = true;

    SnackbarController controller = Get.showSnackbar(
      GetSnackBar(
        title: "Autentifikasi",
        message: "Sedang mencoba masuk....",
        isDismissible: false,
      ),
    );

    String resp = await Authentication.signInWithGoogle();

    debugPrint('resp: $resp');

    controller.close();
    isLoading.value = false;

    if (resp == "Success") {
      Get.toNamed('/dasboard');
    } else {
      Get.showSnackbar(
        GetSnackBar(
          title: "Autentifikasi Bermasalah",
          message: resp,
          isDismissible: true,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
