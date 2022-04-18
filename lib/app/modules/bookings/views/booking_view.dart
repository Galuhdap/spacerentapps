import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BookingView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BookingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
