import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spacerent_app/app/modules/bookings/views/bookings_view.dart';
import 'package:spacerent_app/app/modules/home/views/home_view.dart';
import 'package:spacerent_app/app/modules/profile/views/profile_view.dart';

import '../controllers/dasboard_controller.dart';

class DasboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final home = GlobalKey<NavigatorState>();
    final bookings = GlobalKey<NavigatorState>();
    final profile = GlobalKey<NavigatorState>();
    return GetBuilder<DasboardController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            index: controller.tabIndex,
            children: [
              Navigator(
                key: home,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => HomeView(),
                ),
              ),
              Navigator(
                key: bookings,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => BookingsView(),
                ),
              ),
              Navigator(
                key: profile,
                onGenerateRoute: (route) => MaterialPageRoute(
                  settings: route,
                  builder: (context) => ProfileView(),
                ),
              ),
            ],
          )),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white,
            iconSize: 30,
            backgroundColor: Color(0xFFF74B9FF),
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.date_range),
                label: 'Bookings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
