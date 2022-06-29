import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/appointments/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/custom_appbar.dart';

class ListOfAppointments extends StatelessWidget {
  const ListOfAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List shownAppointMint = [];
    return Scaffold(
      appBar: CustomAppbar(context, titleText: "My Appointments"),
      body: BlocProvider(
        create: (context) => AppCubit(InitialAppState()),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              AppCubit cubit = AppCubit.get(context);

              cubit.getMyAppintment().then(
                (value) {
                  shownAppointMint = value;
                },
              );
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (shownAppointMint.isEmpty) {
                return const Center(
                  child: Text("There is no appointment yet"),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: shownAppointMint.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AppointmentCard(
                            doctorName:
                                "${shownAppointMint[index]['doctor']['firstName']} ${shownAppointMint[index]['doctor']['lastName']}",
                            dateTime:
                                "${shownAppointMint[index]['appointment']['day'].toUpperCase()} ${shownAppointMint[index]['date']}",
                            startAppointment: shownAppointMint[index]
                                ['appointment']['start'],
                            endAppointment: shownAppointMint[index]
                                ['appointment']['end'],
                            type: "${shownAppointMint[index]['type']}",
                            onPressed: () {},
                          );
                        },
                        // separatorBuilder: (BuildContext context, int index) =>
                        //     const Divider(),
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
