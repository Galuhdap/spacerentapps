import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spacerent_app/app/modules/bookings/views/bookings_view.dart';
import 'package:spacerent_app/app/modules/dasboard/views/dasboard_view.dart';
import 'package:spacerent_app/app/modules/home/views/home_view.dart';
import 'package:spacerent_app/app/modules/profile/views/profile_view.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      title: "Application",
      getPages: AppPages.routes,
    ),
  );
}
