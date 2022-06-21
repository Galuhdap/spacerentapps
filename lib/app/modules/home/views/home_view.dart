import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/modules/bookings/views/bookings_view.dart';
import 'package:spacerent_app/models/Room.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(HomeController());
    ctrl.init();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 245,
                  color: Color(0xfff74B9FF),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Space \nRent',
                          style: GoogleFonts.inter(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/img/meeting-room.png"),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.2),
                                blurRadius: 9.0,
                                spreadRadius: 2.0,
                                offset: Offset(0.0, 5.0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 180),
                    child: Container(
                      width: 310,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 2),
                            blurRadius: 5,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'My Next Booking',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(
                              () => controller.isNextLoading.value
                                  ? Text(
                                      'Loading data...',
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : (controller.nextBooking.value == null
                                      ? Text('No booking available!',
                                          style: GoogleFonts.inter(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ))
                                      : InkWell(
                                          onTap: () {
                                            BookingsView.showBoxDetail(
                                                controller.nextBooking.value!,
                                                context);
                                          },
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  (controller.nextBooking.value!)
                                                      .room
                                                      .title,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  (controller.nextBooking.value!)
                                                      .detail,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ]))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 33),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Rooms',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.toNamed(Routes.ROOM_LIST);
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: SizedBox(
                  height: 180, // constrain height
                  child: FirebaseDatabaseListView(
                      scrollDirection: Axis.horizontal,
                      query: FirebaseDatabase.instance.ref('rooms'),
                      itemBuilder: (context, snapshot) {
                        Room room = Room.fromJson(new Map<String, dynamic>.from(
                            snapshot.value as Map));
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: listRoom(room),
                        );
                      })),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 42),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Annoucements',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: Column(
                children: [
                  Announcement(),
                  Announcement(),
                  Announcement(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell Announcement() {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ANNOUNCEMENT);
      },
      child: Column(
        children: [
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam bibendum maximus lorem. ',
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 300,
            height: 1,
            color: Color.fromARGB(255, 205, 205, 205),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  SizedBox SizedWidthList() {
    return SizedBox(
      width: 20,
    );
  }

  InkWell listRoom(Room room) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ROOM, arguments: room);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(room.image_url),
                fit: BoxFit.cover,
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 5,
                  spreadRadius: 2,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            room.title,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
