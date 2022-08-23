import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:spacerent_app/app/modules/bookings/views/bookings_view.dart';
import 'package:spacerent_app/models/Booking.dart';
import 'package:spacerent_app/models/Room.dart';

import '../app/routes/app_pages.dart';

class NotificationService {
  //Singleton pattern
  static final NotificationService _notificationService =
      NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  NotificationService._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    //Initialization Settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    //Initialization Settings for iOS
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await NotificationService().flutterLocalNotificationsPlugin.initialize(
          initializationSettings,
          onSelectNotification: selectNotification,
        );
  }

  Future<void> showNotifications(String title, body, payload) async {
    const _androidNotificationDetails = AndroidNotificationDetails(
      'channel ID',
      'channel name',
      'channel description',
      playSound: true,
      priority: Priority.high,
      importance: Importance.high,
    );
    const platformChannelSpecifics =
        NotificationDetails(android: _androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      final data = json.decode(payload);
      final booking =
          Booking.fromJson(new Map<String, dynamic>.from(data as Map));
      BookingsView.showBoxDetail(booking, Get.context!);
    }
  }
}
