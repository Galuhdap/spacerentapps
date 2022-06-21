import 'package:get/get.dart';

import '../modules/announcement/bindings/announcement_binding.dart';
import '../modules/announcement/views/announcement_view.dart';
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
import '../modules/maps/bindings/maps_binding.dart';
import '../modules/maps/views/maps_view.dart';
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
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DASBOARD,
      page: () => DasboardView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: DasboardBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGS,
      page: () => BookingsView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: BookingsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_FROM,
      page: () => BookingFromView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: BookingFromBinding(),
    ),
    GetPage(
      name: _Paths.ROOM_LIST,
      page: () => RoomListView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: RoomListBinding(),
    ),
    GetPage(
      name: _Paths.ROOM,
      page: () => RoomView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: RoomBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ANNOUNCEMENT,
      page: () => AnnouncementView(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 400),
      binding: AnnouncementBinding(),
    ),
    GetPage(
      name: _Paths.MAPS,
      page: () => MapsView(),
      binding: MapsBinding(),
    ),
  ];
}
