import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../shared/custom_appbar.dart';
import '../nurse_details/nurse_details.dart';
import 'package:custom_marker/marker_icon.dart';

class DoctorMap extends StatefulWidget {
  const DoctorMap({Key? key}) : super(key: key);

  @override
  State<DoctorMap> createState() => _DoctorMapState();
}

class _DoctorMapState extends State<DoctorMap> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _myLocation = CameraPosition(
    zoom: 18,
    tilt: 40,
    bearing: 15,
    target: LatLng(31.036648, 31.361835),
  );
  bool search = false;
  List<Marker> markers = <Marker>[];

  getMyLocation() async {
    markers.add(Marker(
      markerId: const MarkerId("0"),
      position: const LatLng(31.036648, 31.361835),
      infoWindow: const InfoWindow(
        title: "My Location",
      ),
      icon: await MarkerIcon.markerFromIcon(
          Icons.my_location_sharp, Colors.blue, 100),
    ));
  }

  searchNearby() {
    setState(() {
      markers.add(Marker(
        markerId: const MarkerId("3136166931035543"),
        position: const LatLng(31.035543, 31.361669),
        infoWindow: InfoWindow(
            title: "Dr.Waleed Bin Shehab",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseCardDatails(name: "Waleed Bin Shehab")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136166931035545"),
        position: const LatLng(31.036628, 31.362581),
        infoWindow: InfoWindow(
            title: "Dr.Mohammed Musa",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseCardDatails(name: "Mohammed Musa")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136166031035543"),
        position: const LatLng(31.038650, 31.363793),
        infoWindow: InfoWindow(
            title: "Dr.Morsy Ail",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseCardDatails(name: "Morsy")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136166031035545"),
        position: const LatLng(31.037262, 31.366379),
        infoWindow: InfoWindow(
            title: "Dr.Ahmed Mohammed",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseCardDatails(name: "Ahmed Mohammed")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136136931035543"),
        position: const LatLng(31.033217, 31.363504),
        infoWindow: InfoWindow(
            title: "Dr.Nader Ayad",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseCardDatails(name: "Nader")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3130166931035545"),
        position: const LatLng(31.033824, 31.356176),
        infoWindow: InfoWindow(
            title: "Dr.Ibraheem Tru",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseCardDatails(name: "Ibraheem")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136110031035543"),
        position: const LatLng(31.041794, 31.364384),
        infoWindow: InfoWindow(
            title: "Dr.Ayman",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseCardDatails(name: "Ayman")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136166055035545"),
        position: const LatLng(31.043439, 31.368300),
        infoWindow: InfoWindow(
            title: "Dr.Mostafa",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseCardDatails(name: "Mostafa")));
            }),
      ));
    });
  }

  @override
  void initState() {
    getMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, titleText: "Nearest Doctor"),
      body: GoogleMap(
        markers: Set.from(markers),
        initialCameraPosition: _myLocation,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          searchNearby();
        },
        label: const Text('Places Nearby'), // 3
        icon: const Icon(Icons.place), // 4
      ),
    );
  }
}
