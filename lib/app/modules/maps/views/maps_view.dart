import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maps_controller.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends GetView<MapsController> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(29.390946, 76.963502),
    zoom: 13.0,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(29.390946, 76.963502),
      tilt: 59.440717697143555,
      zoom: 13.0);

  List<Marker> _Marker = [
    Marker(markerId: MarkerId("1"), position: LatLng(29.390946, 76.963502))
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        markers: _Marker.toSet(),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(
              CameraUpdate.newLatLng(LatLng(29.390946, 76.963502)));
        },
        label: Text('To the Room!'),
        icon: Icon(Icons.room),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
