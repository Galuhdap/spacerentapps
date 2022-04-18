import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/booking_from_controller.dart';

class BookingFromView extends GetView<BookingFromController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
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
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Meeting Room 1',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Main Building | 1st Floor | 5 people',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Nama Penyewa',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 211, 211, 211),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        autocorrect: false,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "enter your name here",
                          hintStyle: GoogleFonts.inter(
                            fontSize: 15,
                            color: Color.fromARGB(255, 150, 149, 149),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tanggal Mulai',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 211, 211),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '20 Januari 2022',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 150, 149, 149),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                            'assets/img/iconcalender.png')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jam Mulai',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 211, 211),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '08:00',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 150, 149, 149),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.timer,
                                        color: Color(0xfffB4B4B4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tanggal Selesai',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: 180,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 211, 211),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '20 Januari 2022',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 150, 149, 149),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                            'assets/img/iconcalender.png')),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Jam Selesai',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 211, 211, 211),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '08:00',
                                      style: GoogleFonts.inter(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 150, 149, 149),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.timer,
                                        color: Color(0xfffB4B4B4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Catatan',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 211, 211, 211),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        autocorrect: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: "enter your name here",
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 99,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
