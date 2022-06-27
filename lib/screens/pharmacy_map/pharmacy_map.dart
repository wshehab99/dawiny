import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../nurse_details/nurse_details.dart';
import 'package:custom_marker/marker_icon.dart';

class PharmacyMap extends StatefulWidget {
  const PharmacyMap({Key? key}) : super(key: key);

  @override
  State<PharmacyMap> createState() => _PharmacyMapState();
}

class _PharmacyMapState extends State<PharmacyMap> {
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
      markerId: const MarkerId("31.037577, 31.3613745"),
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
        position: const LatLng(31.037395, 31.362504),
        infoWindow: InfoWindow(
            title: "Altarshouby",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseDetals(name: "Altarshouby")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136166931035545"),
        position: const LatLng(31.037055, 31.363384),
        infoWindow: InfoWindow(
            title: "Alaraby",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseDetals(name: "AlArrabi")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136166031035543"),
        position: const LatLng(31.036577, 31.362676),
        infoWindow: InfoWindow(
            title: "AlAyman",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseDetals(name: "AlAyman")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136166031035545"),
        position: const LatLng(31.036605, 31.361077),
        infoWindow: InfoWindow(
            title: "AlSeddiq",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseDetals(name: "Alsadeeq")));
            }),
      ));
      markers.add(
        Marker(
            markerId: const MarkerId("3136136931035543"),
            position: const LatLng(31.037120, 31.360455),
            infoWindow: const InfoWindow(title: "Sali"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseDetals(name: "Sali")));
            }),
      );
      markers.add(Marker(
        markerId: const MarkerId("3130166931035545"),
        position: const LatLng(31.036506, 31.360044),
        infoWindow: InfoWindow(
            title: "Mekkawi",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NurseDetals(name: "Mekkawi")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("3136110031035543"),
        position: const LatLng(31.036230, 31.360643),
        infoWindow: InfoWindow(
            title: "Hussein Pharmacy",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseDetals(name: "Hussein Pharmacy")));
            }),
      ));
      markers.add(Marker(
          markerId: const MarkerId("3136166055035545"),
          position: const LatLng(31.036711, 31.364141),
          infoWindow: InfoWindow(
              title: "AlMenawi Pharmacy",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NurseDetals(name: "AlMenawi Pharmacy")));
              })));
      markers.add(Marker(
        markerId: const MarkerId("31.039241, 31.362951"),
        position: const LatLng(31.039241, 31.362951),
        infoWindow: InfoWindow(
            title: "Atef Pharmacy",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseDetals(name: "Atef Pharmacy")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("31.038570, 31.364088"),
        position: const LatLng(31.038570, 31.364088),
        infoWindow: InfoWindow(
            title: "Roshdy Pharmacy",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseDetals(name: "Roshdy Pharmacy")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("31.037789, 31.365386"),
        position: const LatLng(31.037789, 31.365386),
        infoWindow: InfoWindow(
            title: "Al Abdualateef Pharmacy",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseDetals(name: "Al Abdualateef Pharmacy")));
            }),
      ));
      markers.add(Marker(
        markerId: const MarkerId("31.037063, 31.366223"),
        position: const LatLng(31.037063, 31.366223),
        infoWindow: InfoWindow(
            title: "Dr. AbdElmonaem Pharmcy",
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseDetals(name: "Dr. AbdElmonaem Pharmcy")));
            }),
      ));
      markers.add(
        Marker(
            markerId: const MarkerId("31.037320, 31.364185"),
            position: const LatLng(31.037320, 31.364185),
            infoWindow: const InfoWindow(title: "AlSemaa Pharmacy"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NurseDetals(name: "AlSemaa Pharmacy")));
            }),
      );
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
      appBar: AppBar(title: const Text("Nearest Pharmaceis")),
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
