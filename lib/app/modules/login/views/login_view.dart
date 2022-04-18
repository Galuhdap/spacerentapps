import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacerent_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff74B9FF),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 150, 40, 40),
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
              SizedBox(
                height: 50,
              ),
              InkWell(
                  onTap: () {
                    controller.loading();
                  },
                  child: Obx(
                    () => controller.isLoading.value
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Container(
                            width: 280,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 37, 37),
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 55, right: 10),
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/img/icongoogle.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 17,
                                  ),
                                  Text(
                                    'Login with Google',
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
