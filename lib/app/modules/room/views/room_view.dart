import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';

import '../controllers/room_controller.dart';

class RoomView extends GetView<RoomController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                Text(
                  'Book A Room',
                  style: GoogleFonts.inter(
                    fontSize: 25,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 120,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.format_list_bulleted_rounded,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: SizedBox(
                height: 155, // constrain height
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    listRoom(),
                    listRoom(),
                    listRoom(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meeting Room 2',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Main Building | 1st Floor | 5 people',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    width: 310,
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 320,
                    height: 300,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque bibendum semper arcu id tempus. Vestibulum elementum fringilla congue. Sed justo ante, tincidunt at purus vel, tristique interdum massa. Pellentesque cursus tortor ut quam tempus dapibus. Aliquam quis pulvinar lorem. Sed eleifend, orci eget dictum facilisis, augue ligula feugiat nibh, eu malesuada sapien eros ut felis. Aenean imperdiet metus a tortor finibus, vitae malesuada lorem condimentum. Pellentesque scelerisque elit in sapien feugiat imperdiet. Aenean mollis nisi vel nisl iaculis semper. Pellentesque ultrices accumsan auctor. ',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.BOOKING_FROM);
                      },
                      child: Container(
                        width: 290,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Book This Room',
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row listRoom() {
    return Row(
      children: [
        Container(
          width: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
