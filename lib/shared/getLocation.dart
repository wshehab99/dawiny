import 'dart:async';
import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../bloc/app_states.dart';

class GetLocation extends StatelessWidget {
  GetLocation({Key? key, required this.title}) : super(key: key);

  final String title;

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          cubit.getLocation();
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),

            body: cubit.initialPosition == null
                ? Container()
                : GoogleMap(
                    markers: {
                      Marker(
                        markerId: MarkerId('1'),
                        position: cubit.initialPosition!,
                      )
                    },
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: cubit.initialPosition!,
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
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
