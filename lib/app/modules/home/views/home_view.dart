import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
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
                            borderRadius: BorderRadius.circular(10),
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
                            Text(
                              'Meeting Room 21',
                              style: GoogleFonts.inter(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '15 February 2020, 12.30 - 14.30',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
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
              height: 35,
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
                    onPressed: () {},
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    listRooms(
                        img: AssetImage("assets/img/room.jpeg"),
                        txt: "Meeting Room 1"),
                    SizedWidthList(),
                    listRooms(
                      img: AssetImage("assets/img/meet2.jpeg"),
                      txt: "Meeting Room 2",
                    ),
                    SizedWidthList(),
                    listRooms(
                        img: AssetImage("assets/img/meet3.jpeg"),
                        txt: "Meeting Room 3"),
                    SizedWidthList(),
                    listRooms(
                        img: AssetImage("assets/img/meet4.jpeg"),
                        txt: "Meeting Room 4"),
                  ],
                ),
              ),
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
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 20,
                    ),
                  ),
                ],
              ),
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

  Column Announcement() {
    return Column(
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
    );
  }

  SizedBox SizedWidthList() {
    return SizedBox(
      width: 20,
    );
  }

  Column listRooms({txt, img}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: img,
              fit: BoxFit.cover,
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          txt,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
