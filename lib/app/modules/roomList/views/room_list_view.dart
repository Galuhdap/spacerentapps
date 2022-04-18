import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';

import '../controllers/room_list_controller.dart';

class RoomListView extends GetView<RoomListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 20),
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
                  Icons.add,
                  size: 30,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 40),
            child: SizedBox(
              height: 650,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  listRoom(
                    txt1: 'Meeting Room 1',
                    txt2: 'Main Building | 1st Floor | 5 people',
                  ),
                  listRoom(
                    txt1: 'Meeting Room 2',
                    txt2: 'Main Building | 1st Floor | 5 people',
                  ),
                  listRoom(
                    txt1: 'Meeting Room 3',
                    txt2: 'Main Building | 1st Floor | 5 people',
                  ),
                  listRoom(
                    txt1: 'Meeting Room 3',
                    txt2: 'Main Building | 1st Floor | 5 people',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  InkWell listRoom({txt1, txt2}) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.ROOM);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            txt1,
            style: GoogleFonts.inter(
              fontSize: 15,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            txt2,
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
            height: 20,
          )
        ],
      ),
    );
  }
}
