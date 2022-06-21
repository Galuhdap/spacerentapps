import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';
import '../controllers/room_list_controller.dart';

String jsonData = '''[
  {
    "id": 1,
    "title": "Meeting Room 1",
    "caption": "Main Building | 1st Floor | 5 people",
    "description": "Ruangan nyaman dan besar cocok untuk kerja bersaman teman kantor",
    "image_url": "https://asset.kompas.com/crops/jfCnwcNPGv_aQarcPao_hF8axgI=/0x0:750x500/750x500/data/photo/2021/05/17/60a286514f505.jpg"
  },
  {
    "id": 2,
    "title": "Meeting Room 1",
    "caption": "Main Building | 1st Floor | 5 people",
    "description": "Ruangan nyaman dan besar cocok untuk kerja bersaman teman kantor",
    "image_url": "https://asset.kompas.com/crops/jfCnwcNPGv_aQarcPao_hF8axgI=/0x0:750x500/750x500/data/photo/2021/05/17/60a286514f505.jpg"
  }
]''';

class Room {
  Room({required this.title, required this.caption, required this.description, required this.image_url});
  final String title; 
  final String caption; 
  final String description; 
  final String image_url; 

  factory Room.fromJson(Map<String, dynamic> data) {
    final title = data['title'] as String; // cast as non-nullable String
    final caption = data['caption'] as String; // cast as non-nullable String
    final description = data['description'] as String; // cast as non-nullable String
    final image_url = data['image_url'] as String; // cast as non-nullable String
    
    return Room(title: title, caption: caption, description: description, image_url: image_url);
  }
}

final parsedJson = jsonDecode(jsonData) as List;
List<Room> rooms = parsedJson.map((room) => Room.fromJson(room)).toList();
class RoomListView extends GetView<RoomListController> {
  @override
  Widget build(BuildContext context) {
    print(rooms);
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
              child: 
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  print(rooms[index]);
                  return listRoom(
                    img: NetworkImage(rooms[index].image_url),
                    txt1: rooms[index].title,
                    txt2: rooms[index].caption
                  );
                  },
                itemCount: rooms.length,
  )              
            ),
          )
        ],
      ),
    ));
  }

  InkWell listRoom({txt1, txt2, img}) {
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
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: img,
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
