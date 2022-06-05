import 'package:find_doctor/shared/CustomRow.dart';
import 'package:find_doctor/shared/textFieldApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorkDay {
  final String day;
  final TextEditingController from = TextEditingController();
  final TextEditingController to = TextEditingController();

  WorkDay({
    required this.day,
  });
}

class DoctorTime extends StatefulWidget {
  DoctorTime({
    Key? key,
    this.isCheked,
    this.onPress,
  }) : super(key: key);
  bool? isCheked;
  void Function(bool? value)? onPress;

  @override
  State<DoctorTime> createState() => _DoctorTimeState();
}

class _DoctorTimeState extends State<DoctorTime> {
  //TextEditingController _txtTimeController = TextEditingController();
  // final MaskTextInputFormatter _timeMaskFormatter =
  //     MaskTextInputFormatter(mask: '##:##:##', filter: {"#": RegExp(r'[0-9]')});

  final TextEditingController _time = TextEditingController();
  String? dayName;

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
                type: const TextInputType.numberWithOptions(decimal: false),
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
                              onTimerDurationChanged: (value) {},
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Ok")),
                            ElevatedButton(
                                onPressed: () {
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
                    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>${days[0].from.text}");
                    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>${days[1].from.text}");
                  },
                  child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
