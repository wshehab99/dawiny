import 'dart:async';
import 'package:find_doctor/bloc/api_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../bloc/app_states.dart';
import 'app_button.dart';
import 'custom_appbar.dart';

class GetLocation extends StatelessWidget {
  GetLocation({Key? key, required this.title}) : super(key: key);

  final String title;
  LatLng? location;
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: BlocConsumer<ApiCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ApiCubit cubit = ApiCubit.get(context);

          cubit.getLocation(value: location);
          location = ApiCubit.initialPosition;
          return Scaffold(
            appBar: CustomAppbar(context, titleText: title),
            body: ApiCubit.initialPosition == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        zoomControlsEnabled: false,
                        onTap: (value1) {
                          location = value1;
                          cubit.getLocation(value: location);
                        },
                        markers: {
                          Marker(
                            markerId: const MarkerId('1'),
                            position: ApiCubit.initialPosition!,
                          )
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
                      Positioned(
                        bottom: 15,
                        child: AppButton(
                            text: 'Select Location',
                            bottenColor: Colors.green,
                            textColor: Colors.white,
                            borderradius: BorderRadius.circular(35),
                            onPressed: () async {
                              List<Placemark> placemarks =
                                  await placemarkFromCoordinates(
                                      location!.latitude, location!.longitude);
                              Navigator.pop(context,
                                  "${placemarks[0].country}, ${placemarks[0].subLocality}, ${placemarks[0].street}");
                            }),
                      )
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
