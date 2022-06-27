import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/appointments/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfAppointments extends StatelessWidget {
  const ListOfAppointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context, titleText: "My Appointments"),

      body: BlocProvider(
        create: (context) => AppCubit(InitialAppState()),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            cubit.getMyAppintment();
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: cubit.myAppointments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return AppointmentCard(
                        doctorName:
                            "${cubit.myAppointments[index]['doctor']['firstName']} ${cubit.myAppointments[index]['doctor']['lastName']}",
                        dateTime:
                            "${cubit.myAppointments[index]['appointment']['day'].toUpperCase()} ${cubit.myAppointments[index]['date']}",
                        startAppointment: cubit.myAppointments[index]
                            ['appointment']['start'],
                        endAppointment: cubit.myAppointments[index]
                            ['appointment']['end'],
                        type: "${cubit.myAppointments[index]['type']}",
                        onPressed: () {
                          // setState(() {
                          //   appointments.removeAt(index);
                          //   print(appointments.length);
                          // });
                        },
                      );
                    },
                    // separatorBuilder: (BuildContext context, int index) =>
                    //     const Divider(),
                  ),
                ),
              ],
            );
          },
        ),

      ),
    );
  }
}
