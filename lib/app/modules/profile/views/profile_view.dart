import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';
import 'package:spacerent_app/utils/authentication.dart';
import 'package:spacerent_app/utils/notification_service.dart';

import '../../login/views/login_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 67, 65, 63),
                borderRadius: BorderRadius.circular(50),
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser?.photoURL ?? ""),
                minRadius: 70,
                maxRadius: 100,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Hello',
              style: GoogleFonts.inter(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              FirebaseAuth.instance.currentUser?.displayName.toString() ?? "",
              style: GoogleFonts.inter(
                fontSize: 25,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              "( " +
                  (FirebaseAuth.instance.currentUser?.email.toString() ?? "") +
                  " )",
              style: GoogleFonts.inter(
                fontSize: 18,
                color: Colors.lightBlue,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: () async {
                await Authentication.signOut();
                Get.offAll(LoginView());
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(1, 3),
                      blurRadius: 7,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: Center(
                  child: Text(
                    "Logout",
                    style: GoogleFonts.inter(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
