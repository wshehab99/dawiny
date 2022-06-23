import 'package:find_doctor/bloc/app_cubit.dart';
import 'package:find_doctor/bloc/app_states.dart';
import 'package:find_doctor/shared/CustomRow.dart';
import 'package:find_doctor/shared/textFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkDay {
  final String day;
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();

  WorkDay({
    required this.day,
  });
}

class DoctorTime extends StatelessWidget {
  DoctorTime({
    Key? key,
    this.isCheked,
    this.onPress,
  }) : super(key: key);
  bool? isCheked;
  void Function(bool? value)? onPress;

  final TextEditingController _time = TextEditingController();
  String? dayName;
  Duration? selected;
  List<WorkDay> days = [
    WorkDay(day: "Satrday"),
    WorkDay(day: "Sunday"),
    WorkDay(day: "Monday"),
    WorkDay(day: "Tuseday"),
    WorkDay(day: "wensday"),
    WorkDay(day: "Tharsday"),
    WorkDay(day: "Friday"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(InitialAppState()),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: TeriaqTextField(
                      hint: "Time by minutes",
                      controller: _time,
                      type:
                          const TextInputType.numberWithOptions(decimal: false),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: SizedBox(
                                  width: 300,
                                  height: 300,
                                  child: CupertinoTimerPicker(
                                    mode: CupertinoTimerPickerMode.ms,
                                    onTimerDurationChanged: (value) {
                                      selected = value;
                                      _time.text =
                                          value.toString().substring(2, 7);
                                    },
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok")),
                                  ElevatedButton(
                                      onPressed: () {
                                        _time.clear();
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel")),
                                ],
                              );
                            });
                      },
                      label: "Time",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          return CustomRow(
                            day: days[index].day,
                            from: days[index].from,
                            to: days[index].to,
                          );
                        }),
                  ),
                  Center(
                    child: ElevatedButton(
                        onPressed: () {
                          Map dates = {
                            "sat": {
                              "from": days[0].from.text,
                              "to": days[0].to.text
                            },
                            "sun": {
                              "from": days[1].from.text,
                              "to": days[1].to.text
                            },
                            "mon": {
                              "from": days[2].from.text,
                              "to": days[2].to.text
                            },
                            "tus": {
                              "from": days[3].from.text,
                              "to": days[3].to.text
                            },
                            "wed": {
                              "from": days[4].from.text,
                              "to": days[4].to.text
                            },
                            "thu": {
                              "from": days[5].from.text,
                              "to": days[5].to.text
                            },
                            "fri": {
                              "from": days[6].from.text,
                              "to": days[6].to.text
                            },
                          };
                          cubit.avalibaleDates(
                              dates: dates, interval: selected!.inSeconds);

                          print(
                              ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>${days[0].from.text}");
                          print(
                              ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>${days[1].from.text}");
                        },
                        child: const Text('Submit')),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
