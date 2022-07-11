import 'package:find_doctor/bloc/api_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/appointments/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import '../../shared/custom_appbar.dart';

class ListOfAppointments extends StatelessWidget {
  ListOfAppointments({Key? key}) : super(key: key);
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List shownAppointMint = [];
    return Scaffold(
      appBar: CustomAppbar(context, titleText: "My Appointments"),
      body: BlocProvider(
        create: (context) => ApiCubit(InitialAppState()),
        child: BlocConsumer<ApiCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              ApiCubit cubit = ApiCubit.get(context);

              cubit.filterAppointments(now);
              shownAppointMint = cubit.shownAppointments;

              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  children: [
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: DatePicker(
                        DateTime.now(),
                        initialSelectedDate: now,
                        selectionColor: Colors.blue,
                        selectedTextColor: Colors.white,
                        onDateChange: (date) {
                          cubit.dateCount = 0;
                          now = date;
                          cubit.filterAppointments(date);
                        },
                      ),
                    ),
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
