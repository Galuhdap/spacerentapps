import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/announcement_controller.dart';

class AnnouncementView extends GetView<AnnouncementController> {
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
              SizedBox(
                width: 50,
              ),
              Text(
                'Announcement',
                style: GoogleFonts.inter(
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: 300,
            height: 500,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque bibendum semper arcu id tempus. Vestibulum elementum fringilla congue. Sed justo ante, tincidunt at purus vel, tristique interdum massa. Pellentesque cursus tortor ut quam tempus dapibus. Aliquam quis pulvinar lorem. Sed eleifend, orci eget dictum facilisis, augue ligula feugiat nibh, eu malesuada sapien eros ut felis. Aenean imperdiet metus a tortor finibus, vitae malesuada lorem condimentum. Pellentesque scelerisque elit in sapien feugiat imperdiet. Aenean mollis nisi vel nisl iaculis semper. Pellentesque ultrices accumsan auctor. ',
              style: GoogleFonts.inter(
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
