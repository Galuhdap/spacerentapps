import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:spacerent_app/app/modules/bookings/views/bookings_view.dart';
import 'package:spacerent_app/app/modules/dasboard/views/dasboard_view.dart';
import 'package:spacerent_app/app/modules/home/views/home_view.dart';
import 'package:spacerent_app/app/modules/profile/views/profile_view.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  User? user = FirebaseAuth.instance.currentUser;
  runApp(
    GetMaterialApp(
      initialRoute: user == null ? Routes.LOGIN : Routes.DASBOARD,
      title: "Application",
      getPages: AppPages.routes,
    ),
  );
}
