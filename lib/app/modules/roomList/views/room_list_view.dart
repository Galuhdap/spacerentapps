import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/database.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';
import 'package:spacerent_app/models/Room.dart';
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
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 40),
            child: SizedBox(
              height: 650,
              child: FirebaseDatabaseListView(
                  query: FirebaseDatabase.instance.ref('rooms'),
                  itemBuilder: (context, snapshot) {
                    Room room = Room.fromJson(new Map<String, dynamic>.from(snapshot.value as Map));
                    return listRoom(room);
                  }),
            ),
          )
        ],
      ),
    ));
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
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(room.image_url),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 4,
                  spreadRadius: 3,
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
              fontSize: 15,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            room.caption,
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
