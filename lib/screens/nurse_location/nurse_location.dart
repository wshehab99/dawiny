import 'dart:async';
import 'package:custom_marker/marker_icon.dart';
import 'package:find_doctor/bloc/api_cubit.dart';

import 'package:find_doctor/screens/gridpage/app_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bloc/app_states.dart';

class NurseLocation extends StatelessWidget {
  NurseLocation({
    Key? key,
  }) : super(key: key);
  BitmapDescriptor? myIcone;
  Future getIcon() async {
    myIcone = await MarkerIcon.markerFromIcon(
        Icons.my_location_sharp, Colors.blue, 70);
  }

  LatLng? location;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    getIcon();
    return BlocProvider(
      child: BlocConsumer<ApiCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ApiCubit cubit = ApiCubit.get(context);
          cubit.updateLocation();
          location = ApiCubit.initialPosition;
          return Scaffold(
            drawer: const AppDrawer(),
            appBar: AppBar(title: const Text("Location"), centerTitle: true),
            body: ApiCubit.initialPosition == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        zoomControlsEnabled: false,
                        markers: {
                          Marker(
                              markerId: const MarkerId('1'),
                              position: ApiCubit.initialPosition!,
                              infoWindow: const InfoWindow(title: 'My Loction'),
                              icon: myIcone ?? BitmapDescriptor.defaultMarker)
                        },
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: ApiCubit.initialPosition!,
                          zoom: 14.4746,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ],
                  ),
          );
        },
      ),
      create: (context) {
        return ApiCubit(InitialAppState());
      },
    );
  }
}
