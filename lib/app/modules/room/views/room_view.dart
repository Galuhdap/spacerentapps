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
                  height: 10,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                height: 170, // constrain height
                child: ListView(
                  // padding: const EdgeInsets.only(bottom: 10),
                  scrollDirection: Axis.horizontal,
                  children: controller.data.images_url.map((e) => roomImage(img: NetworkImage(e))).toList(),
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
                    controller.data.title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    controller.data.caption,
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
                    height: 10,
                  ),
                  InkWell(
                    radius: 25,
                    onTap: (() {
                      Get.toNamed(Routes.MAPS, arguments: controller.data);
                    }),
                    child: Container(
                      width: 300,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://maps.googleapis.com/maps/api/staticmap?center=" + controller.data.lat.toString() + "," + controller.data.lng.toString() + "&zoom=13&size=600x300&maptype=normal&key=AIzaSyBTtOzSrDJ2PegkXBGdW4jdWt_wRFUz5oY&markers=color:red|" + controller.data.lat.toString() + "," + controller.data.lng.toString()),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 180, // constrain height
                    child: ListView(children: [Text(
                      controller.data.description,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                      ),
                    ),],),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.BOOKING_FROM, arguments: controller.data);
                      },
                      child: Container(
                        width: 290,
                        height: 60,
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

  Row roomImage({img}) {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Container(
          width: 280,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
            image: DecorationImage(image: img, fit: BoxFit.cover),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: Offset(3.0, 5.0),
                blurRadius: 4,
                spreadRadius: 3,
              )
            ],
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
