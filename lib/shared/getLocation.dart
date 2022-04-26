import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GetLocation extends StatefulWidget {
  const GetLocation({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GetLocation> createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  int _counter = 0;
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  LatLng? initialPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    bool _serviceEnabled = await location.serviceEnabled();
    PermissionStatus _permissionGranted = await location.hasPermission();
    LocationData _locationData;

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    if (_serviceEnabled && _permissionGranted == PermissionStatus.granted) {
      _locationData = await location.getLocation();
      // var cntrl = await _controller.future;
      // cntrl.animateCamera(CameraUpdate.newLatLng(
      //     LatLng(_locationData.latitude!, _locationData.longitude!)));
      setState(() {
        initialPosition =
            LatLng(_locationData.latitude!, _locationData.longitude!);
      });
    }
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: initialPosition == null
          ? Container()
          : GoogleMap(
              markers: {
                Marker(
                  markerId: MarkerId('1'),
                  position: initialPosition!,
                )
              },
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: initialPosition!,
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
    );
  }
}
