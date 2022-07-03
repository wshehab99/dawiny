import 'dart:async';

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
  final List nurses;
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
      markerId: const MarkerId("0"),
      position:
          LatLng(widget.locationData.latitude!, widget.locationData.longitude!),
      infoWindow: const InfoWindow(
        title: "My Location",
      ),
      icon: await MarkerIcon.markerFromIcon(
          Icons.my_location_sharp, Colors.blue, 100),
    ));
  }

  searchNearby() {
    setState(() {
      for (var element in widget.nurses) {
        markers.add(Marker(
          markerId: MarkerId(element["_id"]),
          position:
              LatLng(element["location"]["lat"], element["location"]["lng"]),
          infoWindow: InfoWindow(
              title: "${element["firstName"]} ${element["lastName"]}",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NurseDetails(id: element["_id"])));
              }),
        ));
      }
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
