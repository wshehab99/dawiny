import 'dart:async';

import 'package:find_doctor/model/nurse.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../shared/custom_appbar.dart';
import '../nurse_details/nurse_details.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NurseMap extends StatefulWidget {
  const NurseMap({Key? key, required this.nurses, required this.locationData})
      : super(key: key);
  final List<Nurse> nurses;
  final LocationData locationData;
  @override
  State<NurseMap> createState() => _NurseMapState();
}

class _NurseMapState extends State<NurseMap> {
  final Completer<GoogleMapController> _controller = Completer();

  bool search = false;
  List<Marker> markers = <Marker>[];

  getMyLocation() async {
    markers.add(Marker(
      markerId: MarkerId("0"),
      position:
          LatLng(widget.locationData.latitude!, widget.locationData.longitude!),
      infoWindow: InfoWindow(
        title: "My Location",
      ),
      icon: await MarkerIcon.markerFromIcon(
          Icons.my_location_sharp, Colors.blue, 100),
    ));
  }

  searchNearby() {
    setState(() {
      widget.nurses.forEach((element) {
        markers.add(Marker(
          markerId: MarkerId(element.id),
          position: LatLng(element.location.lat, element.location.lng),
          infoWindow: InfoWindow(
              title: "${element.firstName} ${element.lastName}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NurseDetails(
                            name: "${element.firstName} ${element.lastName}")));
              }),
        ));
      });

      // markers.add(Marker(
      //   markerId: const MarkerId("3136166931035543"),
      //   position: const LatLng(31.035543, 31.361669),
      //   infoWindow: InfoWindow(
      //       title: "Waleed Bin Shehab",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) =>
      //                     NurseDetails(name: "Waleed Bin Shehab")));
      //       }),
      // ));

      // markers.add(Marker(
      //   markerId: const MarkerId("3136166931035545"),
      //   position: const LatLng(31.036628, 31.362581),
      //   infoWindow: InfoWindow(
      //       title: "Eman Ali",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) =>
      //                     NurseDetails(name: "Mohammed Musa")));
      //       }),
      // ));
      // markers.add(Marker(
      //   markerId: const MarkerId("3136166031035543"),
      //   position: const LatLng(31.038650, 31.363793),
      //   infoWindow: InfoWindow(
      //       title: "Morsy",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => NurseDetails(name: "Morsy")));
      //       }),
      // ));
      // markers.add(Marker(
      //   markerId: const MarkerId("3136166031035545"),
      //   position: const LatLng(31.037262, 31.366379),
      //   infoWindow: InfoWindow(
      //       title: "Ahmed Mohammed",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) =>
      //                     NurseDetails(name: "Ahmed Mohammed")));
      //       }),
      // ));
      // markers.add(Marker(
      //   markerId: const MarkerId("3136136931035543"),
      //   position: const LatLng(31.033217, 31.363504),
      //   infoWindow: InfoWindow(
      //       title: "Nader",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => NurseDetails(name: "Nader")));
      //       }),
      // ));
      // markers.add(Marker(
      //   markerId: const MarkerId("3130166931035545"),
      //   position: const LatLng(31.033824, 31.356176),
      //   infoWindow: InfoWindow(
      //       title: "Ibraheem",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => NurseDetails(name: "Ibraheem")));
      //       }),
      // ));
      // markers.add(Marker(
      //   markerId: const MarkerId("3136110031035543"),
      //   position: const LatLng(31.041794, 31.364384),
      //   infoWindow: InfoWindow(
      //       title: "Ayman",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => NurseDetails(name: "Ayman")));
      //       }),
      // ));
      // markers.add(Marker(
      //   markerId: const MarkerId("3136166055035545"),
      //   position: const LatLng(31.043439, 31.368300),
      //   infoWindow: InfoWindow(
      //       title: "Mostafa",
      //       onTap: () {
      //         Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => NurseDetails(name: "Mostafa")));
      //       }),
      // ));
    });
  }

  @override
  void initState() {
    getMyLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => AppCubit(InitialAppState())),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: ((context, state) {}),
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            final CameraPosition _myLocation = CameraPosition(
              zoom: 18,
              tilt: 40,
              bearing: 15,
              target: LatLng(widget.locationData.latitude!,
                  widget.locationData.longitude!),
            );

            return Scaffold(
              appBar: CustomAppbar(context, titleText: "Nearest Nurses"),
              body: GoogleMap(
                markers: Set.from(markers),
                initialCameraPosition: _myLocation,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Colors.green.withOpacity(0.7),
                onPressed: () {
                  searchNearby();
                },
                label: const Text('Places Nearby'), // 3
                icon: const Icon(Icons.place), // 4
              ),
            );
          }),
    );
  }
}
