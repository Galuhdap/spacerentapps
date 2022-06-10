import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maps_controller.dart';

class MapsView extends GetView<MapsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MapsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MapsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
