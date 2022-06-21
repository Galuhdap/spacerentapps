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
      home: MapSample(controller.data.lat, controller.data.lng),
    );
  }
}

class MapSample extends StatefulWidget {
  final double lat;
  final double lng;
  const MapSample(this.lat, this.lng);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  

  @override
  Widget build(BuildContext context) {
    List<Marker> _Marker = [
      Marker(markerId: MarkerId("1"), position: LatLng(widget.lat, widget.lng))
    ];

    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        markers: _Marker.toSet(),
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lng),
          zoom: 13.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final GoogleMapController controller = await _controller.future;
          controller.animateCamera(
              CameraUpdate.newCameraPosition( CameraPosition( target: LatLng(widget.lat, widget.lng), zoom: 18.0)
              ));
        },
        label: Text('To the Room!'),
        icon: Icon(Icons.room),
      ),
    );
  }
}
