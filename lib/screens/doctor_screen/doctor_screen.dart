import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/screens/gridpage/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class Doctor_screen extends StatelessWidget {
  Doctor_screen({Key? key}) : super(key: key);
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    List shownAppointMint = [];
    return Scaffold(
      appBar: AppBar(title: const Text('My Appointments')),
      drawer: const AppDrawer(),
      body: BlocProvider(
        create: (context) => AppCubit(InitialAppState()),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              AppCubit cubit = AppCubit.get(context);

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
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.green.withOpacity(0.3),
                                  Colors.blue.withOpacity(0.3),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8.0, color: Colors.blue[50]!)
                              ],
                            ),
                            child: Column(
                              children: [
                                Text(
                                  "Patient Id : ${shownAppointMint[index]['patientId']}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue[600],
                                      fontWeight: FontWeight.bold,
                                      height: 1.2),
                                ),
                                Text(
                                  "Type : ${shownAppointMint[index]['type']}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue[600],
                                      fontWeight: FontWeight.bold,
                                      height: 1.2),
                                ),
                                Text(
                                  "Date : ${shownAppointMint[index]['date']}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.blue[600],
                                      fontWeight: FontWeight.bold,
                                      height: 1.2),
                                ),
                              ],
                            ),
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
