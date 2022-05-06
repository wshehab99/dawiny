import 'dart:async';
import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/screens/nursing_task/nursing_tasks_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/app_states.dart';
import 'app_button.dart';

class GetLocation extends StatelessWidget {
  GetLocation({Key? key, required this.title}) : super(key: key);

  final String title;
  LatLng? value;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);

          cubit.getLocation(value: value);
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: AppCubit.initialPosition == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        zoomControlsEnabled: false,
                        onTap: (value1) {
                          value = value1;
                          cubit.getLocation(value: value);
                        },
                        markers: {
                          Marker(
                            markerId: const MarkerId('1'),
                            position: AppCubit.initialPosition!,
                          )
                        },
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: AppCubit.initialPosition!,
                          zoom: 14.4746,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                      Positioned(
                        bottom: 15,
                        child: AppButton(
                          text: 'Select Location',
                          bottenColor: Colors.blue,
                          textColor: Colors.white,
                          borderradius: BorderRadius.circular(35),
                          onPressed: AppCubit.initialPosition == null
                              ? null
                              : () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const NursingTasksScreen()));
                                },
                        ),
                      )
                    ],
                  ),
          );
        },
      ),
      create: (context) {
        return AppCubit(InitialAppState());
      },
    );
  }
}
