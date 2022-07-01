import 'dart:async';
import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/screens/gridpage/app_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../bloc/app_cubit.dart';
import '../../bloc/app_states.dart';
import '../../shared/custom_appbar.dart';

class NurseLocation extends StatelessWidget {
  NurseLocation({
    Key? key,
  }) : super(key: key);

  LatLng? location;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.updateLocation();
          location = AppCubit.initialPosition;
          return Scaffold(
            drawer: const AppDrawer(),
            appBar: CustomAppbar(context, titleText: "Location"),
            body: AppCubit.initialPosition == null
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
