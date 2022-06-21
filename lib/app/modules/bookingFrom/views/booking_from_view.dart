import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';
import 'package:spacerent_app/utils/authentication.dart';

import '../controllers/booking_from_controller.dart';

class BookingFromView extends GetView<BookingFromController> {
  @override
  Widget build(BuildContext context) {
    var ctrl = Get.put(BookingFromController());
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
                      controller.data.title,
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
                      controller.data.caption,
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
                      'Tenant Name',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      FirebaseAuth.instance.currentUser?.displayName
                              .toString() ??
                          "",
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
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
                              'Rental Date',
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
                              width: 170,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 236, 236),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0.0, 4.0),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Obx(() => Text(
                                          controller.displayDate(),
                                          style: GoogleFonts.inter(
                                            fontSize: 18,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        )),
                                    InkWell(
                                        onTap: () {
                                          controller.kalender();
                                        },
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
                              'Rental Time',
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
                              width: 110,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 236, 236),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    offset: Offset(0.0, 4.0),
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Obx(
                                      () => Text(
                                        controller.displayTime(),
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 13,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          controller.chosetime();
                                        },
                                        child: Image.asset(
                                            'assets/img/timericon.png')),
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
                      'Rental Duration',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Obx(
                      () => Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 240, 236, 236),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0.0, 4.0),
                              blurRadius: 4,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black,
                              ),
                              iconSize: 30,
                              isExpanded: true,
                              hint: Text(
                                'Book Type',
                              ),
                              onChanged: (String? newValue) {
                                controller.setSelected(newValue!);
                              },
                              value: controller.selected.value,
                              items: controller.listType.map((selectedType) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    selectedType,
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  value: selectedType,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    ctrl.submit();
                  },
                  child: Obx(() => controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: Colors.blue,
                          ):
                  Container(
                                      width: 290,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.3),
                                            offset: Offset(0.0, 4.0),
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Confirm Booking',
                                          style: GoogleFonts.inter(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
