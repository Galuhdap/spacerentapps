import 'package:get/get.dart';

import '../modules/bookingFrom/bindings/booking_from_binding.dart';
import '../modules/bookingFrom/views/booking_from_view.dart';
import '../modules/bookings/bindings/bookings_binding.dart';
import '../modules/bookings/views/bookings_view.dart';
import '../modules/dasboard/bindings/dasboard_binding.dart';
import '../modules/dasboard/views/dasboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/room/bindings/room_binding.dart';
import '../modules/room/views/room_view.dart';
import '../modules/roomList/bindings/room_list_binding.dart';
import '../modules/roomList/views/room_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASBOARD,
      page: () => DasboardView(),
      binding: DasboardBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS,
      page: () => BookingsView(),
      binding: BookingsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_FROM,
      page: () => BookingFromView(),
      binding: BookingFromBinding(),
    ),
    GetPage(
      name: _Paths.ROOM_LIST,
      page: () => RoomListView(),
      binding: RoomListBinding(),
    ),
    GetPage(
      name: _Paths.ROOM,
      page: () => RoomView(),
      binding: RoomBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
