import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';
import 'package:spacerent_app/models/Booking.dart';

import '../controllers/bookings_controller.dart';

class BookingsView extends GetView<BookingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'My Booking',
                style: GoogleFonts.inter(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.ROOM_LIST);
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.blue,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          FirebaseDatabaseListView(
              reverse: true,
              shrinkWrap: true,
              query: FirebaseDatabase.instance.ref(
                  'bookings/' + (FirebaseAuth.instance.currentUser?.uid ?? "")),
              itemBuilder: (context, snapshot) {
                Booking booking = Booking.fromJson(
                    new Map<String, dynamic>.from(snapshot.value as Map));
                return listBooking(booking, context);
              }),
          // InkWell(
          //   onTap: () {
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext context) {
          //         return AlertDialog(
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.all(Radius.circular(20.0))),
          //           backgroundColor: Color.fromARGB(255, 255, 255, 255),
          //           content: Container(
          //             height: 220,
          //             width: 200,
          //             decoration: BoxDecoration(
          //               image: DecorationImage(
          //                   image: AssetImage("assets/img/qr2.png"),
          //                   fit: BoxFit.cover),
          //             ),
          //           ),
          //         );
          //       },
          //     );
          //   },
          //   child:
          //   Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Meeting Room 12',
          //         style: GoogleFonts.inter(
          //           fontSize: 18,
          //           color: Color.fromARGB(255, 0, 0, 0),
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 5,
          //       ),
          //       Text(
          //         '20 April 2022,  12.30 - 14.30',
          //         style: GoogleFonts.inter(
          //           fontSize: 15,
          //           color: Color.fromARGB(255, 0, 0, 0),
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 20,
          //       ),
          //       Container(
          //         width: 310,
          //         height: 1,
          //         color: Colors.grey,
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
    ));
  }

  static void showBoxDetail(Booking booking, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          content: booking.status == "confirmed"
              ? Container(
                  height: 520,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        booking.room.title,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "QR CODE:",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=" +
                                      booking.qr_code),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "STATUS:",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        booking.status,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MESSAGE:",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        booking.message,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ROOM, arguments: booking.room);
                        },
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6),
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
                              'Room Details',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
              : Container(
                  height: 250,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        booking.room.title,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "STATUS:",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        booking.status,
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MESSAGE:",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        booking.message,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ROOM, arguments: booking.room);
                        },
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(6),
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
                              'Room Details',
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
        );
      },
    );
  }

  InkWell listBooking(Booking booking, BuildContext context) {
    return InkWell(
      onTap: () {
        showBoxDetail(booking, context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            booking.room.title,
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            booking.detail,
            style: GoogleFonts.inter(
              fontSize: 15,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 380,
            height: 1,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
